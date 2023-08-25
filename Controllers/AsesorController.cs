using ApiRest_Clients.Models;
using ApiRest_Clients.Services;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace ApiRest_Clients.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AsesorController : ControllerBase
    {
        private readonly IServicesAsesor _servicesAsesor;
        public AsesorController(IServicesAsesor servicesAsesor)
        {
            _servicesAsesor = servicesAsesor;
        }

        // GET: api/<AsesorController>
        [HttpGet]
        public IEnumerable<Asesor> Get()
        {
            return _servicesAsesor.ListAsesor();
        }

        // GET api/<AsesorController>/5
        [HttpGet("{id}")]
        public Asesor Get(int id)
        {
            return _servicesAsesor.FindbyIdAsesor(id);
        }

        // POST api/<AsesorController>
        [HttpPost]
        public void Post([FromBody] Asesor asesor)
        {
            _servicesAsesor.AddAsesor(asesor);
        }

        // PUT api/<AsesorController>/5
        [HttpPut]
        public void Put(int id, [FromBody] Asesor asesor)
        {
            _servicesAsesor.UpdatebyIDAsesor(id, asesor);
        }

        // DELETE api/<AsesorController>/5
        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            _servicesAsesor.DeletebyIdAsesor(id);
        }
    }
}
