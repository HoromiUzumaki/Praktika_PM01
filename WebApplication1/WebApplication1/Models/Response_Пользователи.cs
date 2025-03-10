using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Xml.Linq;

namespace WebApplication1.Models
{
    public class Response_Пользователи
    {
        public Response_Пользователи(Пользователи юзер)
        {
            IDПользователя = юзер.IDПользователя;
            ИмяПользователя = юзер.ИмяПользователя;
            Email = юзер.Email;
            ХэшПароля = юзер.ХэшПароля;
            Роль = юзер.Роль;
            Фото = юзер.Фото;



        }
        public int IDПользователя { get; set; }
        public string ИмяПользователя { get; set; }
        public string Email { get; set; }
        public string ХэшПароля { get; set; }
        public string Роль { get; set; }
        public byte[] Фото { get; set; }
    }
}