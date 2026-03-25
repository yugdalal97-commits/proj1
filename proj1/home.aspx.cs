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
                Runtime.PythonDLL = @"C:\Users\Admin\AppData\Local\Programs\Python\Python310\python310.dll";
                PythonEngine.Initialize();
            }

            using (Py.GIL())
            {
                
            }
        }
    }
}