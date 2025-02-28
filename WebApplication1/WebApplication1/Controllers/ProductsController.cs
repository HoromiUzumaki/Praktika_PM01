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
    public class ProductsController : ApiController
    {
        private WarehouseManagementEntities db = new WarehouseManagementEntities();
       
        // GET: api/товары
        [ResponseType(typeof(List<Response_Products>))]

        public IHttpActionResult GetGoods()
        {
            return Ok(db.Products.ToList().ConvertAll(p => new Response_Products(p)));
        }

        [ResponseType(typeof(List<Response_Products>))]
        public IHttpActionResult PostGoods([FromBody] Products товар)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            db.Products.Add(товар);
            db.SaveChanges();
            var response = new Response_Products(товар);
            return CreatedAtRoute("DefaultApi", new { id = товар.ProductID }, response);
        }
    }
}