<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="proj1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>

    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, sans-serif;
            background: linear-gradient(135deg, #0f172a, #2563eb);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .register-card {
            background: white;
            padding: 35px;
            border-radius: 12px;
            width: 360px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.25);
        }

        .title {
            text-align: center;
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 25px;
            color: #1e293b;
        }

        .input-group {
            margin-bottom: 16px;
        }

        .label {
            display: block;
            font-size: 14px;
            margin-bottom: 6px;
            color: #475569;
        }

        .input, .dropdown {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #cbd5e1;
            outline: none;
            transition: 0.2s;
            background: white;
        }

        .input:focus, .dropdown:focus {
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
            margin-top: 10px;
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

        <div class="register-card">

            <div class="title">Create Account</div>

            <div class="input-group">
                <label class="label">Full Name</label>
                <asp:TextBox ID="tb_name" runat="server" CssClass="input"></asp:TextBox>
            </div>

            <div class="input-group">
                <label class="label">Email</label>
                <asp:TextBox ID="tb_email" runat="server" CssClass="input"></asp:TextBox>
            </div>

            <div class="input-group">
                <label class="label">Password</label>
                <asp:TextBox ID="tb_pass" runat="server" CssClass="input"></asp:TextBox>
            </div>

            <div class="input-group">
                <label class="label">State</label>
                <asp:DropDownList ID="ddl_state" runat="server" CssClass="dropdown"
                    AutoPostBack="True" OnSelectedIndexChanged="ddl_state_SelectedIndexChanged">
                    <asp:ListItem>Select</asp:ListItem>
                    <asp:ListItem>Gujarat</asp:ListItem>
                    <asp:ListItem>Maharashtra</asp:ListItem>
                    <asp:ListItem>Tamil Nadu</asp:ListItem>
                    <asp:ListItem>Rajasthan</asp:ListItem>
                    <asp:ListItem>Himachal Pradesh</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="input-group">
                <label class="label">City</label>
                <asp:DropDownList ID="ddl_city" runat="server" CssClass="dropdown"
                    AppendDataBoundItems="True" AutoPostBack="True"
                    OnSelectedIndexChanged="ddl_city_SelectedIndexChanged">
                    <asp:ListItem>Select State</asp:ListItem>
                </asp:DropDownList>
            </div>

            <asp:Button ID="btn_submit" runat="server" Text="Register"
                CssClass="btn" OnClick="btn_submit_Click" />

            <asp:Label ID="lbl_message" runat="server" CssClass="message"></asp:Label>

        </div>

    </form>
</body>
</html>
