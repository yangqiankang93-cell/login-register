<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ForgotPassword.aspx.cs" Inherits="ForgotPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>找回密码 - 2025期末作业</title>
    <link rel="stylesheet" href="styles/gradient-effect.css" />
    <style>
        /* 保持统一的 CSS 风格 */
        body {
            background-color: #f0f2f5;
            font-family: 'Segoe UI', 微软雅黑, Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #ffffff;
            width: 420px;
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
        }

        .form-group { margin-bottom: 20px; }

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
            transition: border-color 0.3s;
        }

        .form-control:focus { border-color: #4a90e2; outline: none; }
        
        /* 只读输入框样式，灰色背景 */
        .form-control[readonly] {
            background-color: #e9ecef;
            cursor: not-allowed;
        }

        .btn-submit {
            width: 100%;
            padding: 12px;
            background-color: #2ecc71; /* 使用绿色代表"更新/修改"成功 */
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
        }

        .btn-submit:hover { background-color: #27ae60; }

        .error-msg { font-size: 12px; color: #e74c3c; margin-top: 5px; display: block; }
        
        .bottom-link { text-align: center; margin-top: 20px; font-size: 14px; }
        .bottom-link a { color: #4a90e2; text-decoration: none; margin: 0 10px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>重置密码</h2>

            <div class="form-group">
                <label class="form-label">用户名</label>
                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="请输入你的用户名"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtUserName" 
                    ErrorMessage="* 必填" CssClass="error-msg" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label class="form-label">验证手机号</label>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="注册时填写的手机号"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" 
                    ErrorMessage="* 必填" CssClass="error-msg" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label class="form-label">设置新密码</label>
                <asp:TextBox ID="txtNewPwd" runat="server" CssClass="form-control" TextMode="Password" placeholder="请输入新密码"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPwd" runat="server" ControlToValidate="txtNewPwd" 
                    ErrorMessage="* 必填" CssClass="error-msg" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <asp:Button ID="btnReset" runat="server" Text="确认重置" CssClass="btn-submit" OnClick="btnReset_Click" />

            <div class="bottom-link">
                <a href="Login.aspx">返回登录</a> | <a href="Register.aspx">注册账号</a>
            </div>
        </div>
    </form>
    <script src="scripts/gradient-effect.js"></script>
</body>
</html>
