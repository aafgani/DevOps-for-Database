using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Data_Access_Layer.Interace
{
    public interface IGenericRepository
    {
        Task<IEnumerable<T>> FindAsync<T>(Expression<Func<T, bool>> expression) where T : class;
        Task<T> SingleOrDefaultAsync<T>(Expression<Func<T, bool>> expression) where T : class;
        void Add<T>(T entity) where T : class;
        void Update<T>(T entity) where T : class;
        void Delete<T>(T entity) where T : class;
        Task<IEnumerable<T>> List<T>() where T : class;
        bool Any<T>(Expression<Func<T, bool>> expression) where T : class;
    }
}
