using System;
using System.Collections.Generic;
using System.Linq;
using System.Data.SqlClient;
using System.Web;
using System.Security.Cryptography;
using System.Text;
using System.Data;
using System.ComponentModel.DataAnnotations;
namespace OrphansHome.Database.Handlers
{
    public class DatabaseCommands
    {
        private static readonly string ConnectionString = "Data Source=(localdb)\\local;Initial Catalog=OrphanHomeDb;Integrated Security=True";
        //private static readonly string ConnectionString = "Data Source=SQL5041.site4now.net;Initial Catalog=DB_A50E62_db;User Id=DB_A50E62_db_admin;Password=Thezxc123321;";
        private static readonly string selectCommand = "SELECT {0} FROM {1} WHERE {2}";
        private static readonly string selectCommandNoCondition = "SELECT {0} FROM {1}";
        private static readonly string insertCommandAll = "INSERT INTO [{0}] VALUES ({1})";
        private static readonly string insertCommand = "INSERT ({0}) INTO [{1}] VALUES ({2})";
        private static readonly string updateCommand = "UPDATE [{0}] Set {1} WHERE {2}";

        private static SqlConnection SqlConnection = new SqlConnection(ConnectionString);
        private static SqlCommand SqlCommand = new SqlCommand("", SqlConnection);

        private static bool ExecuteNonQuery(string sql)
        {
            SqlConnection.Open();
            SqlCommand.CommandText = sql;
            bool result = SqlCommand.ExecuteNonQuery() > 0;
            SqlConnection.Close();
            return result;
        }
        private static object ExecuteScalar(string sql)
        {
            SqlConnection.Open();
            SqlCommand.CommandText = sql;
            var result = SqlCommand.ExecuteScalar();
            SqlConnection.Close();
            return result;
        }
        private static object ExecuteReader(string sql, object model)
        {
            SqlConnection.Open();
            SqlCommand.CommandText = sql;
            SqlDataReader reader = SqlCommand.ExecuteReader();
            object result = null;
            if (reader.Read())
                result = (ConvertSetToModel(reader, model));
            SqlConnection.Close();
            return result;
        }
        private static DataTable ExecuteDataTable(string sql)
        {
            SqlConnection.Open();
            SqlCommand.CommandText = sql;
            SqlDataAdapter adapt = new SqlDataAdapter(SqlCommand);
            DataSet ds = new DataSet();
            adapt.Fill(ds);
            SqlConnection.Close();
            return ds.Tables[0];
        }
        // source: https://forums.asp.net/t/1714894.aspx?How+to+convert+a+SqlDataReader+object+to+a+certain+model+object+
        private static object ConvertSetToModel(SqlDataReader reader, object model)
        {
            foreach (var item in model.GetType().GetProperties())
            {
                model.GetType().GetProperty(item.Name).SetValue(model,
                    Convert.ChangeType(reader[item.Name], item.PropertyType), null);
            }
            return model;
        }
        private static object ConvertSetToModel(DataRow dataRow, object model)
        {
            foreach (var item in model.GetType().GetProperties())
            {
                model.GetType().GetProperty(item.Name).SetValue(model,
                    Convert.ChangeType(dataRow[item.Name], item.PropertyType), null);
            }
            return model;
        }
        private static string GetKeysOrValues(char seperator, object model, KeyOptions keyOptions)
        {
            string result = string.Empty;
            foreach (var item in model.GetType().GetProperties())
            {
                if ((keyOptions.SkipPK && Attribute.IsDefined(item, typeof(KeyAttribute)))
                    || keyOptions.Exclude.Contains(item.Name))
                    continue;
                bool appendQuotes = item.PropertyType == typeof(string) || item.PropertyType == typeof(bool);
                if (keyOptions.EqualFormat)
                    result += string.Format("{0}{1}{2}", item.Name, '=', appendQuotes ? string.Format("N\'{0}\' ", item.GetValue(model)) : item.GetValue(model));
                else
                    result += keyOptions.Values ? appendQuotes ? string.Format("N\'{0}\'", item.GetValue(model)) : item.GetValue(model)
                        : appendQuotes ? string.Format("N\'{0}\'", item.Name) : item.Name;
                result += seperator;
            }
            return result.TrimEnd(seperator);
        }
        public static User Select(User user)
        {
            string sql = "";
            if (user.UID > 0)
                sql = string.Format(selectCommand, "[User].* ,Roles.Name as RoleName",
                   string.Format("[{0}],[{1}],[{2}]", typeof(User).Name, typeof(Roles).Name, typeof(UserRoles).Name),
                   string.Format("[User].UID={0} and [User].UID = [UserRoles].UID and [Roles].RID = [UserRoles].RID", user.UID));
            else
                sql = string.Format(selectCommand, "[User].* ,Roles.Name as RoleName",
                   string.Format("[{0}],[{1}],[{2}]", typeof(User).Name, typeof(Roles).Name, typeof(UserRoles).Name),
                   string.Format("UserName=\'{0}\' and PasswordHash=\'{1}\' and [User].UID = [UserRoles].UID and [Roles].RID = [UserRoles].RID", user.UserName, user.PasswordHash));
            return (User)ExecuteReader(sql, new User());
        }
        public static List<Orphanage> Select()
        {
            string sql = string.Format(selectCommandNoCondition, "[Orphanage].*", string.Format("[{0}]", typeof(Orphanage).Name));
            List<Orphanage> orphanages = new List<Orphanage>();
            foreach (DataRow rw in ExecuteDataTable(sql).Rows)
                orphanages.Add((Orphanage)ConvertSetToModel(rw, new Orphanage()));
            return orphanages;
        }
        public static List<User> Select(bool admin)
        {
            string sql = string.Format(selectCommand, "[User].* ,Roles.Name as RoleName",
                    string.Format("[{0}],[{1}],[{2}]", typeof(User).Name, typeof(Roles).Name, typeof(UserRoles).Name),
                    "[User].UID = [UserRoles].UID and [Roles].RID = [UserRoles].RID");
            List<User> users = new List<User>();
            foreach (DataRow rw in ExecuteDataTable(sql).Rows)
            {
                var user = (User)ConvertSetToModel(rw, new User());
                if (!admin && user.RoleName != "admin")
                    users.Add(user);
            }
            return users;
        }
        public static int Select(int l)
        {
            string sql = "SELECT count(*) From [User] as usr where UID not in (select UID from Orphanage where MID = usr.UID) and usr.UID !=2";
            return (int)ExecuteScalar(sql);
        }
        public static int Select(string username)
        {
            string sql = string.Format("SELECT UID From [User] WHERE [UserName]=\'{0}\'", username);
            return (int)ExecuteScalar(sql);
        }
        public static Orphanage Select(int oid, int mid)
        {
            string sql = "";
            if (oid > 0)
                sql = string.Format(selectCommand, "[Orphanage].*", string.Format("[{0}]", typeof(Orphanage).Name)
                   , string.Format("OID={0}", oid));

            if (mid > 0)
                sql = string.Format(selectCommand, "[Orphanage].*", string.Format("[{0}]", typeof(Orphanage).Name)
                  , string.Format("MID={0}", mid));

            return !string.IsNullOrEmpty(sql) ? (Orphanage)ExecuteReader(sql, new Orphanage()) : null;
        }
        public static List<Requirements> Select(Orphanage oid)
        {
            string sql = string.Format(selectCommand, "[Requirements].*", string.Format("[{0}]", typeof(Requirements).Name)
                , string.Format("OID={0} And IsDone=\'False\'", oid.OID));
            List<Requirements> requirements = new List<Requirements>();
            foreach (DataRow rw in ExecuteDataTable(sql).Rows)
                requirements.Add((Requirements)ConvertSetToModel(rw, new Requirements()));
            return requirements;
        }
        public static List<Donation> Select(User user, bool search)
        {
            string sql = string.Format(selectCommand, "[Donation].*", string.Format("[{0}]", typeof(Donation).Name)
                , string.Format("OID={0}", Select(0, user.UID).OID));
            List<Donation> donations = new List<Donation>();
            foreach (DataRow rw in ExecuteDataTable(sql).Rows)
                donations.Add((Donation)ConvertSetToModel(rw, new Donation()));
            return donations;
        }
        public static bool Insert(Donation donation)
        {
            string sql = string.Format(insertCommandAll, typeof(Donation).Name,
                GetKeysOrValues(',', donation, new KeyOptions { Values = true, SkipPK = true }));
            return ExecuteNonQuery(sql);
        }
        public static bool Insert(Orphanage orphanage)
        {
            string sql = string.Format(insertCommandAll, typeof(Orphanage).Name,
                GetKeysOrValues(',', orphanage, new KeyOptions { Values = true, SkipPK = true }));
            return ExecuteNonQuery(sql);
        }
        public static bool Insert(Requirements requirements)
        {
            string sql = string.Format(insertCommandAll, typeof(Requirements).Name,
                GetKeysOrValues(',', requirements, new KeyOptions { Values = true, SkipPK = true }));
            return ExecuteNonQuery(sql);
        }
        public static bool Insert(User user)
        {
            string sql = string.Format(insertCommandAll, typeof(User).Name,
                GetKeysOrValues(',', user, new KeyOptions { Values = true, SkipPK = true, Exclude = new[] { "RoleName" } }));
            ExecuteNonQuery(sql);
            sql = string.Format("INSERT INTO UserRoles (RID,UID) VALUES (2,{0})", Select(user.UserName));
            return ExecuteNonQuery(sql);
        }
        public static bool Update(Donation donation)
        {
            string sql = string.Format(updateCommand, typeof(Donation).Name,
                string.Format("IsCollected=\'{0}\'", donation.IsCollected),
                string.Format("DID={0}", donation.DID));
            return ExecuteNonQuery(sql);
        }
        public static bool Update(Orphanage orphanage)
        {
            string sql = string.Format(updateCommand, typeof(Orphanage).Name,
                GetKeysOrValues(',', orphanage, new KeyOptions { EqualFormat = true, SkipPK = true }),
                string.Format("OID={0}", orphanage.OID));
            return ExecuteNonQuery(sql);
        }
        public static bool Update(User user)
        {
            string sql = string.Format(updateCommand, typeof(User).Name,
                GetKeysOrValues(',', user, new KeyOptions { EqualFormat = true, SkipPK = true, Exclude = new[] { "RoleName" } }),
                string.Format("UID={0}", user.UID));
            return ExecuteNonQuery(sql);
        }
    }
}
class KeyOptions
{
    public bool Values { get; set; }
    public bool SkipPK { get; set; }
    public bool EqualFormat { get; set; }
    public string[] Exclude { get; set; }
}