using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace proj1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_sub_Click(object sender, EventArgs e)
        {

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