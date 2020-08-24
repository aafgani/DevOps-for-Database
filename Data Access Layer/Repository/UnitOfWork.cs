using Data_Access_Layer.Interace;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Data_Access_Layer.DataContext;

namespace Data_Access_Layer.Repository
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly DatabaseContext _databaseContext;

        public UnitOfWork(DatabaseContext databaseContext)
        {
            _databaseContext = databaseContext;
        }

        public Task CommitAsync()
        {
            return _databaseContext.SaveChangesAsync();
        }

        public void Dispose()
        {
            _databaseContext.Dispose();
        }

        public IGenericRepository Repository()
        {
            return new GenericRepository(_databaseContext);
        }
    }
}
