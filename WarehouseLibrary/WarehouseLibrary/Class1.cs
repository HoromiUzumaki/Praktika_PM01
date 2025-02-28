using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WarehouseLibrary
{
    public class Class1
    {
        private readonly WarehouseManagementEntities1 _context;

        public Class1()
        {
            _context = new WarehouseManagementEntities1();
        }

        // Метод 1: Подсчет общего количества товаров на всех складах
        public int CalculateTotalQuantity()
        {
            return _context.Stock.Sum(s => s.Quantity);
        }

        // Перегрузка метода 1: Подсчет количества товаров на конкретном складе
        public int CalculateTotalQuantity(int warehouseID)
        {
            return _context.Stock
                .Where(s => s.WarehouseID == warehouseID)
                .Sum(s => s.Quantity);
        }

        // Метод 2: Подсчет общей стоимости товаров на всех складах
        public decimal CalculateTotalValue()
        {
            return _context.Stock
                .Join(_context.Products,
                    stock => stock.ProductID,
                    product => product.ProductID,
                    (stock, product) => new { stock.Quantity, product.Price })
                .Sum(x => x.Quantity * x.Price);
        }

        // Перегрузка метода 2: Подсчет стоимости товаров на конкретном складе
        public decimal CalculateTotalValue(int warehouseID)
        {
            return _context.Stock
                .Where(s => s.WarehouseID == warehouseID)
                .Join(_context.Products,
                    stock => stock.ProductID,
                    product => product.ProductID,
                    (stock, product) => new { stock.Quantity, product.Price })
                .Sum(x => x.Quantity * x.Price);
        }

        // Метод 3: Подсчет количества товаров по категориям на всех складах
        public Dictionary<string, int> CalculateQuantityByCategory()
        {
            return _context.Stock
                .Join(_context.Products,
                    stock => stock.ProductID,
                    product => product.ProductID,
                    (stock, product) => new { product.Category, stock.Quantity })
                .GroupBy(x => x.Category)
                .ToDictionary(g => g.Key, g => g.Sum(x => x.Quantity));
        }

        // Перегрузка метода 3: Подсчет количества товаров по категориям на конкретном складе
        public Dictionary<string, int> CalculateQuantityByCategory(int warehouseID)
        {
            return _context.Stock
                .Where(s => s.WarehouseID == warehouseID)
                .Join(_context.Products,
                    stock => stock.ProductID,
                    product => product.ProductID,
                    (stock, product) => new { product.Category, stock.Quantity })
                .GroupBy(x => x.Category)
                .ToDictionary(g => g.Key, g => g.Sum(x => x.Quantity));
        }
    }
}

