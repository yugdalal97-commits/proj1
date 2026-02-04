<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="proj1.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="text-align:center;">
    <form id="form1" runat="server">
       
    <h2 >Login </h2>
    <table style="margin:auto;">
        <tr>
            <td>
                <asp:Label ID="lbl_lemail" runat="server" Text="Email :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_lemail" runat="server"></asp:TextBox>
            </td>
           
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbl_lpass" runat="server" Text="Password :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_lpass" runat="server"></asp:TextBox>
            </td> 
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btn_sub" runat="server" Text="Submit" OnClick="btn_sub_Click"/>
            </td>
        </tr>
        <tr>
    <td colspan="2">
        
        <asp:Label ID="lbl_message" runat="server"></asp:Label>
        
    </td>
</tr>
    </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:chstring %>" ProviderName="<%$ ConnectionStrings:chstring.ProviderName %>" SelectCommand="SELECT [SalesDate], [Quantity] FROM [sales_tbl]"></asp:SqlDataSource>
    </form>
</body>
</html>
