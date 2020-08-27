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
            _unitOfWork.EmployeeRepository.Add(employee);
            await _unitOfWork.CommitAsync();
            return employee.EmployeeId;
        }

        public bool AnyEmployee(int id)
        {
            return _unitOfWork.EmployeeRepository.Any(x => x.EmployeeId == id);
        }

        public async Task DeleteEmployeeAsync(Employee employee)
        {
            _unitOfWork.EmployeeRepository.Delete(employee);
            await _unitOfWork.CommitAsync();
        }

        public async Task<List<Employee>> GetEmployeeAsync(string term)
        {
            var emp = await _unitOfWork.EmployeeRepository.FindAsync(x => x.Fullname.Contains(term));
            return emp.ToList();
        }

        public async Task<Employee> GetEmployeeByIdAsync(int id)
        {
            var emp = await _unitOfWork.EmployeeRepository.SingleOrDefaultAsync(x => x.EmployeeId == id);
            return emp;
        }

        public async Task<List<Employee>> GetListEmployeeAsync()
        {
            var emp = await _unitOfWork.EmployeeRepository.List();
            return emp.ToList();
        }

        public async Task UpdateEmployee(Employee employee)
        {
            _unitOfWork.EmployeeRepository.Update(employee);
            await _unitOfWork.CommitAsync();
        }
    }
}
