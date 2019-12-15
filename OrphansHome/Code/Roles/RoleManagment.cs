﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OrphansHome
{
    public class RoleLink
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string Link { get; set; }
        public string Icon { get; set; }
    }
    public class RoleManagment
    {
        private static List<RoleLink> RolesLinks = new List<RoleLink>
        {
          new RoleLink {ID = 1,Name = "ادارة المياتم",Link = "/Pages/Homes/Manage/ManageList.aspx", Icon="home" },
          new RoleLink  {ID=2,Name="ادارة المستخدمين",Link = "/Pages/Users/Manage/UserList.aspx",Icon="user" },
          new RoleLink  {ID = 3,Name = "تقارير" ,Link =  "/Pages/Reports/List.aspx",Icon="paper-plane" },
          new RoleLink {ID=4,Name = "عرض التبرعات", Link="/Pages/Donation/List.aspx",Icon="briefcase"},
          new RoleLink {ID=5,Name="اضافة احتياجات",Link ="/Pages/Requirements/Add.aspx",Icon="plus"}
        };
        public static List<RoleLink> GetRoles(string role)
        {
            switch (role)
            {
                case "admin":
                    return RolesLinks.Where(x => (new int[] { 1, 2, 3 }).Contains(x.ID)).ToList();
                case "manager":
                    return RolesLinks.Where(x => (new int[] { 4, 5 }).Contains(x.ID)).ToList();
                case "user":
                    break;
            }
            return new List<RoleLink>();
        }
        public static bool HasAccess(string page, string rolename)
        {
            foreach (var item in RolesLinks)
                if (item.Link == page && GetRoles(rolename).Contains(item))
                    return true;
            return false;
        }
    }
}