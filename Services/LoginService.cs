using ApiRest_Clients.Contexts;
using ApiRest_Clients.Models;
using Microsoft.EntityFrameworkCore;

namespace ApiRest_Clients.Services
{
    public class LoginService:ILoginService
    {
        private readonly ConexionSQLServer _context;
        public LoginService(ConexionSQLServer context)
        {
            _context = context;
        }

        public async Task<Administrator?> GetAdmin(AdministratorDTO admin)
        {
            return await _context.Administrator.SingleOrDefaultAsync(x => x.Email == admin.Email && x.Pwd == admin.Pwd);
        }
    }
}
