<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="proj1.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
    body {
    font-family: 'Segoe UI', Tahoma, sans-serif;
    background: linear-gradient(135deg, #eef2f7, #e3e8f0);
    margin: 0;
    padding: 0;
}

/* Header */
.header {
    background: #1e293b;
    color: white;
    padding: 15px 30px;
    font-size: 20px;
    font-weight: 600;
    letter-spacing: 0.5px;
    text-align: center;   /* ✅ centers text cleanly */
}

/* Layout */
.container {
    width: 90%;
    max-width: 1100px;
    margin: 30px auto;
}

.card {
    background: #ffffff;
    border-radius: 12px;
    padding: 22px;
    margin-bottom: 25px;
    box-shadow: 0 6px 18px rgba(0,0,0,0.08);
    transition: 0.2s;
}

.card:hover {
    transform: translateY(-2px);
}

.title {
    font-size: 20px;
    font-weight: 600;
    margin-bottom: 15px;
    color: #1e293b;
}

/* Upload Section */
.upload-section {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 15px;
    flex-wrap: wrap;
}

/* Group file + button tightly */
.upload-group {
    display: flex;
    align-items: center;
    gap: 10px;
}

/* Custom File Upload */
.file-label {
    background: #f1f5f9;
    border: 2px dashed #cbd5e1;
    padding: 10px 18px;
    border-radius: 8px;
    cursor: pointer;
    color: #334155;
    font-weight: 500;
    transition: 0.2s;
}

.file-label:hover {
    background: #e2e8f0;
}

.file-input {
    display: none;
}

/* Button */
.btn {
    background: #2563eb;
    color: white;
    border: none;
    padding: 10px 18px;
    border-radius: 8px;
    cursor: pointer;
    transition: 0.2s;
    font-weight: 500;
}

.btn:hover {
    background: #1d4ed8;
}

/* Grid */
.gridview {
    width: 100%;
    border-collapse: collapse;
    border-radius: 8px;
    overflow: hidden;
}

.gridview th {
    background: #2563eb;
    color: white;
    padding: 12px;
    text-align: left;
}

.gridview td {
    padding: 10px;
    border-bottom: 1px solid #e5e7eb;
}

.gridview tr:hover {
    background: #f9fafb;
}

/* Chart */
.chart-container {
    padding: 10px;
}

/* Session Label */
.session-label {
    font-size: 14px;
    color: #475569;
}
</style>
    <title>Sales Analytics</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
    Sales Analytics Dashboard
</div>
       <div class="container">

    <div class="card">
      <div class="upload-section">

    <div class="upload-group">
        <label class="file-label">
            Choose CSV
            <asp:FileUpload ID="FileUpload1" runat="server" CssClass="file-input" />
        </label>

        <asp:Button ID="Button1" runat="server" Text="Upload CSV" CssClass="btn" OnClick="Button1_Click" />
    </div>

    <asp:Label ID="lbl_sess" runat="server" CssClass="session-label"></asp:Label>

</div>
    </div>

    <div class="card">
        <div class="title">Sales Table</div>
        <asp:GridView ID="GridView1" runat="server" CssClass="gridview"></asp:GridView>
    </div>

    <div class="card">
        <div class="title">Sales Chart</div>
        <div class="chart-container">
            <asp:Chart ID="Chart1" runat="server"  Height="489px" Width="995px">
                <Series>
                    <asp:Series Name="Series1" ChartType="Column" 
                        XValueMember="Item" 
                        YValueMembers="Sales">
                    </asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
        </div>
    </div>

</div>
    </form>
</body>
</html>
