using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace Web
{
    public partial class Predio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
 
                lblMsg.Text = string.Empty;
 
        }

        protected void gvwPredio_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (gvwPredio.SelectedIndex >= 0)
            {
                gvwPredio.Visible = false;
                FvwPredio.Visible = true;
                BtnNovo.Visible = false;
                FvwPredio.ChangeMode(FormViewMode.Edit);
            }
        }

        protected void BtnNovo_Click(object sender, EventArgs e)
        {
            gvwPredio.Visible = false;
            FvwPredio.Visible = true;
            BtnNovo.Visible = false;
            FvwPredio.ChangeMode(FormViewMode.Insert);
        }

        protected void BtnCancelar_Click(object sender, EventArgs e)
        {
            gvwPredio.Visible = true;
            FvwPredio.Visible = false;
            BtnNovo.Visible = true;
            FvwPredio.ChangeMode(FormViewMode.ReadOnly);
        }

        protected void OdsFvwPredio_Inserted(object sender, ObjectDataSourceStatusEventArgs e)
        {
            if (e.Exception != null && e.Exception.InnerException is ApplicationException)
            {
                e.ExceptionHandled = true;
                lblMsg.Text = e.Exception.InnerException.Message;
                lblMsg.ForeColor = Color.Red;
            }
            else
            {
                lblMsg.Text = "Predio inserido com sucesso";
                lblMsg.ForeColor = Color.Green;
                FvwPredio.ChangeMode(FormViewMode.ReadOnly);
                FvwPredio.Visible = false;
                gvwPredio.Visible = true;
                BtnNovo.Visible = true;
                gvwPredio.DataBind();

            }
        }

        protected void OdsFvwPredio_Updated(object sender, ObjectDataSourceStatusEventArgs e)
        {
            if (e.Exception != null && e.Exception.InnerException is ApplicationException)
            {
                e.ExceptionHandled = true;
                lblMsg.Text = e.Exception.InnerException.Message;
                lblMsg.ForeColor = Color.Red;
            }
            else
            {
                lblMsg.Text = "Predio atualizado com sucesso";
                lblMsg.ForeColor = Color.Green;
                FvwPredio.ChangeMode(FormViewMode.ReadOnly);
                FvwPredio.Visible = false;
                gvwPredio.Visible = true;
                BtnNovo.Visible = true;
                gvwPredio.DataBind();

            }

        }


    }
}