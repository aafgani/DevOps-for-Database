﻿using Data_Access_Layer.Interace;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Data_Access_Layer.DataContext;
using DomainClass.Models;

namespace Data_Access_Layer.Repository
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly DatabaseContext _databaseContext;
        private bool disposed = false;

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
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        private void Dispose(bool disposing)
        {
            if (!this.disposed)
            {
                if (disposing)
                {
                    _databaseContext.Dispose();
                }
            }
            this.disposed = true;
        }

        private IEmployeeRepository<Employee> _employeeRepository;

        public IEmployeeRepository<Employee> EmployeeRepository { get { return _employeeRepository = _employeeRepository ??  new EmployeeRepository<Employee>(_databaseContext); }}
        
    }
}
