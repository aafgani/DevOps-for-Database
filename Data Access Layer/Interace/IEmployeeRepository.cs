using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Data_Access_Layer.Interace
{
    public interface IEmployeeRepository<T> : IRepository<T> where T : class
    {
        Task<IEnumerable<T>> FindAsync(Expression<Func<T, bool>> expression);
        Task<T> SingleOrDefaultAsync(Expression<Func<T, bool>> expression);
        void Add(T entity);
        void Update(T entity);
        void Delete(T entity);
        Task<IEnumerable<T>> List();
        bool Any(Expression<Func<T, bool>> expression);
    }
}
