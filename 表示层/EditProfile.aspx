<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditProfile.aspx.cs" Inherits="EditProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>修改资料</title>
    <link rel="stylesheet" href="styles/gradient-effect.css" />
    <style>
        body { font-family: 微软雅黑; padding: 50px; background-color: #f5f5f5; }
        .box { width: 400px; background: white; padding: 30px; margin: 0 auto; border-radius: 8px; position: relative; z-index: 1; }
        .row { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; color: #666; }
        input[type="text"] { width: 100%; padding: 8px; box-sizing: border-box; }
        .btn { width: 100%; padding: 10px; background: #4a90e2; color: white; border: none; cursor: pointer; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="box">
            <h3>修改个人资料</h3>
            
            <div class="row">
                <label>用户名：</label>
                <asp:TextBox ID="txtUser" runat="server" ReadOnly="true" BackColor="#eee"></asp:TextBox>
            </div>

            <div class="row">
                <label>邮箱：</label>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </div>

            <div class="row">
                <label>手机号：</label>
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
            </div>

            <asp:Button ID="btnSave" runat="server" Text="保存修改" CssClass="btn" OnClick="btnSave_Click" />
            <br /><br />
            <a href="Default.aspx">返回首页</a>
        </div>
    </form>
    <script src="scripts/gradient-effect.js"></script>
</body>
</html>
