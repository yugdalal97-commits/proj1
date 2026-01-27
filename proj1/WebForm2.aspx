<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="proj1.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div>
    <h2>Login Nigga</h2>
    <table>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Email :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tb_lemail" runat="server"></asp:TextBox>
            </td>
           
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Password :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="tb_lpass" runat="server"></asp:TextBox>
            </td> 
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
