<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>应县木塔文创周边 - 用户中心</title>
    <link rel="stylesheet" href="styles/gradient-effect.css" />
    <link rel="stylesheet" href="styles/shop-theme.css" />
    <style>
        body { background-color: #f5f2ee; font-family: 'Segoe UI', 微软雅黑, sans-serif; margin: 0; }
        .navbar { background: #fffaf3; padding: 0 40px; height: 70px; display: flex; align-items: center; justify-content: space-between; box-shadow: 0 8px 20px rgba(58, 47, 42, 0.08); position: relative; z-index: 2; }
        .logo { font-size: 20px; font-weight: bold; color: #a35c2a; }
        .container { max-width: 1000px; margin: 40px auto; padding: 0 20px; position: relative; z-index: 1; }
        .welcome-card { background: linear-gradient(135deg, #d89054, #f1c9a5); color: #3a2f2a; padding: 40px; border-radius: 16px; margin-bottom: 30px; box-shadow: 0 4px 15px rgba(163, 92, 42, 0.2); }
        .grid-menu { display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: 20px; }
        .menu-item { background: #fff; padding: 24px; border-radius: 16px; text-align: center; cursor: pointer; text-decoration: none; color: #3a2f2a; box-shadow: 0 6px 18px rgba(58, 47, 42, 0.08); display:block; font-weight: 600; }
        .menu-item:hover { transform: translateY(-5px); box-shadow: 0 8px 20px rgba(58, 47, 42, 0.12); }
        .icon { font-size: 40px; margin-bottom: 15px; display: block; }
        .btn-logout { background: #a35c2a; color: #fff; border: none; padding: 6px 16px; border-radius: 6px; cursor: pointer; }
        .nav-links a { margin-left: 16px; color: #6b4e3d; text-decoration: none; font-weight: 600; }
        .nav-links a:hover { color: #d07b34; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <div class="logo">应县木塔文创周边</div>
            <div>
                <span class="nav-links">
                    <a href="Shop.aspx">在线商城</a>
                    <a href="ProductManage.aspx">商品管理</a>
                </span>
                <span style="margin-right:15px; color:#666;">你好，<asp:Label ID="lblUser" runat="server"></asp:Label></span>
                <asp:Button ID="btnLogout" runat="server" Text="退出" CssClass="btn-logout" OnClick="BtnLogout_Click" />
            </div>
        </div>

        <div class="container">
            <div class="welcome-card">
                <h1>欢迎回来，<asp:Label ID="lblBigUser" runat="server"></asp:Label>！</h1>
                <p>今天是 <%= DateTime.Now.ToString("yyyy年MM月dd日") %></p>
                <p>推荐探索应县木塔文创周边，挑选最具文化底蕴的好物。</p>
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
                <a href="Shop.aspx" class="menu-item">
                    <span class="icon">🛍️</span>
                    <span>进入在线商城</span>
                </a>
                <a href="ProductManage.aspx" class="menu-item">
                    <span class="icon">📦</span>
                    <span>商品管理</span>
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
