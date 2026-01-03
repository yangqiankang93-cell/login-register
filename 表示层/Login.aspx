<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>用户登录 - 2025期末作业</title>
    <link rel="stylesheet" href="styles/gradient-effect.css" />
    <style>
        /* 复用注册页面的 CSS，保持风格完全一致 */
        body {
            background-color: #f0f2f5;
            font-family: 'Segoe UI', 微软雅黑, Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: #ffffff;
            width: 400px; /* 登录框稍微窄一点 */
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            position: relative;
            z-index: 1;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 25px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            color: #666;
            font-weight: 500;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            font-size: 14px;
            transition: border-color 0.3s;
        }

        .form-control:focus {
            border-color: #4a90e2;
            outline: none;
        }

        .btn-submit {
            width: 100%;
            padding: 12px;
            background-color: #4a90e2;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 10px;
        }

        .btn-submit:hover {
            background-color: #357abd;
        }

        .error-msg {
            font-size: 12px;
            color: #e74c3c;
            margin-top: 5px;
            display: block;
        }

        .bottom-link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }
        
        .bottom-link a {
            color: #4a90e2;
            text-decoration: none;
        }
    </style>
   <script type="text/javascript">
       function changeCode() {
           var img = document.getElementById("imgCode");
           img.src = "CheckCode.ashx?t=" + new Date().getTime();
       }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>用户登录</h2>

            <div class="form-group">
                <label class="form-label">用户名</label>
                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="请输入用户名"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtUserName" 
                    ErrorMessage="* 请输入用户名" CssClass="error-msg" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label class="form-label">密码</label>
                <asp:TextBox ID="txtPwd" runat="server" CssClass="form-control" TextMode="Password" placeholder="请输入密码"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPwd" runat="server" ControlToValidate="txtPwd" 
                    ErrorMessage="* 请输入密码" CssClass="error-msg" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
            <label class="form-label">验证码</label>
            <div style="display:flex; align-items:center;">
                <asp:TextBox ID="txtCode" runat="server" CssClass="form-control" style="width:100px; margin-right:10px;"></asp:TextBox>
                <img id="imgCode" src="CheckCode.ashx" onclick="changeCode()" style="cursor:pointer;" title="看不清？点击更换" />
            </div>
        </div>
            <asp:Button ID="btnLogin" runat="server" Text="登录" CssClass="btn-submit" OnClick="btnLogin_Click" />

            <div class="bottom-link">
                <a href="ForgotPassword.aspx" style="color: #666;">忘记密码？</a>
                还没有账号？<a href="Register.aspx">去注册</a>
            </div>
            <div style="margin-top:30px; text-align:center; color:#888; font-size:12px; border-top:1px solid #eee; padding-top:10px;">
            当前在线人数: <%= Application["OnlineUsers"] %> 人  |  
            网站总访问量: <%= Application["TotalVisits"] %> 次
        </div>
        </div>
    </form>
    <script src="scripts/gradient-effect.js"></script>
</body>
</html>
