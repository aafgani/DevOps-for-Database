using System;
using System.Collections.Generic;
using System.Text;

namespace Core.Interfaces
{
    public interface ICalculator
    {
        double Add(double num1, double num2);
        double Substract(double num1, double num2);
        double Multiply(double num1, double num2);
        double Divide(double num1, double num2);
    }
}
