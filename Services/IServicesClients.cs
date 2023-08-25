using ApiRest_Clients.Models;
using Microsoft.AspNetCore.Mvc;

namespace ApiRest_Clients.Services
{
    public interface IServicesClients
    {
        public IEnumerable<Clients> ListClients();
        public Clients FindbyDNIClients(int dni);
        public void AddClients([FromBody] Clients client);
        public void UpdatebyIDClients(int id, [FromBody] Clients client);
        public void DeletebyDNIClients(int dni);
    }
}