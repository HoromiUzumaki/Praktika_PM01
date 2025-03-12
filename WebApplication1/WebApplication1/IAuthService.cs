using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication1.Models;

namespace WebApplication1
{
    public interface IAuthService
    {
        Response_Пользователи Authenticate(string email, string password);
        void GenerateAndSaveTwoFactorToken(string email);
        Response_Пользователи AuthenticateWith2FA(string email, string token);
    }


    public class AuthService : IAuthService
    {
        private readonly СкладыEntities _context;

        public AuthService(СкладыEntities context)
        {
            _context = context;
        }

        // Обычная аутентификация по email и паролю
        public Response_Пользователи Authenticate(string email, string password)
        {
            var пользователь = _context.Пользователи.SingleOrDefault(u => u.Email == email && u.ХэшПароля == password);
            if (пользователь == null)
                return null;

            return new Response_Пользователи(пользователь);
        }

        // Генерация и сохранение токена для 2FA
        public void GenerateAndSaveTwoFactorToken(string email)
        {
            var пользователь = _context.Пользователи.SingleOrDefault(u => u.Email == email);
            if (пользователь == null)
                throw new Exception("Пользователь не найден.");

            // Генерация токена (например, 6-значный код)
            var token = new Random().Next(100000, 999999).ToString();

            // Сохранение токена
            пользователь.TwoFactorToken = token;
            _context.SaveChanges();
        }

        // Проверка токена для 2FA
        public Response_Пользователи AuthenticateWith2FA(string email, string token)
        {
            var пользователь = _context.Пользователи.SingleOrDefault(u => u.Email == email);
            if (пользователь == null)
                return null;

            // Проверка токена
            if (пользователь.TwoFactorToken != token)
                return null;

            return new Response_Пользователи(пользователь);
        }
        
    }
}