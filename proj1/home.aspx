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
            text-align: center; 
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
            display: block;
            max-height: 400px;
            overflow-x: auto;
            overflow-y: auto;
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
        /* Dropdown Layout */
        .dropdown-row {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            align-items: flex-end;
        }

        .dropdown-group {
            display: flex;
            flex-direction: column;
            min-width: 180px;
        }

        .dropdown-group label {
            font-size: 13px;
            margin-bottom: 5px;
            color: #475569;
            font-weight: 500;
        }

        /* Dropdown styling */
        .dropdown {
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #cbd5e1;
            background: #f8fafc;
            font-size: 14px;
            transition: 0.2s;
        }

        .dropdown:focus {
            outline: none;
            border-color: #2563eb;
            background: white;
            box-shadow: 0 0 0 2px rgba(37,99,235,0.15);
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        let chart;

        async function loadChart() {
            const xAxis = document.getElementById("<%= xAxis.ClientID %>").value;
            const yAxis = document.getElementById("<%= yAxis.ClientID %>").value;
            const timeGroup = document.getElementById("<%= timeGroup.ClientID %>").value;
            const res = await fetch("home.aspx/GetChartData", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify({ xAxis, yAxis, timeGroup })
            });

            const json = await res.json();
            const data = json.d;

            const labels = data.map(x => x.Label);
            const values = data.map(x => x.Value);

            if (chart) chart.destroy();

            chart = new Chart(document.getElementById("chart"), {
                type: (timeGroup === "Monthly") ? 'line' : 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: yAxis,
                        data: values
                    }]
                }
            });
        }
    </script>
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
                    <asp:Label ID="lbl_fileup" runat="server" CssClass="session-label"></asp:Label>
                </div>
            </div>
            <div class="card">
                <div class="title">Sales Table</div>
                <asp:GridView ID="GridView1" runat="server" CssClass="gridview"></asp:GridView>
            </div>
            <div class="card">
                <div class="title">Chart Controls</div>
                <div class="dropdown-row">
                    <div class="dropdown-group">
                        <label>X Axis</label>
                        <asp:DropDownList ID="xAxis" runat="server" CssClass="dropdown" onchange="loadChart()"></asp:DropDownList>
                    </div>
                    <div class="dropdown-group">
                        <label>Y Axis</label>
                        <asp:DropDownList ID="yAxis" runat="server" CssClass="dropdown" onchange="loadChart()"></asp:DropDownList>
                    </div>
                    <div class="dropdown-group">
                        <label>Time Group</label>
                        <asp:DropDownList ID="timeGroup" runat="server" CssClass="dropdown" onchange="loadChart()">
                            <asp:ListItem Text="All" Value="None" />
                            <asp:ListItem Text="Monthly" Value="Monthly" />
                            <asp:ListItem Text="Yearly" Value="Yearly" />
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="title">Sales Chart</div>
                <div class="chart-container">
                    <canvas id="chart"></canvas>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
