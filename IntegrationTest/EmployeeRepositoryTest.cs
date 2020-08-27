using Autofac.Extras.Moq;
using Data_Access_Layer.DataContext;
using Data_Access_Layer.Interace;
using Data_Access_Layer.Repository;
using DomainClass.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace IntegrationTest
{
    public class EmployeeRepositoryTest
    {
        public void ListEmployee_ShouldWork()
        {
            using (var mock = AutoMock.GetLoose())
            {
                mock.Mock<IGenericRepository>()
                    .Setup(i => i.List<Employee>())
                    .Returns(GetSampleData());


            }
        }

        private Task<IEnumerable<Employee>> GetSampleData()
        {
            IEnumerable<Employee> output = new List<Employee>();

            return Task.FromResult(output);
        }

        public void GetById_ShouldWork()
        {
            var dbContextMock = new Mock<DatabaseContext>();
            var empDbSet = new Mock<DbSet<Employee>>();

            

            //empRepoMock.Setup(i => i.FindAsync(It.IsAny<Expression<Func<T, bool>>>()))
        }
    }
}
