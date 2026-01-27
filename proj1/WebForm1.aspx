<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="proj1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 150px;
        }
        .auto-style2 {
            width: 146px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Register Nigga</h2>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Full Name :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tb_name" runat="server"></asp:TextBox>
                    </td>
                   
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Email :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tb_email" runat="server"></asp:TextBox>
                    </td>
                   
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text="Password :"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="tb_pass" runat="server"></asp:TextBox>
                    </td>
                    
                   
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text="State :"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddl_state" runat="server">
                        </asp:DropDownList>
                    </td>
                    
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text="City :"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddl_city" runat="server">
                        </asp:DropDownList>
                    </td>
                    
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button ID="btn_sub" runat="server" Text="Submit"/>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
