using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DomainClass.Models
{
    public class Employee
    {
        public int EmployeeId { get; set; }
        public string Fullname { get; set; }
        public string Department { get; set; }
        public string Email { get; set; }
    }
}
