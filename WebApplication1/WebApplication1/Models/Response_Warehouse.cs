using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication1.NewFolder1;

namespace WebApplication1.Models
{
    public class Response_Warehouse
    {
        public Response_Warehouse(Warehouse склады)
        {
            IdWarehouse = склады.IdWarehouse;
            Title = склады.Title;
            Address = склады.Address;
            IdWarehouseType = склады.IdWarehouseType;
            IdStorageArea = склады.IdStorageArea;
        }
        public int IdWarehouse { get; set; }
        public string Title { get; set; }
        public string Address { get; set; }
        public int IdWarehouseType { get; set; }
        public int IdStorageArea { get; set; }
    }
}