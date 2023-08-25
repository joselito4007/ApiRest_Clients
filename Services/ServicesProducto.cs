using ApiRest_Clients.Contexts;
using ApiRest_Clients.Models;
using Microsoft.AspNetCore.Mvc;

namespace ApiRest_Clients.Services
{
    public class ServicesProducto : IServicesProducto
    {
        private readonly ConexionSQLServer _context;
        public ServicesProducto(ConexionSQLServer context)
        {
            _context = context;
        }

        public IEnumerable<Producto> ListProducts()
        {
            return _context.Producto.ToList();
        }

        public Producto FindbyIdProducto(int IdProducto)
        {
            return _context.Producto.Single(b => b.IdProducto == IdProducto);
        }

        public void AddProducto([FromBody] Producto producto)
        {
            _context.Producto.Add(producto);
            _context.SaveChanges();
        }

        public void UpdatebyIDProducto(int id, [FromBody] Producto producto)
        {
            _context.Producto.Update(producto);
            _context.SaveChanges();
        }

        public void DeletebyIdProducto(int IdProducto)
        {
            _context.Producto.RemoveRange(_context.Producto.Where(x => x.IdProducto == IdProducto));
            _context.SaveChanges();
        }
    }
}
