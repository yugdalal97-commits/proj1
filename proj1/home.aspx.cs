using CsvHelper;
using System;
using System.Collections.Generic;
using System.Data;   //add system.data.DataSetExtensions from Add->references->assemblies->framework->system.data.DataSetExtensions
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace proj1
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        [System.Web.Services.WebMethod]
        public static object GetChartData(string xAxis, string yAxis, string timeGroup)
        {
            var dt = (DataTable)HttpContext.Current.Session["SalesData"];

            if (dt == null)
                return new List<object>();

            if (!dt.Columns.Contains(xAxis) || !dt.Columns.Contains(yAxis))
                return new List<object>();

            var rows = dt.AsEnumerable();

            var result = rows.GroupBy(r =>
            {
                if (timeGroup == "Monthly") return r["Month"].ToString();
                if (timeGroup == "Yearly") return r["Year"].ToString();
                return r[xAxis].ToString();
            })
            .Select(g => new {
                Label = g.Key,
                Value = g.Sum(r =>
                {
                    decimal val;
                    return decimal.TryParse(r[yAxis].ToString(), out val) ? val : 0;
                })
            })
            .OrderByDescending(x => x.Value)
            .Take(10)
            .ToList();

            return result;
        }

        protected void LoadDropdowns()
        {
            var cols = Session["Columns"] as DataColumnCollection;

            if (cols == null) return;

            xAxis.Items.Clear();
            yAxis.Items.Clear();

            foreach (DataColumn col in cols)
            {
                xAxis.Items.Add(col.ColumnName);

                // Only numeric columns for Y-axis
                if (col.ColumnName == "Revenue" ||
                    col.ColumnName == "Demand" ||
                    col.ColumnName == "Units_Sold" ||
                    col.ColumnName == "Price")
                {
                    yAxis.Items.Add(col.ColumnName);
                }
            }
            xAxis.SelectedValue = "Category";
            yAxis.SelectedValue = "Revenue";
        }
        protected void Button1_Click(System.Object sender, System.EventArgs e)
        {
            string path = Server.MapPath("~/uploads/");

            if (FileUpload1.HasFile)
            {
                string str = Server.HtmlEncode(FileUpload1.FileName);
                string ext = Path.GetExtension(str);

                if ((ext == ".txt") || (ext == ".csv"))
                {
                    string fullPath = path + str;
                    FileUpload1.SaveAs(fullPath);
                    lbl_sess.Text = "File uploaded successfully!";

                    try
                    {                        
                        using (var reader = new StreamReader(fullPath))
                        using (var csv = new CsvReader(reader, CultureInfo.InvariantCulture))
                        using (var dr = new CsvDataReader(csv))
                        {                            
                            DataTable dt = new DataTable();
                            dt.Load(dr);
                            Session["SalesData"] = dt; //store the CSV in SESSION so its useable elsewhere
                            Session["Columns"] = dt.Columns;
                            LoadDropdowns();
                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                            //Chart1.DataSource = dt;
                            //Chart1.DataBind();
                        }
                    }
                    catch (Exception ex)
                    {
                        lbl_sess.Text = $"Error processing file: {ex.Message}";
                    }
                }
                else
                {
                    lbl_sess.Text = "Please upload a valid .csv or .txt file.";
                }
            }
            ClientScript.RegisterStartupScript(this.GetType(), "loadChart", "loadChart();", true);
        }

        
    }
}
