<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ProductManage.aspx.cs" Inherits="ProductManage" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>商品管理 - 应县木塔文创周边</title>
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

        <div class="container">
            <h2 class="section-title">商品信息维护</h2>
            <div class="manage-panel">
                <asp:HiddenField ID="hfProductId" runat="server" />
                <div class="form-row">
                    <div>
                        <label>商品名称</label>
                        <asp:TextBox ID="txtName" runat="server" />
                    </div>
                    <div>
                        <label>分类</label>
                        <asp:TextBox ID="txtCategory" runat="server" />
                    </div>
                </div>
                <div class="form-row">
                    <div>
                        <label>价格（￥）</label>
                        <asp:TextBox ID="txtPrice" runat="server" />
                    </div>
                    <div>
                        <label>库存</label>
                        <asp:TextBox ID="txtStock" runat="server" />
                    </div>
                </div>
                <div class="form-row">
                    <div>
                        <label>图片链接</label>
                        <asp:TextBox ID="txtImageUrl" runat="server" />
                    </div>
                    <div>
                        <label>描述</label>
                        <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" Rows="3" />
                    </div>
                </div>
                <div class="form-actions">
                    <asp:Button ID="btnSave" runat="server" Text="保存" CssClass="btn-primary" OnClick="BtnSave_Click" />
                    <asp:Button ID="btnReset" runat="server" Text="清空" CssClass="btn-secondary" OnClick="BtnReset_Click" />
                </div>
                <asp:Label ID="lblMessage" runat="server" CssClass="status-message" />
            </div>

            <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" CssClass="gridview" OnRowCommand="GvProducts_RowCommand">
                <Columns>
                    <asp:BoundField DataField="ProductID" HeaderText="ID" />
                    <asp:BoundField DataField="Name" HeaderText="商品名称" />
                    <asp:BoundField DataField="Category" HeaderText="分类" />
                    <asp:BoundField DataField="Price" HeaderText="价格" DataFormatString="{0:F2}" />
                    <asp:BoundField DataField="Stock" HeaderText="库存" />
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditProduct" CommandArgument="<%# Eval("ProductID") %>">编辑</asp:LinkButton>
                            |
                            <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteProduct" CommandArgument="<%# Eval("ProductID") %>" OnClientClick="return confirm('确定要删除该商品吗？');">删除</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
