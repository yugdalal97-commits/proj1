using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CsvHelper;


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
    }
}