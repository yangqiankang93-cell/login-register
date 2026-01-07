using System;
using 逻辑层;

public partial class Shop : System.Web.UI.Page
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

    private void BindProducts()
    {
        rptProducts.DataSource = _bll.GetAllProducts();
        rptProducts.DataBind();
    }
}
