using ApiRest_Clients.Contexts;
using ApiRest_Clients.Models;
using Microsoft.AspNetCore.Mvc;

namespace ApiRest_Clients.Services
{
    public class ServicesClients:IServicesClients
    {
        private readonly ConexionSQLServer _context;
        public ServicesClients(ConexionSQLServer context)
        {
            _context = context;
        }

        public IEnumerable<Clients> ListClients()
        {
            return _context.Clients.ToList();
        }

        public Clients FindbyDNIClients(int documentNumber)
        {
            return _context.Clients.Single(b => b.documentNumber == documentNumber);
        }

        public void AddClients([FromBody] Clients client)
        {
            _context.Clients.Add(client);
            _context.SaveChanges();
        }

        public void UpdatebyIDClients(int id, [FromBody] Clients client)
        {
            _context.Clients.Update(client);
            _context.SaveChanges();
        }

        public void DeletebyDNIClients(int documentNumber)
        {
            _context.Clients.RemoveRange(_context.Clients.Where(x => x.documentNumber == documentNumber));
            _context.SaveChanges();
        }
    }
}
