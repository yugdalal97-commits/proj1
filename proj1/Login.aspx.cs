using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Web.ApplicationServices;


namespace proj1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_sub_Click(object sender, EventArgs e)
        {
            string conn = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;
            string query = "SELECT COUNT(*) FROM user_tbl WHERE email=@mail AND pass=@pass";
            SqlConnection con = new SqlConnection(conn);
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@mail", txt_lemail.Text.Trim());
            cmd.Parameters.AddWithValue("@pass", txt_lpass.Text);
            object res = cmd.ExecuteScalar();
            int i = Convert.ToInt16(res);
            if (i >= 1)
            {
                lbl_message.Text = "LOGGED EEEN";
                lbl_message.ForeColor = System.Drawing.Color.Green;
                Session["user"] = txt_lemail.Text.Trim();
            }
            else
            {
                lbl_message.Text = "DINGO";
                lbl_message.ForeColor = System.Drawing.Color.Red;
            }

        }
    }
}