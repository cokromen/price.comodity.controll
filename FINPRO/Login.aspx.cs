using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace FINPRO
{
    public partial class Login : System.Web.UI.Page
    {
        static string connStr = "server=localhost;user=root;database=fp;port=3306;password=;";
        MySqlConnection conn = new MySqlConnection(connStr);

        protected void Page_Load(object sender, EventArgs e)
        {
            //RegisterHyperLink.NavigateUrl = "~/Default.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            string pageType = Request.QueryString["state"];
            if (string.IsNullOrEmpty(pageType))
            {

                //Label1.Text = Session["usertype"].ToString();
            }
            else
            {
                if (pageType == "notloggedin")
                {
                    Label1.Text = "Anda harus log in terlebih dahulu sebelum mengakses halaman ini";
                }
                else if (pageType == "registersuccess")
                {
                    Label1.Text = "Anda berhasil terdaftar. Silahkan Log in untuk melanjutkan";
                }
                else
                {
                    Label1.Text = string.Empty;
                }
            }
        }
        protected void LogIn(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                string uname = LoginUser.UserName;
                string psswd = LoginUser.Password;
                string sql = "SELECT `PASSWORD`,`tipe` FROM `user` WHERE `username`='" + uname + "'";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader rdr = cmd.ExecuteReader();
                rdr.Read();

                if (psswd == rdr[0].ToString())
                {
                    Session["login"] = 1;
                    Session["activeuser"] = uname;
                    Session["usertype"] = (int)rdr[1];
                    Response.Write(Session["usertype"].ToString());
                    //Response.Redirect("Home.aspx?activeuser=" + Session["activeuser"] + "&usertype=" + Session["usertype"].ToString());
                    if (Session["usertype"].ToString() == "2")
                    {
                        Response.Redirect("Petani.aspx");
                    }
                    else if (Session["usertype"].ToString() == "1")
                    {
                        Response.Redirect("Distributor.aspx");
                    }
                    else if (Session["usertype"].ToString() == "0")
                    {
                        Response.Redirect("Admin.aspx");
                    }
                    else
                    {
                        Response.Redirect("Default.aspx");
                    }
                }
                else
                {
                    Label1.Text = "Username atau Password salah!";
                }

                rdr.Close();

            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;

            }
            conn.Close();
        }
    }
}