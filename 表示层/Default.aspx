<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>系统首页 - 仪表盘</title>
    <link rel="stylesheet" href="styles/gradient-effect.css" />
    <style>
        body { background-color: #f0f2f5; font-family: 'Segoe UI', 微软雅黑, sans-serif; margin: 0; }
        .navbar { background: #fff; padding: 0 40px; height: 60px; display: flex; align-items: center; justify-content: space-between; box-shadow: 0 2px 5px rgba(0,0,0,0.05); position: relative; z-index: 2; }
        .logo { font-size: 20px; font-weight: bold; color: #4a90e2; }
        .container { max-width: 1000px; margin: 40px auto; padding: 0 20px; position: relative; z-index: 1; }
        .welcome-card { background: linear-gradient(135deg, #4a90e2, #63a4ff); color: white; padding: 40px; border-radius: 10px; margin-bottom: 30px; box-shadow: 0 4px 15px rgba(74, 144, 226, 0.3); }
        .grid-menu { display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; }
        .menu-item { background: #fff; padding: 30px; border-radius: 10px; text-align: center; cursor: pointer; text-decoration: none; color: #333; box-shadow: 0 2px 8px rgba(0,0,0,0.05); display:block; }
        .menu-item:hover { transform: translateY(-5px); box-shadow: 0 5px 15px rgba(0,0,0,0.1); }
        .icon { font-size: 40px; margin-bottom: 15px; display: block; }
        .btn-logout { background: #ff4d4f; color: #fff; border: none; padding: 5px 15px; border-radius: 4px; cursor: pointer; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <div class="logo">UserSystem 2.0</div>
            <div>
                <span style="margin-right:15px; color:#666;">你好，<asp:Label ID="lblUser" runat="server"></asp:Label></span>
                <asp:Button ID="btnLogout" runat="server" Text="退出" CssClass="btn-logout" OnClick="BtnLogout_Click" />
            </div>
        </div>

        <div class="container">
            <div class="welcome-card">
                <h1>欢迎回来，<asp:Label ID="lblBigUser" runat="server"></asp:Label>！</h1>
                <p>今天是 <%= DateTime.Now.ToString("yyyy年MM月dd日") %></p>
            </div>

            <div class="grid-menu">
                <a href="EditProfile.aspx" class="menu-item">
                    <span class="icon">📝</span>
                    <span>修改资料</span>
                </a>
                <a href="ChangePassword.aspx" class="menu-item">
                    <span class="icon">🔒</span>
                    <span>修改密码</span>
                </a>
                <a href="#" class="menu-item" onclick="alert('开发中...')">
                    <span class="icon">🎧</span>
                    <span>联系客服</span>
                </a>
            </div>
            
            <div style="text-align:center; margin-top:50px; color:#999; font-size:12px;">
                在线人数：<%= Application["OnlineUsers"] %>
            </div>
        </div>
    </form>
    <script src="scripts/gradient-effect.js"></script>
</body>
</html>