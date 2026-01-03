using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using 逻辑层;
public partial class ForgotPassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnReset_Click(object sender, EventArgs e)
    {
        // 1. 获取输入
        string name = txtUserName.Text.Trim();
        string phone = txtPhone.Text.Trim();
        string newPwd = txtNewPwd.Text.Trim();

        // 2. 调用逻辑层
        UserBLL bll = new UserBLL();

        // 尝试重置
        bool isSuccess = bll.ResetPassword(name, phone, newPwd);

        if (isSuccess)
        {
            // 成功：弹出提示并跳转回登录页
            Response.Write("<script>alert('密码重置成功！请用新密码登录。');window.location='Login.aspx';</script>");
        }
        else
        {
            // 失败：提示用户检查信息
            Response.Write("<script>alert('验证失败：用户名与手机号不匹配，请重试。');</script>");
        }
    }
}