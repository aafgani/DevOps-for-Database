using Core.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace Core.Implementations
{
    public class Calculator : ICalculator
    {
        public double Add(double num1, double num2)
        {
            return num1 + num2;
        }

        public double Divide(double num1, double num2)
        {
            throw new NotImplementedException();
        }

        public double Multiply(double num1, double num2)
        {
            throw new NotImplementedException();
        }

        public double Substract(double num1, double num2)
        {
            throw new NotImplementedException();
        }
    }
}
