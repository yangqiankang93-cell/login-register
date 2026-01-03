<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>修改登录密码 - 2025期末作业</title>
    <link rel="stylesheet" href="styles/gradient-effect.css" />
    <style>
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
            width: 400px;
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
            margin-bottom: 20px;
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
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>修改登录密码</h2>

            <div class="form-group">
                <label class="form-label">原密码</label>
                <asp:TextBox ID="txtOldPwd" runat="server" CssClass="form-control" TextMode="Password" placeholder="请输入原密码"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvOldPwd" runat="server" ControlToValidate="txtOldPwd" 
                    ErrorMessage="* 原密码不能为空" CssClass="error-msg" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label class="form-label">新密码</label>
                <asp:TextBox ID="txtNewPwd" runat="server" CssClass="form-control" TextMode="Password" placeholder="请输入新密码"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNewPwd" runat="server" ControlToValidate="txtNewPwd" 
                    ErrorMessage="* 新密码不能为空" CssClass="error-msg" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label class="form-label">确认新密码</label>
                <asp:TextBox ID="txtConfirmPwd" runat="server" CssClass="form-control" TextMode="Password" placeholder="请再次输入新密码"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvConfirmPwd" runat="server" ControlToValidate="txtConfirmPwd" 
                    ErrorMessage="* 确认密码不能为空" CssClass="error-msg" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvPwd" runat="server" ControlToValidate="txtConfirmPwd" 
                    ControlToCompare="txtNewPwd" ErrorMessage="* 两次密码不一致" CssClass="error-msg" Display="Dynamic"></asp:CompareValidator>
            </div>

            <asp:Button ID="btnChange" runat="server" Text="确认修改" CssClass="btn-submit" OnClick="BtnChange_Click" />

            <div class="bottom-link">
                <a href="Default.aspx">返回首页</a>
            </div>
        </div>
    </form>
    <script src="scripts/gradient-effect.js"></script>
</body>
</html>
