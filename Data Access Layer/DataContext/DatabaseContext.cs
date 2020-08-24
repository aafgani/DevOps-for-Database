using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using DomainClass.Models;
using Data_Access_Layer.Interace;

namespace Data_Access_Layer.DataContext
{
    public class DatabaseContext : DbContext, IDatabaseContext
    {
        public DatabaseContext(DbContextOptions options) : base(options)
        {
        }

        public DbSet<Employee> Employee { get; set; }

        //public Task<int> SaveChangesAsync()
        //{
        //    throw new NotImplementedException();
        //}
    }
}
