using System.ComponentModel.DataAnnotations;

namespace ApiRest_Clients.Models
{
    public class VentaInformation
    {
        [Key]
        public int IdVenta { get; set; }
        public DateTime Periodo { get; set; }
        public string NameAsesor { get; set; }
        public string NameCliente { get; set; }
        public string NameProducto { get; set; }
        public int Puntos { get; set; }
        public DateTime Fecha { get; set; }
        public double Monto { get; set; }
    }
}
