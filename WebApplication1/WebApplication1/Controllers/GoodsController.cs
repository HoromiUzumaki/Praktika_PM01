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
    public class GoodsController : ApiController
    {
        private Складской_учетEntities db = new Складской_учетEntities();
        // GET: api/товары
        [ResponseType(typeof(List<Response_Goods>))]

        public IHttpActionResult GetGoods()
        {
            return Ok(db.Goods.ToList().ConvertAll(p => new Response_Goods(p)));
        }

        [ResponseType(typeof(List<Response_Goods>))]
        public IHttpActionResult PostGoods([FromBody] Goods товар)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            db.Goods.Add(товар);
            db.SaveChanges();
            var response = new Response_Goods(товар);
            return CreatedAtRoute("DefaultApi", new { id = товар.IdGoods }, response);
        }
    }
}
