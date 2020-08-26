using Core.Implementations;
using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System.Text;
using Xunit;

namespace UnitTest
{
    public class CalculatorTest
    {
        [Theory]
        [InlineData(2,3,5)]
        public void Add_SimpleValueShouldCalculate(double x, double y, double expected)
        {
            var calculator = new Calculator();

            var actual = calculator.Add(x, y);

            Assert.Equal(expected, actual);
        }
    }
}
