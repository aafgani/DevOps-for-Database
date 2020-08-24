using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using System.Threading;
using System.Threading.Tasks;

namespace Data_Access_Layer.Interace
{
    public  interface IDatabaseContext : IDisposable
    {
        //DbEntityEntry Entry(object entity);
        Task<int> SaveChangesAsync(CancellationToken cancellationToken);
        //Task<int> SaveChangesAsync();
        //DbSet Set(Type entityType);
        DbSet<TEntity> Set<TEntity>() where TEntity : class;        
    }
}
