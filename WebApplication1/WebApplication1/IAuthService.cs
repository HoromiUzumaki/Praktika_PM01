using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication1.Models;

namespace WebApplication1
{
    public interface IAuthService
    {
        Response_Пользователи Authenticate(string username, string password);
        Response_Пользователи AuthenticateWith2FA(string username, string token);
    }


    public class AuthService : IAuthService
    {
        private readonly List<Пользователи> _пользователи = new List<Пользователи>
    {
        new Пользователи { IDПользователя = 1, ИмяПользователя = "admin", ХэшПароля = "hashed_password_1", Роль = "Admin", Фото = null },
        new Пользователи { IDПользователя = 2, ИмяПользователя = "storekeeper", ХэшПароля = "hashed_password_2", Роль = "Storekeeper", Фото = null }
    };

        public Response_Пользователи Authenticate(string username, string password)
        {
            var пользователь = _пользователи.SingleOrDefault(u => u.ИмяПользователя == username && u.ХэшПароля == password);
            if (пользователь == null)
                return null;

            return new Response_Пользователи(пользователь);
        }

        public Response_Пользователи AuthenticateWith2FA(string username, string token)
        {
            var пользователь = _пользователи.SingleOrDefault(u => u.ИмяПользователя == username);
            if (пользователь == null || token != "valid_2fa_token")
                return null;

            return new Response_Пользователи(пользователь);
        }
    }
}