using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using WebApplication1.Models;
using WebApplication1.NewFolder1;

namespace WebApplication1.Controllers
{
    public class WarehouseController : ApiController
    {
        private Складской_учетEntities db = new Складской_учетEntities();
        // GET: api/Склады
        [ResponseType(typeof(List<Response_Warehouse>))]

        public IHttpActionResult GetWarehouse()
        {
            return Ok(db.Warehouse.ToList().ConvertAll(p => new Response_Warehouse(p)));
        }

    }
}
