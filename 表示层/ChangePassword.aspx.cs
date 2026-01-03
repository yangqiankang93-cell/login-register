using System;
using System.Web.UI;
using 逻辑层; // 引用 BLL

public partial class ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["CurrentUser"] == null)
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void BtnChange_Click(object sender, EventArgs e)
    {
        string userName = Session["CurrentUser"].ToString();
        string oldPwd = txtOldPwd.Text.Trim();
        string newPwd = txtNewPwd.Text.Trim();

        var bll = new UserBLL();

        // 逻辑层方法 ChangePassword 会做以下事：
        // 1. 把 oldPwd 加密，去数据库比对是不是真的原密码
        // 2. 如果对，把 newPwd 加密，更新数据库
        bool result = bll.ChangePassword(userName, oldPwd, newPwd);

        if (result)
        {
            // 修改成功，强制退出，要求重新登录
            Session.Abandon();
            Response.Write("<script>alert('修改成功！请使用新密码重新登录。');window.location='Login.aspx';</script>");
        }
        else
        {
            // 修改失败（通常是因为原密码输错了）
            Response.Write("<script>alert('修改失败：原密码输入错误！');</script>");
        }
    }
}