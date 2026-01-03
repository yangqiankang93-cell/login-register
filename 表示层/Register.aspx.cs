using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using 逻辑层; // 引用 BLL
using 数据层;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // 页面首次加载时的初始化逻辑（如有需要）
        }
    }
    protected void ChkAgree_CheckedChanged(object sender, EventArgs e)
    {
       

        // 为了美观，可以动态改变按钮颜色（可选，这里用 Enabled 属性自带的样式即可）
    }
    protected void BtnRegister_Click(object sender, EventArgs e)
    {
        // 1. 必填验证：虽然前端有验证控件，后台最好也判断一下 Page.IsValid
        string serverCode = Session["CheckCode"] as string;       // 系统生成的
        string userCode = txtCode.Text.Trim().ToUpper();          // 用户输入的

        // 如果 Session 过期(null) 或者 验证码不匹配
        if (string.IsNullOrEmpty(serverCode) || serverCode != userCode)
        {
            Response.Write("<script>alert('验证码错误！');</script>");

            // 刷新一下验证码输入框
            txtCode.Text = "";

            return; // 【至关重要】阻止代码继续执行，防止存入数据库！
        }

        // ---------------------------------------------------------
        // 2. 协议检测
        // ---------------------------------------------------------
        if (!chkAgree.Checked)
        {
            Response.Write("<script>alert('请同意协议！');</script>");
            return;
        }

        // ---------------------------------------------------------
        // 3. 注册逻辑 (只有上面都通过了，才会走到这)
        // ---------------------------------------------------------
        Users newUser = new Users();
        newUser.UserName = txtUserName.Text.Trim();
        newUser.Password = EncryptHelper.GetMD5Hash(txtPwd.Text.Trim()); // MD5加密
        newUser.Phone = txtPhone.Text.Trim();
        newUser.Email = txtEmail.Text.Trim();
        // ... 其他字段赋值 ...

        UserBLL bll = new UserBLL();
        string result = bll.RegisterUser(newUser);

        if (result == "注册成功")
        {
            Response.Write("<script>alert('注册成功！');window.location='Login.aspx';</script>");
        }
        else
        {
            Response.Write("<script>alert('" + result + "');</script>");
        }
    }
}
