using System.ComponentModel.DataAnnotations;

namespace ApiRest_Clients.Models
{
    public class Asesor
    {
        [Key]
        public int IdAsesor { get; set; }
        public string Name { get; set; }
    }
}
