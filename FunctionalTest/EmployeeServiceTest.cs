using BusinessLogic.Implementations;
using BusinessLogic.Interfaces;
using Data_Access_Layer.Interace;
using DomainClass.Models;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using Xunit;

namespace FunctionalTest
{
    public class EmployeeServiceTest
    {
        [Fact]
        public void Given_EmpId_Should_Get_Employee()
        {
            //Arrange
            var empId = 1;
            var empName = "Andrya";
            var emp = new Employee() { EmployeeId = empId, Fullname = empName };

            var empRepositoryMock = new Mock<IEmployeeRepository<Employee>>();
            empRepositoryMock.Setup(i => i.SingleOrDefaultAsync(It.IsAny<Expression<Func<Employee, bool>>>())).ReturnsAsync(emp).Verifiable();

            var unitOfWorkMock = new Mock<IUnitOfWork>();
            unitOfWorkMock.Setup(i => i.EmployeeRepository).Returns(empRepositoryMock.Object);

            IEmployeeService employeeService = new EmployeeService(unitOfWorkMock.Object);

            //Act
            var actual = employeeService.GetEmployeeByIdAsync(empId).Result;

            //Assert
            empRepositoryMock.Verify(); //verify that SingleOrDefaultAsync was called based on setup.
            Assert.NotNull(actual);
            Assert.Equal(empName, actual.Fullname);
        }

        [Fact]
        public void DeleteEmployee_ShouldWork()
        {
            //Arrange
            var empId = 1;
            var empName = "Andrya";
            var listEmp = new List<Employee> {
                new Employee() { EmployeeId = empId, Fullname = empName }
            };

            var empRepositoryMock = new Mock<IEmployeeRepository<Employee>>();
            empRepositoryMock.Setup(i => i.Delete(It.IsAny<Employee>())).Callback((Employee emp) => { listEmp.Remove(emp); });
            empRepositoryMock.Setup(i => i.List()).ReturnsAsync(listEmp).Verifiable();

            var unitOfWorkMock = new Mock<IUnitOfWork>();
            unitOfWorkMock.Setup(i => i.EmployeeRepository).Returns(empRepositoryMock.Object);

            IEmployeeService employeeService = new EmployeeService(unitOfWorkMock.Object);

            //Act
            var actual = employeeService.DeleteEmployeeAsync(listEmp.FirstOrDefault());
            var actualCount = employeeService.GetListEmployeeAsync().Result;

            //Assert
            empRepositoryMock.Verify(); //verify that Delete was called based on setup.
            
            Assert.Equal(listEmp.Count, actualCount.Count);

        }
    }
}
