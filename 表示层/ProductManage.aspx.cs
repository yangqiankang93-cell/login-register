using System;
using 逻辑层;
using 数据层;

public partial class ProductManage : System.Web.UI.Page
{
    private readonly ProductBLL _bll = new ProductBLL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CurrentUser"] == null)
        {
            Response.Redirect("Login.aspx");
            return;
        }

        if (!IsPostBack)
        {
            BindProducts();
        }
    }

    protected void BtnSave_Click(object sender, EventArgs e)
    {
        if (!TryBuildProduct(out ProductInfo product, out string errorMessage))
        {
            lblMessage.Text = errorMessage;
            return;
        }

        bool result;
        if (string.IsNullOrWhiteSpace(hfProductId.Value))
        {
            result = _bll.AddProduct(product);
            lblMessage.Text = result ? "商品新增成功" : "商品新增失败";
        }
        else
        {
            product.ProductID = int.Parse(hfProductId.Value);
            result = _bll.UpdateProduct(product);
            lblMessage.Text = result ? "商品更新成功" : "商品更新失败";
        }

        if (result)
        {
            ClearForm();
            BindProducts();
        }
    }

    protected void BtnReset_Click(object sender, EventArgs e)
    {
        ClearForm();
    }

    protected void GvProducts_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
    {
        if (!int.TryParse(e.CommandArgument.ToString(), out int productId))
        {
            return;
        }

        if (e.CommandName == "EditProduct")
        {
            LoadProduct(productId);
        }
        else if (e.CommandName == "DeleteProduct")
        {
            bool result = _bll.DeleteProduct(productId);
            lblMessage.Text = result ? "商品删除成功" : "商品删除失败";
            BindProducts();
        }
    }

    private void BindProducts()
    {
        gvProducts.DataSource = _bll.GetAllProducts();
        gvProducts.DataBind();
    }

    private void LoadProduct(int productId)
    {
        ProductInfo product = _bll.GetProductById(productId);
        if (product == null)
        {
            lblMessage.Text = "未找到商品信息";
            return;
        }

        hfProductId.Value = product.ProductID.ToString();
        txtName.Text = product.Name;
        txtCategory.Text = product.Category;
        txtPrice.Text = product.Price.ToString("F2");
        txtStock.Text = product.Stock.ToString();
        txtImageUrl.Text = product.ImageUrl;
        txtDescription.Text = product.Description;
    }

    private bool TryBuildProduct(out ProductInfo product, out string errorMessage)
    {
        product = null;
        errorMessage = string.Empty;

        if (string.IsNullOrWhiteSpace(txtName.Text))
        {
            errorMessage = "请填写商品名称";
            return false;
        }

        if (!decimal.TryParse(txtPrice.Text, out decimal price))
        {
            errorMessage = "价格格式不正确";
            return false;
        }

        if (!int.TryParse(txtStock.Text, out int stock))
        {
            errorMessage = "库存格式不正确";
            return false;
        }

        product = new ProductInfo
        {
            Name = txtName.Text.Trim(),
            Category = txtCategory.Text.Trim(),
            Price = price,
            Stock = stock,
            ImageUrl = txtImageUrl.Text.Trim(),
            Description = txtDescription.Text.Trim()
        };

        return true;
    }

    private void ClearForm()
    {
        hfProductId.Value = string.Empty;
        txtName.Text = string.Empty;
        txtCategory.Text = string.Empty;
        txtPrice.Text = string.Empty;
        txtStock.Text = string.Empty;
        txtImageUrl.Text = string.Empty;
        txtDescription.Text = string.Empty;
        lblMessage.Text = string.Empty;
    }
}
