using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using 逻辑层; // 引用业务逻辑层
using 数据层; // 引用实体数据层 (用于 Users 对象)

public partial class EditProfile : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        // 1. 安全检查：如果没登录，直接踢回登录页
        if (Session["CurrentUser"] == null)
        {
            Response.Redirect("Login.aspx");
            return;
        }

        if (!IsPostBack)
        {
            // 2. 页面首次加载，进行"数据回显"
            // (也就是把用户原来的信息填在框里)
            string userName = Session["CurrentUser"].ToString();

            // 显示用户名 (只读)
            txtUser.Text = userName;

            // 调用 BLL 获取详细信息
            UserBLL bll = new UserBLL();
            Users currentUser = bll.GetUserInfo(userName);

            if (currentUser != null)
            {
                txtEmail.Text = currentUser.Email;
                txtPhone.Text = currentUser.Phone;
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        // 1. 获取当前用户和输入的新数据
        string userName = Session["CurrentUser"].ToString();
        string newEmail = txtEmail.Text.Trim();
        string newPhone = txtPhone.Text.Trim();

        UserBLL bll = new UserBLL();

        // 2. 调用逻辑层更新数据
        // (注意：UpdateUserInfo 方法必须在 UserBLL.cs 里写好)
        bool result = bll.UpdateUserInfo(userName, newEmail, newPhone);

        if (result)
        {
            Response.Write("<script>alert('资料修改成功！');window.location='Default.aspx';</script>");
        }
        else
        {
            Response.Write("<script>alert('修改失败，请稍后重试。');</script>");
        }
    }
}
