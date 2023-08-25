using ApiRest_Clients.Contexts;
using ApiRest_Clients.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace ApiRest_Clients.Services
{
    public class ServicesVenta:IServicesVenta
    {
        private readonly ConexionSQLServer _context;
        public ServicesVenta(ConexionSQLServer context)
        {
            _context = context;
        }
        public IEnumerable<VentaInformation> ListVentas()
        {
            var ListVentas = (from V in _context.Venta
                         join A in _context.Asesor on V.IdAsesor equals A.IdAsesor
                         join C in _context.Clients on V.IdClient equals C.IdClient
                         join P in _context.Producto on V.IdProduct equals P.IdProducto
                         select new VentaInformation()
                         {
                           IdVenta = V.IdVenta,
                           Periodo = V.Periodo,
                           NameAsesor = A.Name,
                           NameCliente = C.name + C.lastname,
                           NameProducto = P.Name,
                           Puntos = V.Puntos,
                           Fecha = V.Fecha,
                           Monto = V.Monto
                         }).ToList();

            return ListVentas;
        }
        public IEnumerable<VentaInformation> ListVentasbyIdAsesor(int IdAsesor)
        {
            var ListVentasbyIdAsesor = (from V in _context.Venta
                              join A in _context.Asesor on V.IdAsesor equals A.IdAsesor
                              join C in _context.Clients on V.IdClient equals C.IdClient
                              join P in _context.Producto on V.IdProduct equals P.IdProducto
                              where V.IdAsesor == IdAsesor
                              select new VentaInformation()
                              {
                                  IdVenta = V.IdVenta,
                                  Periodo = V.Periodo,
                                  NameAsesor = A.Name,
                                  NameCliente = C.name + C.lastname,
                                  NameProducto = P.Name,
                                  Puntos = V.Puntos,
                                  Fecha = V.Fecha,
                                  Monto = V.Monto
                              }).ToList();

            return ListVentasbyIdAsesor;
        }
        public void AddVenta([FromBody] Venta venta)
        {
            CalcularPuntos(venta);
            _context.Venta.Add(venta);
            _context.SaveChanges();
        }
        public void CalcularPuntos(Venta venta)
        {
            if(venta.IdProduct == 1)
            {
                venta.Puntos = 10;
            }
            else if(venta.IdProduct == 2)
            {
                venta.Puntos = 20;
            }
            else if (venta.IdProduct == 3)
            {
                venta.Puntos = 40;
            }
            else if (venta.IdProduct == 4)
            {
                venta.Puntos = Convert.ToInt32(0.005*venta.Monto);
            }
            else if (venta.IdProduct == 5)
            {
                venta.Puntos = Convert.ToInt32(0.003 * venta.Monto);
            }
        }
    }
}
