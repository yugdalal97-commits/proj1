using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CsvHelper;
using System.Data.SqlClient;
using System.Configuration;
using Python.Runtime;



namespace proj1
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            string csvPath = Server.MapPath("~/csvs");
            if (!IsPostBack)
            {
                lbl_sess.Text = Session["user"].ToString();
            }



        }

        protected void Button1_Click(System.Object sender, System.EventArgs e)
        {
            string path = @"C:\Users\Admin\source\repos\proj1\proj1\csv\";

            if (FileUpload1.HasFile)
            {
                string str=Server.HtmlEncode(FileUpload1.FileName);
                string ext= Path.GetExtension(str);

                if((ext==".txt") || (ext == ".csv"))
                {
                    path += str;
                    FileUpload1.SaveAs(path);
                    lbl_sess.Text = path;
                }
            }
        }

        protected void analy_Click(object sender, EventArgs e)
        {
            // Check if it's already running before setting the DLL
            if (!PythonEngine.IsInitialized)
            {
                Runtime.PythonDLL = @"C:\Program Files\WindowsApps\PythonSoftwareFoundation.Python.3.12_3.12.2800.0_x64__qbz5n2kfra8p0\python312.dll";
                PythonEngine.Initialize();
            }

            using (Py.GIL())
            {
                using (var scope = Py.CreateScope())
                {
                    // Pass your C# file paths into Python variables
                    string csvPath = Server.MapPath("~/csv/data.csv");
                    string imagePath = Server.MapPath("~/csv/chart.png");

                    scope.Set("csv_file", csvPath);
                    scope.Set("png_out", imagePath);

                    // Python Script Logic
                    string pythonCode = @"
import pandas as pd
import matplotlib.pyplot as plt

# 1. Load the data
df = pd.read_csv(csv_file)

# 2. Setup the Plot (Assume CSV has columns: 'Category' and 'Value')
plt.figure(figsize=(8, 5))
plt.bar(df.iloc[:, 0], df.iloc[:, 1], color='skyblue') 

# 3. Labeling
plt.xlabel(df.columns[0])
plt.ylabel(df.columns[1])
plt.title('CSV Data Visualization')
plt.xticks(rotation=45)
plt.tight_layout()

# 4. Save to the project folder
plt.savefig('png_out.png')
plt.close() # Important: Close plot to free memory
";
                    try
                    {
                        scope.Exec(pythonCode);

                        // Update your ASP Image Control to show the result
                        // The QueryString (?v=...) forces the browser to refresh the image
                        Image1.ImageUrl = "~/csv/chart.png?v=" + DateTime.Now.Ticks;
                        lbl_sess.Text = "Analysis Complete!";
                    }
                    catch (PythonException pyEx)
                    {
                        lbl_sess.Text = "Python Error: " + pyEx.Message;
                    }
                }
            }
        }
    }
}