using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql;
using MySql.Data;
using MySql.Web;
using MySql.Data.MySqlClient;

namespace FINPRO
{
    public partial class Default : System.Web.UI.Page
    {
        static string connStr = "server=localhost;user=root;database=fp;port=3306;password=;";
        MySqlConnection conn = new MySqlConnection(connStr);

        int tipeUser;
        string daerahAsal;

        protected void Page_Load(object sender, EventArgs e)
        {
            // RegisterUser.ContinueDestinationPageUrl = Request.QueryString["ReturnUrl"];
            if (Session["login"] != null && (int)Session["login"] == 1)
            {

                if (Session["usertype"] != null && Session["usertype"].ToString() == "1")
                {
                    Response.Redirect("Distributor.aspx");
                }
                else if (Session["usertype"] != null && Session["usertype"].ToString() == "2")
                {
                    Response.Redirect("Petani.aspx");
                }

                //Response.Redirect("Home.aspx");
            }

            //tipeUser = 0;
            //daerahAsal = "D1";
        }

        protected void RegisterUser_CreatedUser(object sender, EventArgs e)
        {
            bool isOk = true;
            string uname = this.UserName.Text;
            //string email = this.Email.Text;
            string psswd = this.Password.Text;
            string confirm = this.ConfirmPassword.Text;


            if (uname == string.Empty)
            {
                isOk = false;
                lb_DefaultRegisterEmptyUser.Text = "Username Kosong";
                lb_DefaultRegisterEmptyUser.Visible = true;
            }
            else lb_DefaultRegisterEmptyUser.Visible = false;
            //if (email == string.Empty)
            //{
            //    isOk = false;
            //    lb_DefaultRegisterEmptyEmail.Text = "Email kosong";
            //    lb_DefaultRegisterEmptyEmail.Visible = true;
            //}
            //else lb_DefaultRegisterEmptyEmail.Visible = false;
            if (psswd == string.Empty)
            {
                isOk = false;
                lb_DefaultRegisterEmptyPasswordError.Text = "Password kosong";
                lb_DefaultRegisterEmptyPasswordError.Visible = true;
            }
            else lb_DefaultRegisterEmptyPasswordError.Visible = false;
            if (psswd.Length < 6)
            {
                isOk = false;
                lb_DefaultRegisterEmptyPasswordError.Text = "Password kurang dari 6 karakter";
                lb_DefaultRegisterEmptyPasswordError.Visible = true;
            }
            else lb_DefaultRegisterEmptyPasswordError.Visible = false;
            if (psswd != confirm)
            {
                isOk = false;
                lb_DefaultRegisterPassowordNotMatch.Text = "Konfirmasi password tidak sama";
                lb_DefaultRegisterPassowordNotMatch.Visible = true;
            }
            else lb_DefaultRegisterPassowordNotMatch.Visible = false;
            if (isOk == true)
            {
                try
                {
                    conn.Open();
                    //string sql = "INSERT INTO `user` (  `NRP` ,  `PASSWORD` ,  `EMAIL` ) VALUES ( '" + uname + "',  '" + psswd + "',  '" + email + "')";
                    string sql = "INSERT INTO `fp`.`user` (`username`, `password`, `tipe`, `id_daerah`) VALUES ('" + uname + "', '" + psswd + "', '" + (DropDownList1.SelectedIndex + 1).ToString() + "', '" + daerahAsal + "')";
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    cmd.ExecuteNonQuery();
                    //lb_DefaultRegisterPassowordNotMatch.Text = tipeUser.ToString();
                    //lb_DefaultRegisterPassowordNotMatch.Visible = true;
                }
                catch (Exception ex)
                {
                    lb_DefaultRegisterError.Text = ex.Message;
                }
                conn.Close();
                Response.Redirect("Login.aspx?state=registersuccess");
            }

        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                string sql = "select id_daerah from daerah where nama_daerah='" + DropDownList2.SelectedItem.ToString() + "'";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader rdr = cmd.ExecuteReader();
                rdr.Read();
                daerahAsal = rdr[0].ToString();
                //Label3.Text = jumlahbarang.ToString();
            }
            catch (Exception ex)
            {
                Label2.Text = ex.Message;
                Label2.Visible = true;
            }
            conn.Close();
            //daerahAsal = "D" + (DropDownList2.SelectedIndex + 1).ToString();

        }
        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem.ToString() == "Petani")
            {
                tipeUser = 2;
            }
            else if (DropDownList1.SelectedItem.ToString() == "Distributor")
            {
                tipeUser = 1;
            }
        }

    }
}