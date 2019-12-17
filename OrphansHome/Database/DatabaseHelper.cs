using OrphansHome.Database.Handlers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace OrphansHome.Database
{
    public class DatabaseHelper
    {
        // source : https://devblogs.microsoft.com/csharpfaq/how-do-i-calculate-a-md5-hash-from-a-string/
        public static string CalculateMD5Hash(string input)
        {
            MD5 md5 = MD5.Create();
            byte[] inputBytes = System.Text.Encoding.ASCII.GetBytes(input);
            byte[] hash = md5.ComputeHash(inputBytes);

            StringBuilder sb = new StringBuilder();
            for (int i = 0; i < hash.Length; i++)
            {
                sb.Append(hash[i].ToString("X2"));
            }
            return sb.ToString().ToLower();
        }

        public static bool Login(string userName, string password)
        {
            var user = DatabaseCommands.Select(new User { UserName = userName, PasswordHash = CalculateMD5Hash(password) });
            if (user != null)
            {
                HttpContext.Current.Session["LoginUser"] = user;
                return true;
            }
            return false;
        }
        public static List<Orphanage> Orphanage_GetAll()
        {
            return DatabaseCommands.Select();
        }
        public static Orphanage Orphanage_Get(int oid)
        {
            return DatabaseCommands.Select(oid, 0);
        }
        public static User User_Get(int uid)
        {
            return DatabaseCommands.Select(new User { UID = uid });
        }
        public static bool User_Add(User user)
        {
            return DatabaseCommands.Insert(user);
        }
        public static List<User> User_GetAll()
        {
            return DatabaseCommands.Select(false);
        }
        public static bool User_Manager_Free()
        {
            return DatabaseCommands.Select(0) > 0;
        }
        public static List<Requirements> Requirement_GetAll(int oid)
        {
            return DatabaseCommands.Select(new Orphanage { OID = oid });
        }
        public static bool Donation_Add(Donation donation)
        {
            return DatabaseCommands.Insert(donation);
        }
        public static bool Requirements_Add(Requirements requirements, int uid)
        {
            requirements.OID = DatabaseCommands.Select(0, uid).OID;
            return DatabaseCommands.Insert(requirements);
        }
        public static bool Orphanage_Add(Orphanage orphanage)
        {
            return DatabaseCommands.Insert(orphanage);
        }
        public static List<Donation> Donation_GetAll(int mid)
        {
            return DatabaseCommands.Select(new User { UID = mid }, false);
        }
        public static bool Donation_SetDone(int did, bool done)
        {
            return DatabaseCommands.Update(new Donation { IsCollected = done, DID = did });
        }
        public static bool Orphanage_Update(Orphanage orphanage)
        {
            return DatabaseCommands.Update(orphanage);
        }
        public static bool User_Update(User user)
        {
            return DatabaseCommands.Update(user);
        }
    }
}