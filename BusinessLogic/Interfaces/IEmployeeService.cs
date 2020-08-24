using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using DomainClass.Models;

namespace BusinessLogic.Interfaces
{
    public interface IEmployeeService
    {
        Task<List<Employee>> GetEmployeeAsync(string term);
        Task<int> AddNewEmployeeAsync(Employee employee);
    }
}
