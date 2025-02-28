using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http.Description;
using System.Web.Http;
using System.Web.Mvc;
using WebApplication1.Models;

namespace WebApplication1.Controllers
{
    public class WarehouseController : ApiController
    {
        private WarehouseManagementEntities db = new WarehouseManagementEntities();
       
        // GET: Warehouse
        [ResponseType(typeof(List<Response_Warehouse>))]

        public IHttpActionResult GetWarehouse()
        {
            return Ok(db.Warehouses.ToList().ConvertAll(p => new Response_Warehouse(p)));
        }
    }
}