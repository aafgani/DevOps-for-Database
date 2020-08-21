using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using WebClient.Models;

namespace WebClient.Data
{
    public class WebClientContext : DbContext
    {
        public WebClientContext (DbContextOptions<WebClientContext> options)
            : base(options)
        {
            Database.EnsureCreated();
        }

        public DbSet<WebClient.Models.Employee> Employee { get; set; }
    }
}
