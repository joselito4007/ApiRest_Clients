using System.ComponentModel.DataAnnotations;

namespace ApiRest_Clients.Models
{
    public class Producto
    {
        [Key]
        public int IdProducto { get; set; }
        public string Name { get; set; }
    }
}
