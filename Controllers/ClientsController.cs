using ApiRest_Clients.Contexts;
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
    public class ClientsController : ControllerBase
    {
        private readonly IServicesClients _servicesClients;
        public ClientsController(IServicesClients servicesClients)
        {
            _servicesClients = servicesClients;
        }

        // GET: api/<ClientsController>
        [HttpGet]
        public IEnumerable<Clients> Get()
        {
            return _servicesClients.ListClients();
        }

        // GET api/<ClientsController>/5
        [HttpGet("{dni}")]
        public Clients Get(int dni)
        {
            return _servicesClients.FindbyDNIClients(dni);
        }

        // POST api/<ClientsController>
        [HttpPost]
        public void Post([FromBody] Clients client)
        {
            _servicesClients.AddClients(client);
        }

        // PUT api/<ClientsController>/5
        [HttpPut]
        public void Put(int id, [FromBody] Clients client)
        {
            _servicesClients.UpdatebyIDClients(id, client);
        }

        // DELETE api/<ClientsController>/5
        [HttpDelete("{dni}")]
        public void Delete(int dni)
        {
            _servicesClients.DeletebyDNIClients(dni);
        }
    }
}
