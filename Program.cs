using ApiRest_Clients.Contexts;
using ApiRest_Clients.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddScoped<IServicesClients, ServicesClients>();
builder.Services.AddScoped<IServicesAsesor, ServicesAsesor>();
builder.Services.AddScoped<IServicesProducto, ServicesProducto>();
builder.Services.AddScoped<IServicesVenta, ServicesVenta>();
builder.Services.AddScoped<IServicesProducto, ServicesProducto>();
builder.Services.AddScoped<ILoginService, LoginService>();

builder.Services.AddDbContext<ConexionSQLServer>(options =>
    options.UseSqlServer(builder.Configuration.GetConnectionString("CadenaConexionSQLServer")));

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
