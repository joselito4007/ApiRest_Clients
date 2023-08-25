using ApiRest_Clients.Models;
using Microsoft.AspNetCore.Mvc;

namespace ApiRest_Clients.Services
{
    public interface IServicesProducto
    {
        public IEnumerable<Producto> ListProducts();
        public Producto FindbyIdProducto(int IdProducto);
        public void AddProducto([FromBody] Producto producto);
        public void UpdatebyIDProducto(int id, [FromBody] Producto producto);
        public void DeletebyIdProducto(int IdProducto);
    }
}
