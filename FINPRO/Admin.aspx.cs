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
    public partial class Admin : System.Web.UI.Page
    {
        static string connStr = "server=localhost;user=root;database=fp;port=3306;password=;";
        MySqlConnection conn = new MySqlConnection(connStr);
        int jarak = 0;
        //int jumlahbarang = 0;
        int biaya = 0;
        //int hargabarang = 0;
        int hargaakhir = 0;
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

                }
                else if (Session["usertype"].ToString() == "2")
                {
                    Response.Redirect("Petani.aspx");
                }
                else if (Session["usertype"].ToString() == "1")
                {
                    Response.Redirect("Petani.aspx");
                }
            }

        }
        protected void bt_DistBarangSortByID_Click(object sender, EventArgs e)
        {
            SqlDataSource3.SelectCommand = "select * from barang where harga is not null order by id_barang";
            GridView3.DataBind();
        }
        protected void bt_DistBarangSortByNama_Click(object sender, EventArgs e)
        {
            SqlDataSource3.SelectCommand = "select * from barang where harga is not null order by nama_barang";
            GridView3.DataBind();
        }
        protected void bt_DistBarangSortByJenis_Click(object sender, EventArgs e)
        {
            SqlDataSource3.SelectCommand = "select * from barang where harga is not null order by jenis";
            GridView3.DataBind();
        }
        protected void bt_DistBarangSortByHarga_Click(object sender, EventArgs e)
        {
            SqlDataSource3.SelectCommand = "select * from barang where harga is not null order by harga";
            GridView3.DataBind();
        }
        protected void bt_DistBarangSortByDaerah_Click(object sender, EventArgs e)
        {
            SqlDataSource3.SelectCommand = "select * from barang where harga is not null order by id_daerah";
            GridView3.DataBind();
        }

        protected void bt_KendaraanSortByID_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "Select * from kendaraan order by id_kendaraan";
            GridView1.DataBind();
        }
        protected void bt_KendaraanSortByHarga_Click(object sender, EventArgs e)
        {
            SqlDataSource1.SelectCommand = "Select * from kendaraan order by harga_per_km";
            GridView1.DataBind();
        }

        protected void bt_DistDistSortByNama_Click(object sender, EventArgs e)
        {
            SqlDataSource2.SelectCommand = "Select * from user order by username";
            GridView2.DataBind();
        }
        protected void bt_DistDistSortByKendaraan_Click(object sender, EventArgs e)
        {
            SqlDataSource2.SelectCommand = "Select * from user order by tipe";
            GridView2.DataBind();
        }
        protected void bt_DistDistSortByHarga_Click(object sender, EventArgs e)
        {
            SqlDataSource2.SelectCommand = "Select * from user order by id_daerah";
            GridView2.DataBind();
        }

        protected void bt_DistUpdate_Click(object sender, EventArgs e)
        {
            //Label3.Text = jumlahbarang.ToString();
            //Label3.Text = jumlahbarang.ToString();
            try
            {

                conn.Open();
                string sql = "UPDATE  `fp`.`barang` SET  `harga` =  '" + tb_AdminBarangHarga.Text + "' WHERE  `barang`.`id_barang` ='" + cb_DistUpdateIdBarang.SelectedItem.ToString() + "'";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
                GridView3.DataBind();
                Label2.Text = "Harga Barang berhasil diupdate!";
                Label2.Visible = true;
            }
            catch (Exception ex)
            {
                Label2.Text = ex.Message;
                Label2.Visible = true;
            }
            conn.Close();
        }


        protected void bt_AdminBarangTambahKendaraan_Click(object sender, EventArgs e)
        {
            try
            {

                conn.Open();
                string sql = "INSERT INTO `fp`.`kendaraan` (`id_kendaraan`, `harga_per_km`) VALUES ('" + tb_AdminKendaraanID.Text + "', '" + tb_AdminKendaraanHarga.Text + "');";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
                GridView1.DataBind();
                Label2.Text = "Kendaraan berhasil diupdate!";
                Label2.Visible = true;
            }
            catch (Exception ex)
            {
                Label2.Text = ex.Message;
                Label2.Visible = true;
            }
            conn.Close();
        }
        protected void bt_AdminHapusUser_Click(object sender, EventArgs e)
        {
            //DELETE FROM user WHERE username =  'dist002'
            try
            {

                conn.Open();
                string sql = "DELETE FROM user WHERE username =  '" + tb_AdminUserHapus.Text + "'";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
                SqlDataSource2.SelectCommand = "select * from user";

                Label2.Text = "User berhasil dihapus!";
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