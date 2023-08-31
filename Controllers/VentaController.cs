using ApiRest_Clients.Models;
using ApiRest_Clients.Services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ApiRest_Clients.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    [ApiController]
    public class VentaController : ControllerBase
    {
        private readonly IServicesVenta _servicesVenta;
        public VentaController(IServicesVenta servicesVenta)
        {
            _servicesVenta = servicesVenta;
        }

        // GET: api/<ProductoController>
        [HttpGet]
        public IEnumerable<VentaInformation> Get()
        {
            return _servicesVenta.ListVentas();
        }

        // GET api/<ProductoController>/5
        [HttpGet("{id}")]
        public IEnumerable<VentaInformation> Get(int id)
        {
            return _servicesVenta.ListVentasbyIdAsesor(id);
        }

        // POST api/<ProductoController>
        [HttpPost]
        public void Post([FromBody] Venta venta)
        {
            _servicesVenta.AddVenta(venta);
        }
    }
}
