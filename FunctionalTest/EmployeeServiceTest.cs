using BusinessLogic.Implementations;
using BusinessLogic.Interfaces;
using Data_Access_Layer.Interace;
using DomainClass.Models;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using Xunit;

namespace FunctionalTest
{
    public class EmployeeServiceTest
    {
        [Fact]
        public void EmployeeService_Given_EmpId_Should_Get_Employee()
        {
            //Arrange
            var empId = 1;
            var empName = "Andrya";
            var emp = new Employee() { EmployeeId= empId, Fullname= empName };

            var empRepositoryMock = new Mock<IGenericRepository>();
            empRepositoryMock.Setup(i => i.SingleOrDefaultAsync<Employee>(It.IsAny<Expression<Func<Employee, bool>>>())).ReturnsAsync(emp).Verifiable();

            var unitOfWorkMock = new Mock<IUnitOfWork>();
            unitOfWorkMock.Setup(m => m.Repository()).Returns(empRepositoryMock.Object);

            IEmployeeService employeeService = new EmployeeService(unitOfWorkMock.Object);

            //Act
            var actual = employeeService.GetEmployeeByIdAsync(empId);

            //Assert
            empRepositoryMock.Verify(); //verify that SingleOrDefaultAsync was called based on setup.
            Assert.NotNull(actual);
            Assert.Equal(empName, actual.Result.Fullname);
        }
    }
}
