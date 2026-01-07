using System.Collections.Generic;
using 数据层;

namespace 逻辑层
{
    public class ProductBLL
    {
        private readonly ProductDAL _dal;

        public ProductBLL()
        {
            _dal = new ProductDAL();
        }

        public List<ProductInfo> GetAllProducts()
        {
            return _dal.GetAllProducts();
        }

        public ProductInfo GetProductById(int productId)
        {
            return _dal.GetProductById(productId);
        }

        public bool AddProduct(ProductInfo product)
        {
            return _dal.AddProduct(product) > 0;
        }

        public bool UpdateProduct(ProductInfo product)
        {
            return _dal.UpdateProduct(product) > 0;
        }

        public bool DeleteProduct(int productId)
        {
            return _dal.DeleteProduct(productId) > 0;
        }
    }
}
