<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="proj1.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background: linear-gradient(135deg, #1e3a8a, #2563eb);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .login-card {
            background: white;
            padding: 35px;
            border-radius: 12px;
            width: 320px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.2);
        }

        .title {
            text-align: center;
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 25px;
            color: #1e293b;
        }

        .input-group {
            margin-bottom: 18px;
        }

        .label {
            display: block;
            font-size: 14px;
            margin-bottom: 6px;
            color: #475569;
        }

        .input {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #cbd5e1;
            outline: none;
            transition: 0.2s;
        }

        .input:focus {
            border-color: #2563eb;
            box-shadow: 0 0 0 2px rgba(37,99,235,0.2);
        }

        .btn {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 8px;
            background: #2563eb;
            color: white;
            font-weight: 500;
            cursor: pointer;
            transition: 0.2s;
        }

        .btn:hover {
            background: #1d4ed8;
        }

        .message {
            margin-top: 10px;
            text-align: center;
            font-size: 14px;
            color: #dc2626;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="login-card">

            <div class="title">Login</div>

            <div class="input-group">
                <label class="label">Email</label>
                <asp:TextBox ID="txt_lemail" runat="server" CssClass="input"></asp:TextBox>
            </div>

            <div class="input-group">
                <label class="label">Password</label>
                <asp:TextBox ID="txt_lpass" runat="server" CssClass="input" TextMode="Password"></asp:TextBox>
            </div>

            <asp:Button ID="btn_sub" runat="server" Text="Login" CssClass="btn" OnClick="btn_sub_Click" />

            <asp:Label ID="lbl_message" runat="server" CssClass="message"></asp:Label>

        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:chstring %>"
            ProviderName="<%$ ConnectionStrings:chstring.ProviderName %>"
            SelectCommand="SELECT [SalesDate], [Quantity] FROM [sales_tbl]">
        </asp:SqlDataSource>

    </form>
</body>
</html>
