using Data_Access_Layer.Interace;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace Data_Access_Layer.Repository
{
    public abstract class Repository<T> : IRepository<T> where T : class
    {
        protected readonly IDatabaseContext databaseContext;

        protected Repository(IDatabaseContext databaseContext)
        {
            this.databaseContext = databaseContext;
        }

        public abstract void Add<T1>(T1 entity);

        public abstract bool Any<T1>(Expression<Func<T1, bool>> expression);

        public abstract void Delete<T1>(T1 entity);

        public abstract Task<IEnumerable<T1>> FindAsync<T1>(Expression<Func<T1, bool>> expression);

        public abstract Task<IEnumerable<T1>> List<T1>();

        public abstract Task<T1> SingleOrDefaultAsync<T1>(Expression<Func<T1, bool>> expression);

        public abstract void Update<T1>(T1 entity);
    }
}
