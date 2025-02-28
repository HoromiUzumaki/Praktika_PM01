using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class Response_Products
    {
        public Response_Products(Products товары)
        {
            ProductID = товары.ProductID;
            Name = товары.Name;
            Article = товары.Article;
            Barcode = товары.Barcode;
            Category = товары.Category;
            UnitOfMeasurement = товары.UnitOfMeasurement;
            Price = товары.Price;
            ExpiryDate = товары.ExpiryDate;
            SerialNumber = товары.SerialNumber;
            MinimumStockLevel = товары.MinimumStockLevel;


        }
        public int ProductID { get; set; }
        public string Name { get; set; }
        public string Article { get; set; }
        public string Barcode { get; set; }
        public string Category { get; set; }
        public string UnitOfMeasurement { get; set; }
        public decimal Price { get; set; }
        public Nullable<System.DateTime> ExpiryDate { get; set; }
        public string SerialNumber { get; set; }
        public Nullable<int> MinimumStockLevel { get; set; }
    }
}