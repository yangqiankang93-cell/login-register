using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using 逻辑层; // 确保这句引用还在


public partial class Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // 1. 没登录就踢回登录页
        if (Session["CurrentUser"] == null)
        {
            Response.Redirect("Login.aspx");
            return;
        }

        if (!IsPostBack)
        {
            string userName = Session["CurrentUser"].ToString();
            lblUser.Text = userName;
            lblBigUser.Text = userName;
        }
    }

    protected void BtnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }
}