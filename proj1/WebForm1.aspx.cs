using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace proj1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            // 1. Get Connection String
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConnection"].ConnectionString;

            // 2. SQL Query
            // Note: We skip 'uid' assuming it is set to "Identity Specification = Yes" in the database design
            string query = "INSERT INTO user_tbl (full_name, email, pass, state, city) VALUES (@full_name, @email, @pass, @state, @city)";

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    // 3. Bind Parameters to prevent errors and hacks
                    cmd.Parameters.AddWithValue("@full_name", tb_name.Text);
                    cmd.Parameters.AddWithValue("@email", tb_email.Text);
                    cmd.Parameters.AddWithValue("@pass", tb_pass.Text);

                        cmd.Parameters.AddWithValue("@state", ddl_state.SelectedItem.Text);
                        cmd.Parameters.AddWithValue("@city", ddl_city.SelectedItem.Text);

                    
                    
                        conn.Open();
                        int result = cmd.ExecuteNonQuery();

                        if (result > 0)
                        {
                            lbl_message.Text = "Registered Successfully!";
                            lbl_message.ForeColor = System.Drawing.Color.Green;

                            // Optional: Clear fields
                            tb_name.Text = "";
                            tb_email.Text = "";
                            tb_pass.Text = "";
                            ddl_state.SelectedIndex = 0;
                            // Clear city dropdown if needed
                        }
                        else
                        {
                            lbl_message.Text = "Registration failed.";
                            lbl_message.ForeColor = System.Drawing.Color.Red;
                        }
                }
            }
        }

        protected void ddl_state_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddl_city.Items.Clear();
            if (ddl_state.SelectedValue == "Maharashtra")
            {
                ddl_city.Items.Add("Mumbai");
                ddl_city.Items.Add("Pune");
                ddl_city.Items.Add("Nagpur");
            }
            else if (ddl_state.SelectedValue == "Gujarat")
            {
                ddl_city.Items.Add("Ahmedabad");
                ddl_city.Items.Add("Surat");
                ddl_city.Items.Add("Vadodara");
            }
            else if (ddl_state.SelectedValue == "Rajasthan")
            {
                ddl_city.Items.Add("Jaipur");
                ddl_city.Items.Add("Udaipur");
                ddl_city.Items.Add("Jodhpur");
            }
            else if (ddl_state.SelectedValue == "Tamil Nadu")
            {
                ddl_city.Items.Add("Chennai");
                ddl_city.Items.Add("Coimbatore");
                ddl_city.Items.Add("Madurai");
            }
            else if (ddl_state.SelectedValue == "Himachal Pradesh")
            {
                ddl_city.Items.Add("Shimla");
                ddl_city.Items.Add("Manali");
                ddl_city.Items.Add("Dharamshala");
            }
            else
            {
                ddl_city.Items.Add("Select City");
                ddl_city.Items.Add("Bhai select kr ne");
            }
        }

        protected void ddl_city_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}