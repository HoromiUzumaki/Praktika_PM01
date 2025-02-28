using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class Response_Users
    {
        public Response_Users(Users юзер)
        {
            UserID = юзер.UserID;
            Username = юзер.Username;
            PasswordHash = юзер.PasswordHash;
            Email = юзер.Email;
            Phone = юзер.Phone;
            FullName = юзер.FullName;
            RoleID = юзер.RoleID;
            TwoFactorSecret = юзер.TwoFactorSecret;



        }
        public int UserID { get; set; }
        public string Username { get; set; }
        public string PasswordHash { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string FullName { get; set; }
        public int RoleID { get; set; }
        public string TwoFactorSecret { get; set; }
    }
}