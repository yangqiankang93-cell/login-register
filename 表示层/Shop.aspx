<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop.aspx.cs" Inherits="Shop" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>应县木塔文创周边 - 在线商城</title>
    <link rel="stylesheet" href="styles/shop-theme.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="navbar">
            <div class="logo">应县木塔文创周边</div>
            <div class="nav-links">
                <a href="Default.aspx">个人中心</a>
                <a href="ProductManage.aspx">商品管理</a>
                <a href="Shop.aspx">在线商城</a>
            </div>
        </div>

        <section class="hero">
            <h1>遇见木塔文化，带走古建灵感</h1>
            <p>精选应县木塔文创周边，从模型摆件到生活好物，每一件都承载千年木构之美。带你把文化带回家。</p>
        </section>

        <div class="container">
            <h2 class="section-title">精选商品</h2>
            <asp:Repeater ID="rptProducts" runat="server">
                <ItemTemplate>
                    <div class="product-card">
                        <img src="<%# Eval("ImageUrl") %>" alt="<%# Eval("Name") %>" />
                        <div class="content">
                            <span class="badge"><%# Eval("Category") %></span>
                            <h3><%# Eval("Name") %></h3>
                            <p><%# Eval("Description") %></p>
                            <div class="product-meta">
                                <span>￥<%# Eval("Price", "{0:F2}") %></span>
                                <span>库存 <%# Eval("Stock") %></span>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <HeaderTemplate>
                    <div class="card-grid">
                </HeaderTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
