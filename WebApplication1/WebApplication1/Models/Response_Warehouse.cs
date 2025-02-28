using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class Response_Warehouse
    {
        public Response_Warehouse(Warehouses склады)
        {
            WarehouseID = склады.WarehouseID;
            Name = склады.Name;
            Address = склады.Address;
            Type = склады.Type;
         


        }
        public int WarehouseID { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string Type { get; set; }
    }
}