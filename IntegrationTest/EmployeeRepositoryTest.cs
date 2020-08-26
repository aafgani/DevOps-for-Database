using Autofac.Extras.Moq;
using Data_Access_Layer.Interace;
using DomainClass.Models;
using System;
using System.Collections.Generic;
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
    }
}
