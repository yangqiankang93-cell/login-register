using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace 数据层
{
    public class ProductDAL
    {
        public List<ProductInfo> GetAllProducts()
        {
            const string sql = @"SELECT ProductID, Name, Category, Price, Stock, ImageUrl, Description
                                 FROM Products
                                 ORDER BY ProductID DESC";
            DataTable table = DBHelper.ExecuteDataTable(sql);
            return MapProducts(table);
        }

        public ProductInfo GetProductById(int productId)
        {
            const string sql = @"SELECT ProductID, Name, Category, Price, Stock, ImageUrl, Description
                                 FROM Products
                                 WHERE ProductID = @ProductID";
            DataTable table = DBHelper.ExecuteDataTable(sql, new SqlParameter("@ProductID", productId));
            List<ProductInfo> products = MapProducts(table);
            return products.Count > 0 ? products[0] : null;
        }

        public int AddProduct(ProductInfo product)
        {
            const string sql = @"INSERT INTO Products (Name, Category, Price, Stock, ImageUrl, Description)
                                 VALUES (@Name, @Category, @Price, @Stock, @ImageUrl, @Description)";
            return DBHelper.ExecuteNonQuery(sql,
                new SqlParameter("@Name", product.Name),
                new SqlParameter("@Category", (object)product.Category ?? DBNull.Value),
                new SqlParameter("@Price", product.Price),
                new SqlParameter("@Stock", product.Stock),
                new SqlParameter("@ImageUrl", (object)product.ImageUrl ?? DBNull.Value),
                new SqlParameter("@Description", (object)product.Description ?? DBNull.Value));
        }

        public int UpdateProduct(ProductInfo product)
        {
            const string sql = @"UPDATE Products
                                 SET Name = @Name,
                                     Category = @Category,
                                     Price = @Price,
                                     Stock = @Stock,
                                     ImageUrl = @ImageUrl,
                                     Description = @Description
                                 WHERE ProductID = @ProductID";
            return DBHelper.ExecuteNonQuery(sql,
                new SqlParameter("@Name", product.Name),
                new SqlParameter("@Category", (object)product.Category ?? DBNull.Value),
                new SqlParameter("@Price", product.Price),
                new SqlParameter("@Stock", product.Stock),
                new SqlParameter("@ImageUrl", (object)product.ImageUrl ?? DBNull.Value),
                new SqlParameter("@Description", (object)product.Description ?? DBNull.Value),
                new SqlParameter("@ProductID", product.ProductID));
        }

        public int DeleteProduct(int productId)
        {
            const string sql = "DELETE FROM Products WHERE ProductID = @ProductID";
            return DBHelper.ExecuteNonQuery(sql, new SqlParameter("@ProductID", productId));
        }

        private List<ProductInfo> MapProducts(DataTable table)
        {
            List<ProductInfo> products = new List<ProductInfo>();
            foreach (DataRow row in table.Rows)
            {
                products.Add(new ProductInfo
                {
                    ProductID = Convert.ToInt32(row["ProductID"]),
                    Name = row["Name"].ToString(),
                    Category = row["Category"].ToString(),
                    Price = Convert.ToDecimal(row["Price"]),
                    Stock = Convert.ToInt32(row["Stock"]),
                    ImageUrl = row["ImageUrl"] == DBNull.Value ? string.Empty : row["ImageUrl"].ToString(),
                    Description = row["Description"] == DBNull.Value ? string.Empty : row["Description"].ToString()
                });
            }
            return products;
        }
    }
}
