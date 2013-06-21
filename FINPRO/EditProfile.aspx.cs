using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace FINPRO
{
    public partial class EditProfile : System.Web.UI.Page
    {
        static string connStr = "server=localhost;user=root;database=fp;port=3306;password=;";
        MySqlConnection conn = new MySqlConnection(connStr);
        string activeuser;
        protected void Page_Load(object sender, EventArgs e)
        {
            // RegisterUser.ContinueDestinationPageUrl = Request.QueryString["ReturnUrl"];
            if (Session["login"] == null)
            {
                Response.Redirect("Login.aspx?state=notloggedin");
            }
            activeuser = Request.QueryString["activeuser"];
            if (string.IsNullOrEmpty(activeuser))
            {
                Response.Redirect("Default.aspx");
            }
            else
            {

            }

        }

        //protected void RegisterUser_CreatedUser(object sender, EventArgs e)
        //{
        //    //FormsAuthentication.SetAuthCookie(RegisterUser.UserName, false /* createPersistentCookie */);

        //    //string continueUrl = RegisterUser.ContinueDestinationPageUrl;
        //    //if (String.IsNullOrEmpty(continueUrl))
        //    //{
        //    //    continueUrl = "~/";
        //    //}
        //    //Response.Redirect(continueUrl);
        //}
        protected void bt_EditProfileSave_Click(object sender, EventArgs e)
        {
            //string uname = tb_EditProfileUser.Text;
            string psswd = tb_EditProfilePassword.Text;
            string confirm = tb_EditProfileKonfirmasi.Text;
            if (tb_EditProfilePassword.Text != string.Empty && tb_EditProfileKonfirmasi.Text != string.Empty)
            {
                if (tb_EditProfileKonfirmasi.Text == tb_EditProfilePassword.Text)
                {
                    try
                    {
                        conn.Open();
                        //string uname = tb_EditProfileUser.Text;
                        //string psswd = tb_EditProfilePassword.Text;
                        //string confirm = tb_EditProfileKonfirmasi.Text;
                        string daerahAsal = "D" + (DropDownList1.SelectedIndex + 1).ToString();
                        string sql = "UPDATE  `fp`.`user` SET  `password` =  '" + psswd + "', `id_daerah` =  '" + daerahAsal + "' WHERE  `user`.`username` =  '" + activeuser + "';";
                        MySqlCommand cmd = new MySqlCommand(sql, conn);
                        cmd.ExecuteNonQuery();
                        //Label1.Text = uname;

                    }
                    catch (Exception ex)
                    {
                        Label1.Text = ex.Message;

                    }
                    conn.Close();
                    Label1.Text = "Data berhasil diubah!";
                    Label1.Visible = true;

                }
                else
                {

                    Label1.Text = "Konfirmasi password tidak sama!";
                    Label1.Visible = true;
                }
            }
            else
            {
                Label1.Text = "Data ada yang belum terisi!";
                Label1.Visible = true;
            }
        }
        protected void tb_EditProfilePassword_TextChanged(object sender, EventArgs e)
        {

        }
        protected void tb_EditProfileUser_TextChanged(object sender, EventArgs e)
        {
            //tb_EditProfileUser.Text;
            //uname = this.tb_EditProfileUser.Text;
        }
    }
}