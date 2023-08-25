using ApiRest_Clients.Contexts;
using ApiRest_Clients.Models;
using Microsoft.AspNetCore.Mvc;

namespace ApiRest_Clients.Services
{
    public class ServicesAsesor : IServicesAsesor
    {
        private readonly ConexionSQLServer _context;
        public ServicesAsesor(ConexionSQLServer context)
        {
            _context = context;
        }

        public IEnumerable<Asesor> ListAsesor()
        {
            return _context.Asesor.ToList();
        }

        public Asesor FindbyIdAsesor(int IdAsesor)
        {
            return _context.Asesor.Single(b => b.IdAsesor == IdAsesor);
        }

        public void AddAsesor([FromBody] Asesor asesor)
        {
            _context.Asesor.Add(asesor);
            _context.SaveChanges();
        }

        public void UpdatebyIDAsesor(int id, [FromBody] Asesor asesor)
        {
            _context.Asesor.Update(asesor);
            _context.SaveChanges();
        }

        public void DeletebyIdAsesor(int IdAsesor)
        {
            _context.Asesor.RemoveRange(_context.Asesor.Where(x => x.IdAsesor == IdAsesor));
            _context.SaveChanges();
        }
    }
}
