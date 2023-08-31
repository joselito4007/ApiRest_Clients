using ApiRest_Clients.Models;
using ApiRest_Clients.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Text;
using Microsoft.Extensions.Options;

namespace ApiRest_Clients.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : Controller
    {
        private readonly ILoginService _loginService;
        private IConfiguration config;
        public LoginController(ILoginService loginService, IConfiguration config)
        {
            _loginService = loginService;
            this.config = config;
        }

        //[HttpGet("prueba")]
        //public async Task<IActionResult> Prueba(string a)
        //{
        //    string valor;

        //    valor = "Hola Mundo";

        //    return Ok(new { token = valor });
        //}

        [HttpPost]
        public async Task<IActionResult> Login(AdministratorDTO admin)
        {
            var administrador = await _loginService.GetAdmin(admin);

            if (administrador is null)
                return BadRequest(new {message = "Credenciales inválidas."});

            string jwtToken = GenerateToken(administrador); 

            return Ok(new {token=jwtToken});
        }

        private string GenerateToken(Administrator admin)
        {
            var claims = new[]
            {
                new Claim(ClaimTypes.Name,admin.Name),
                new Claim(ClaimTypes.Email,admin.Email)
            };

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(config.GetSection("JWT:Key").Value));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha512Signature);

            var securityToken = new JwtSecurityToken(
                  claims: claims,
                  expires: DateTime.Now.AddMinutes(60),
                  signingCredentials: creds
            );

            string token = new JwtSecurityTokenHandler().WriteToken(securityToken);

            return token;
        }
    }
}
