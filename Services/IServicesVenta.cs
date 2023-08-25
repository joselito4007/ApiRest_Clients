using ApiRest_Clients.Models;
using Microsoft.AspNetCore.Mvc;

namespace ApiRest_Clients.Services
{
    public interface IServicesVenta
    {
        public IEnumerable<VentaInformation> ListVentas();
        public IEnumerable<VentaInformation> ListVentasbyIdAsesor(int IdAsesor);
        public void AddVenta([FromBody] Venta venta);
    }
}
