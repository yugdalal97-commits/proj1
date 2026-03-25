<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="proj1.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lbl_sess" runat="server"></asp:Label>
            <br />
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Upload CSV" OnClick="Button1_Click" />
            <br />
            <br />
            <asp:Button ID="analy" runat="server" Text="Analyze" OnClick="analy_Click"/>
            <br />
            <br />
            <asp:Image ID="Image1" runat="server" />
            <br />
        </div>
    </form>
</body>
</html>
