using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using 逻辑层;
public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string serverCode = Session["CheckCode"] as string;       // 获取系统生成的
        string userCode = txtCode.Text.Trim().ToUpper();          // 获取用户输入的

        // 如果 Session 过期 或者 验证码不对
        if (string.IsNullOrEmpty(serverCode) || serverCode != userCode)
        {
            Response.Write("<script>alert('验证码错误！');</script>");
            txtCode.Text = ""; // 清空验证码输入框
            return; // 【重要】阻止继续登录
        }

        // ---------------------------------------------------------
        // 2. 执行正常的登录逻辑
        // ---------------------------------------------------------
        string name = txtUserName.Text.Trim();
        string pwd = txtPwd.Text.Trim();

        UserBLL bll = new UserBLL();

        // 调用逻辑层进行验证 (BLL层会自动把 pwd 进行 MD5 加密后去数据库比对)
        if (bll.Login(name, pwd))
        {
            // 登录成功
            Session["CurrentUser"] = name; // 记录登录状态

            // 跳转到个人中心页
            Response.Redirect("Default.aspx");
        }
        else
        {
            // 登录失败
            Response.Write("<script>alert('登录失败：用户名或密码错误！');</script>");
        }
    }
}