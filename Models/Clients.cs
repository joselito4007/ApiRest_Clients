using System.ComponentModel.DataAnnotations;
using System.Numerics;

namespace ApiRest_Clients.Models
{
    public class Clients
    {
        [Key]
        public int IdClient { get; set; }
        public int documentNumber { get; set; }
        public string name { get; set; }
        public string lastname { get; set; }
        public int phoneNumber { get; set; }
    }
}
