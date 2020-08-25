using Data_Access_Layer.Interace;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;
using Data_Access_Layer.DataContext;

namespace Data_Access_Layer.Repository
{
    public class GenericRepository : IGenericRepository
    {
        private readonly IDatabaseContext databaseContext;

        public GenericRepository(IDatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }

        public void Add<T>(T entity) where T : class
        {
            databaseContext.Set<T>().Add(entity);
        }

        public void Delete<T>(T entity) where T : class
        {
            databaseContext.Set<T>().Remove(entity);
        }

        public async Task<IEnumerable<T>> FindAsync<T>(Expression<Func<T, bool>> expression) where T : class
        {
            return await databaseContext.Set<T>().Where(expression).ToListAsync();
        }

        public async Task<T> SingleOrDefaultAsync<T>(Expression<Func<T, bool>> expression) where T : class
        {
            return await databaseContext.Set<T>().Where(expression).SingleOrDefaultAsync();
        }

        public void Update<T>(T entity) where T : class
        {
            //databaseContext.Entry(entity).State = EntityState.Modified;
        }

        public async Task<IEnumerable<T>> List<T>() where T : class
        {
            return await databaseContext.Set<T>().ToListAsync();
        }
    }
}
