<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>用户注册 - 2025期末作业</title>
    <link rel="stylesheet" href="styles/gradient-effect.css" />
    <style>
        /* 页面整体背景 */
        body {
            background-color: #f0f2f5;
            font-family: 'Segoe UI', 微软雅黑, Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        /* 注册卡片容器 */
        .register-container {
            background-color: #ffffff;
            width: 450px;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            position: relative;
            z-index: 1;
        }

        /* 标题样式 */
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 30px;
            font-weight: 600;
        }

        /* 表单行样式 */
        .form-group {
            margin-bottom: 20px;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            color: #666;
            font-weight: 500;
        }

        /* 输入框美化 */
        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box; /* 关键：防止padding撑破宽度 */
            font-size: 14px;
            transition: border-color 0.3s;
        }

        .form-control:focus {
            border-color: #4a90e2;
            outline: none;
        }

        /* 按钮样式 */
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
        }

        .btn-submit:hover {
            background-color: #357abd;
        }

        .btn-submit:disabled {
            background-color: #cccccc;
            cursor: not-allowed;
        }

        /* 验证错误提示颜色 */
        .error-msg {
            font-size: 12px;
            color: #e74c3c;
            margin-top: 5px;
            display: block;
        }
        
        /* 底部链接 */
        .bottom-link {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
        }
    </style>
    <script type="text/javascript">
        function toggleRegisterBtn() {
            // 1. 直接用简单的 ID 找控件
            var chk = document.getElementById("chkAgree");
            var btn = document.getElementById("btnRegister");

            // 2. 调试：如果没反应，这行会弹窗告诉你
            // alert("找到控件了吗？" + (chk ? "找到了" : "没找到")); 

            // 3. 切换状态
            if (chk && btn) {
                btn.disabled = !chk.checked;
            }
        }
        function changeCode() {
            var img = document.getElementById("imgCode");
            img.src = "CheckCode.ashx?t=" + new Date().getTime();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="register-container">
            <h2>新用户注册</h2>

            <div class="form-group">
                <label class="form-label">用户名</label>
                <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="请输入用户名"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtUserName" 
                    ErrorMessage="* 用户名不能为空" CssClass="error-msg" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label class="form-label">密码</label>
                <asp:TextBox ID="txtPwd" runat="server" CssClass="form-control" TextMode="Password" placeholder="设置登录密码"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPwd" runat="server" ControlToValidate="txtPwd" 
                    ErrorMessage="* 密码不能为空" CssClass="error-msg" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label class="form-label">确认密码</label>
                <asp:TextBox ID="txtConfirmPwd" runat="server" CssClass="form-control" TextMode="Password" placeholder="请再次输入密码"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvConfirm" runat="server" ControlToValidate="txtConfirmPwd" 
                    ErrorMessage="* 请再次输入密码" CssClass="error-msg" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvPwd" runat="server" 
                    ControlToValidate="txtConfirmPwd" 
                    ControlToCompare="txtPwd"
                    ErrorMessage="* 两次输入的密码不一致" CssClass="error-msg" Display="Dynamic"></asp:CompareValidator>
            </div>

            <div class="form-group">
                <label class="form-label">电子邮箱</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="example@mail.com"></asp:TextBox>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ErrorMessage="* 邮箱格式不正确" CssClass="error-msg" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <label class="form-label">手机号码</label>
                <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="11位手机号"></asp:TextBox>
                <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhone"
                    ValidationExpression="^1[3-9]\d{9}$"
                    ErrorMessage="* 请输入有效的手机号码" CssClass="error-msg" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <label class="form-label">身份证号</label>
                <asp:TextBox ID="txtIDCard" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RegularExpressionValidator ID="revIDCard" runat="server" ControlToValidate="txtIDCard"
                    ValidationExpression="(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)"
                    ErrorMessage="* 身份证格式错误" CssClass="error-msg" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <label class="form-label">通讯地址</label>
                <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label class="form-label">邮政编码</label>
                <asp:TextBox ID="txtZipCode" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RegularExpressionValidator ID="revZip" runat="server" ControlToValidate="txtZipCode"
                    ValidationExpression="^[1-9]\d{5}$"
                    ErrorMessage="* 邮编格式错误" CssClass="error-msg" Display="Dynamic"></asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
            <label>验证码</label>
            <div style="display:flex; align-items:center;">
                <asp:TextBox ID="txtCode" runat="server" CssClass="form-control" 
                             placeholder="输入验证码" style="width:120px; margin-right:10px;"></asp:TextBox>
                
                <img id="imgCode" src="CheckCode.ashx" onclick="changeCode()" 
                     style="cursor:pointer; border:1px solid #ccc;" title="看不清？点击更换" />
            </div>
            </div>

            <div class="form-group">
                <asp:CheckBox ID="chkAgree" runat="server" 
    onclick="toggleRegisterBtn()" 
    ClientIDMode="Static" 
    OnCheckedChanged="ChkAgree_CheckedChanged" />
                <label for="chkAgree" style="display:inline; color:#666;">我已阅读并同意《用户注册协议》</label>
            </div>

          <asp:Button ID="btnRegister" runat="server" Text="立即注册" 
            OnClick="BtnRegister_Click" CssClass="btn-submit" />

            <div class="bottom-link">
                <a href="Login.aspx">已有账号？去登录</a>
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
