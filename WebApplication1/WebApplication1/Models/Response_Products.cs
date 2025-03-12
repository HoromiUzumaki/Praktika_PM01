using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class Response_Products
    {
        public Response_Products(Товары товары)
        {
            IDТовара = товары.IDТовара;
            Название = товары.Название;
            Артикул = товары.Артикул;
            Штрихкод = товары.Штрихкод;
            Категория = товары.Категория;
            ЕдиницаИзмерения = товары.ЕдиницаИзмерения;
            Цена = товары.Цена;
            СерийныйНомер = товары.СерийныйНомер;
            МинимальныйЗапас = товары.МинимальныйЗапас;
            


        }
        public int IDТовара { get; set; }
        public string Название { get; set; }
        public string Артикул { get; set; }
        public string Штрихкод { get; set; }
        public string Категория { get; set; }
        public string ЕдиницаИзмерения { get; set; }
        public decimal Цена { get; set; }
        public string СерийныйНомер { get; set; }
        public Nullable<int> МинимальныйЗапас { get; set; }
    }
}