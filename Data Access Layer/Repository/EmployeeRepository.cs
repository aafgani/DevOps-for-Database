using Data_Access_Layer.Interace;
using DomainClass.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Data_Access_Layer.Repository
{
    public class EmployeeRepository<T> : IEmployeeRepository<T> where T : class
    {
        private readonly IDatabaseContext databaseContext;

        public EmployeeRepository(IDatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }

        public void Add(T entity)
        {
            databaseContext.Set<T>().Add(entity);
        }

        public bool Any(Expression<Func<T, bool>> expression)
        {
            return databaseContext.Set<T>().Any(expression);
        }

        public void Delete(T entity)
        {
            databaseContext.Set<T>().Remove(entity);
        }

        public async Task<IEnumerable<T>> FindAsync(Expression<Func<T, bool>> expression)
        {
            return await databaseContext.Set<T>().Where(expression).ToListAsync();
        }

        public async Task<IEnumerable<T>> List()
        {
            return await databaseContext.Set<T>().ToListAsync();
        }

        public async Task<T> SingleOrDefaultAsync(Expression<Func<T, bool>> expression)
        {
            return await databaseContext.Set<T>().Where(expression).SingleOrDefaultAsync();
        }

        public void Update(T entity)
        {
            databaseContext.Set<T>().Update(entity);
        }
    }
}
