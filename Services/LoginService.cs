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

        public async Task<Administrator?> GetAdmin(AdministratorDTO administrator)
        {
            return await _context.Administrator.SingleOrDefaultAsync(x => x.Email == administrator.Email && x.Pwd == administrator.Pwd);
        }
    }
}
