using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication1.NewFolder1;

namespace WebApplication1.Models
{
    public class Response_Goods
    {
        public Response_Goods(Goods товары)
        {
            IdGoods = товары.IdGoods;
            Title = товары.Title;
            Article = товары.Article;
            Barcode = товары.Barcode;
            IdCategory = товары.IdCategory;
            IdUnit = товары.IdUnit;
            Price = товары.Price;
            SerialNumber = товары.SerialNumber;
            MinimumBalance = товары.MinimumBalance;

        }
        public int IdGoods { get; set; }
        public string Title { get; set; }
        public string Article { get; set; }
        public string Barcode { get; set; }
        public int IdCategory { get; set; }
        public int IdUnit { get; set; }
        public double Price { get; set; }
        public string SerialNumber { get; set; }
        public Nullable<double> MinimumBalance { get; set; }
    }
}