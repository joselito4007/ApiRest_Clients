﻿using System.ComponentModel.DataAnnotations;

namespace ApiRest_Clients.Models
{
    public class Administrator
    {
        [Key]
        public int ID { get; set; }
        public string Name { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }
        public string Pwd { get; set; }
        public string AdminType { get; set; }
        public DateTime RegDate { get; set; }
    }
}
