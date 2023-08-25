using ApiRest_Clients.Models;
using Microsoft.AspNetCore.Mvc;

namespace ApiRest_Clients.Services
{
    public interface ILoginService
    {
        public Task<Administrator?> GetAdmin(AdministratorDTO administrator);
    }
}
