using DomainClass.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace Data_Access_Layer.Interace
{
    public interface IUnitOfWork : IDisposable
    {
        IEmployeeRepository<Employee> EmployeeRepository { get; }
        Task CommitAsync();
    }
}
