using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace FINPRO
{
    public partial class Petani : System.Web.UI.Page
    {
        static string connStr = "server=localhost;user=root;database=fp;port=3306;password=;";
        MySqlConnection conn = new MySqlConnection(connStr);

        string activeuser;
        string usertype;
        string kodeDaerah;
        string asalDaerah;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["login"] == null)
            {
                Response.Redirect("Login.aspx?state=notloggedin");
            }

            else
            {
                if (Session["usertype"].ToString() == "2")
                {
                    activeuser = Session["activeuser"].ToString();
                    try
                    {
                        conn.Open();
                        string sql = "SELECT user.id_daerah, daerah.nama_daerah FROM user, daerah WHERE username =  '" + activeuser + "' AND daerah.id_daerah = user.id_daerah";
                        MySqlCommand cmd = new MySqlCommand(sql, conn);
                        MySqlDataReader rdr = cmd.ExecuteReader();
                        rdr.Read();
                        kodeDaerah = rdr[0].ToString();
                        SqlDataSource1.SelectCommand = "Select `nama_barang`,`jenis`,`harga`,`jumlah` from barang where id_daerah='" + kodeDaerah + "'";
                        asalDaerah = rdr[1].ToString();
                        lb_TabelBarangJudul.Text = "Daftar barang di daerah " + asalDaerah;
                        GridView1.DataBind();
                    }
                    catch (Exception ex)
                    {
                        Label2.Text = ex.Message;
                        Label2.Visible = true;
                    }
                    conn.Close();
                }
                else if (Session["usertype"].ToString() == "1")
                {
                    Response.Redirect("Distributor.aspx");
                }
                else if (Session["usertype"].ToString() == "0")
                {
                    Response.Redirect("Admin.aspx");
                }
            }

        }

        protected void bt_BarangSortByNamaBarang_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "Select `nama_barang`,`jenis`,`harga`,`jumlah` from barang where id_daerah='" + kodeDaerah + "' ORDER by nama_barang";
            GridView1.DataBind();
        }
        protected void bt_BarangSortByTipe_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "Select `nama_barang`,`jenis`,`harga`,`jumlah` from barang where id_daerah='" + kodeDaerah + "' ORDER by jenis";
            GridView1.DataBind();
        }
        protected void bt_BarangSortByHarga_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "Select `nama_barang`,`jenis`,`harga`,`jumlah` from barang where id_daerah='" + kodeDaerah + "' ORDER by harga";
            GridView1.DataBind();
        }
        protected void bt_PetaniBarangSortByJumlah_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "Select `nama_barang`,`jenis`,`harga`,`jumlah` from barang where id_daerah='" + kodeDaerah + "' ORDER by jumlah";
            GridView1.DataBind();
        }
        protected void bt_PetaniUpload_Click(object sender, EventArgs e)
        {
           
                string uploadNama = tb_PetaniUploadNamaBarang.Text;
                string uploadJenis = cb_PetaniUploadJenis.SelectedItem.ToString();
                int jumlah = Convert.ToInt32(tb_PetaniUploadJumlah.Text);
          

            try
            {
                conn.Open();
                //string sql = "INSERT INTO `user` (  `NRP` ,  `PASSWORD` ,  `EMAIL` ) VALUES ( '" + uname + "',  '" + psswd + "',  '" + email + "')";
                string sql = "INSERT INTO `fp`.`barang` (`id_barang`, `nama_barang`, `jenis`, `harga`, `id_daerah`, `jumlah`) VALUES (NULL, '" + uploadNama + "', '" + uploadJenis + "', NULL, '" + kodeDaerah + "', '" + jumlah + "');";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
                GridView1.DataBind();
                Label2.Text = "Barang berhasil ditambahkan!";
                Label2.Visible = true;
            }
            catch (Exception ex)
            {
                Label2.Text = ex.Message;
                Label2.Visible = true;
            }
            conn.Close();
        }
    }
}