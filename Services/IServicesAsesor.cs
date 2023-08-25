using ApiRest_Clients.Models;
using Microsoft.AspNetCore.Mvc;

namespace ApiRest_Clients.Services
{
    public interface IServicesAsesor
    {
        public IEnumerable<Asesor> ListAsesor();
        public Asesor FindbyIdAsesor(int IdAsesor);
        public void AddAsesor([FromBody] Asesor asesor);
        public void UpdatebyIDAsesor(int id, [FromBody] Asesor asesor);
        public void DeletebyIdAsesor(int IdAsesor);
    }
}
