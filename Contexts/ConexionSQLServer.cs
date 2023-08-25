using ApiRest_Clients.Models;
using Microsoft.EntityFrameworkCore;

namespace ApiRest_Clients.Contexts
{
    public class ConexionSQLServer:DbContext
    {
        public ConexionSQLServer(DbContextOptions<ConexionSQLServer> options) : base(options)
        {

        }

        public DbSet<Clients> Clients { get; set; }
        public DbSet<Producto> Producto { get; set; }
        public DbSet<Asesor> Asesor { get; set; }
        public DbSet<Venta> Venta { get; set; }
        public DbSet<Administrator> Administrator { get; set; }
    }
}
