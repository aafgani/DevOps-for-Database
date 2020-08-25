using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using DomainClass.Models;

namespace BusinessLogic.Interfaces
{
    public interface IEmployeeService
    {
        Task<List<Employee>> GetListEmployeeAsync();
        Task<List<Employee>> GetEmployeeAsync(string term);
        Task<Employee> GetEmployeeByIdAsync(int id);
        Task<int> AddNewEmployeeAsync(Employee employee);
        Task DeleteEmployeeAsync(Employee employee);
    }
}
