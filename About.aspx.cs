using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initial row
                BindGrid();
            }
        }

        private void BindGrid()
        {
            var dt = new System.Data.DataTable();
            dt.Columns.AddRange(new System.Data.DataColumn[5] {
            new System.Data.DataColumn("Country", typeof(string)),
            new System.Data.DataColumn("ProductName", typeof(string)),
            new System.Data.DataColumn("UnitPrice", typeof(string)),
            new System.Data.DataColumn("Quantity", typeof(string)),
            new System.Data.DataColumn("TotalPrice", typeof(string)) });

            dt.Rows.Add(dt.NewRow());
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
    }
}