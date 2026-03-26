using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CsvHelper;
using System.Globalization;
using System.Data;


namespace proj1
{
    public partial class WebForm3 : System.Web.UI.Page
    {

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

                            GridView1.DataSource = dt;
                            GridView1.DataBind();

                            Chart1.DataSource = dt;
                            Chart1.DataBind();
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
        }
    }
}