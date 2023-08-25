using ApiRest_Clients.Models;
using ApiRest_Clients.Services;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ApiRest_Clients.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductoController : ControllerBase
    {
        private readonly IServicesProducto _servicesProducto;
        public ProductoController(IServicesProducto servicesProducto)
        {
            _servicesProducto = servicesProducto;
        }

        // GET: api/<ProductoController>
        [HttpGet]
        public IEnumerable<Producto> Get()
        {
            return _servicesProducto.ListProducts();
        }

        // GET api/<ProductoController>/5
        [HttpGet("{id}")]
        public Producto Get(int id)
        {
            return _servicesProducto.FindbyIdProducto(id);
        }

        // POST api/<ProductoController>
        [HttpPost]
        public void Post([FromBody] Producto producto)
        {
            _servicesProducto.AddProducto(producto);
        }

        // PUT api/<ProductoController>/5
        [HttpPut]
        public void Put(int id, [FromBody] Producto producto)
        {
            _servicesProducto.UpdatebyIDProducto(id, producto);
        }

        // DELETE api/<ProductoController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            _servicesProducto.DeletebyIdProducto(id);
        }
    }
}
