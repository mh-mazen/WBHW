
using System.ComponentModel.DataAnnotations;

namespace OrphansHome.Database.Handlers
{
    public class User
    {
        [Key]
        public int UID { get; set; }

        public string FirstName { get; set; }

        public string SurName { get; set; }

        public string FullName { get; set; }

        public string EmailAddress { get; set; }

        public string PhoneNumber { get; set; }

        public string UserName { get; set; }

        public string PasswordHash { get; set; }

        public string RoleName { get; set; }
    }
    public class Donation
    {
        [Key]
        public int DID { get; set; }

        public int OID { get; set; }

        public string FullName { get; set; }

        public string EmailAddress { get; set; }

        public string PhoneNumber { get; set; }

        public string Address { get; set; }

        public int TID { get; set; }

        public int DOID { get; set; }

        public bool IsCollected { get; set; }
    }
    public class DonationType
    {
        [Key]
        public int TID { get; set; }

        public bool Money { get; set; }

        public bool Supplies { get; set; }

        public static string GetString(int req)
        {
            switch (req)
            {
                case 1: return "مادي";
                case 2: return "مواد";
                case 3: return "مادي ومواد";
                default: return "مادي";
            }
        }
    }
    public class DonationDeliveryOption
    {
        [Key]
        public int DOID { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }

        public static string GetString(int del)
        {
            switch (del)
            {
                case 1: return "شخصي";
                case 2: return "حوالة بنكية";
                case 3: return "وساطة";
                default: return "شخصي";
            }
        }
    }
    public class Orphanage
    {
        [Key]
        public int OID { get; set; }

        public int MID { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }

        public string Address { get; set; }

        public int NumOfOrphans { get; set; }

        public int NumOfStaff { get; set; }

        public string MailAddress { get; set; }

        public string PhoneNumber { get; set; }

        public string EmailAddress { get; set; }

        public float MapLat { get; set; }

        public float MapLng { get; set; }

        public int MapZoom { get; set; }

        public string ImageName { get; set; }
    }
    public class Requirements
    {
        [Key]
        public int RQID { get; set; }

        public string Description { get; set; }

        public int TID { get; set; }

        public bool IsDone { get; set; }

        public int OID { get; set; }

    }
    public class Roles
    {
        [Key]
        public int RID { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }
    }
    public class UserRoles
    {
        [Key]
        public int UID { get; set; }
        [Key]
        public int RID { get; set; }
    }
}