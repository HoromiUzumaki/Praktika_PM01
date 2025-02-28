using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1
{
    public interface IAuthService
    {
        string Authenticate(string username, string password);
        string AuthenticateWith2FA(string username, string token);
    }

    public class AuthService : IAuthService
    {
        private readonly List<Users> _users = new List<Users>
    {
        new Users { UserID = 1, Username = "admin", PasswordHash = "hashed_password_1", RoleID = 1 },
        new Users { UserID = 2, Username = "storekeeper", PasswordHash = "hashed_password_2", RoleID = 2 }
    };

        public string Authenticate(string username, string password)
        {
            var user = _users.SingleOrDefault(u => u.Username == username && u.PasswordHash == password);
            if (user == null)
                return null;

            // Генерация JWT-токена (упрощенно)
            return "generated_jwt_token";
        }

        public string AuthenticateWith2FA(string username, string token)
        {
            var user = _users.SingleOrDefault(u => u.Username == username);
            if (user == null || token != "valid_2fa_token")
                return null;

            // Генерация JWT-токена (упрощенно)
            return "generated_jwt_token";
        }
    }
}