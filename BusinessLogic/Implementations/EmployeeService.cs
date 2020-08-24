using DomainClass.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using Data_Access_Layer.Interace;
using System.Linq;

namespace BusinessLogic.Implementations
{
    public class EmployeeService : Interfaces.IEmployeeService
    {
        private readonly IUnitOfWork _unitOfWork;

        public EmployeeService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public async Task<int> AddNewEmployeeAsync(Employee employee)
        {
            using ( _unitOfWork)
            {
                _unitOfWork.Repository().Add(employee);
                await _unitOfWork.CommitAsync();
                return employee.EmployeeId;
            }
        }

        public async Task<List<Employee>> GetEmployeeAsync(string term)
        {
            using (_unitOfWork)
            {
                var emp = await _unitOfWork.Repository().FindAsync<Employee>(x => x.Fullname.Contains(term));
                return emp.ToList();
            }
        }
    }
}
