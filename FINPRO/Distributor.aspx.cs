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
    public partial class Distributor : System.Web.UI.Page
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
                else if (Session["usertype"].ToString() == "0")
                {
                    Response.Redirect("Admin.aspx");
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
            SqlDataSource2.SelectCommand = "select id_barang,id_kendaraan,harga from distribusi order by id_barang";
            GridView2.DataBind();
        }
        protected void bt_DistDistSortByKendaraan_Click(object sender, EventArgs e)
        {
            SqlDataSource2.SelectCommand = "select id_barang,id_kendaraan,harga from distribusi order by id_kendaraan";
            GridView2.DataBind();
        }
        protected void bt_DistDistSortByHarga_Click(object sender, EventArgs e)
        {
            SqlDataSource2.SelectCommand = "select id_barang,id_kendaraan,harga from distribusi order by harga";
            GridView2.DataBind();
        }


        protected void cb_DistUpdateIdBarang_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                string sql = "select jarak,harga_per_km from barang where barang.id_barang='" + cb_DistUpdateIdBarang.SelectedItem.ToString() + "' AND daerah.id_daerah =barang.id_daerah ";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader rdr = cmd.ExecuteReader();
                rdr.Read();
                jarak = Convert.ToInt32(rdr[0].ToString());
                /*int jarak = (int)rdr[0];*/
            }
            catch (Exception ex)
            {
                Label2.Text = ex.Message;
                Label2.Visible = true;
            }
            //try
            //{
            //    conn.Open();
            //    string sql = "select jumlah from barang where id_barang='" + cb_DistUpdateIdBarang.SelectedItem.ToString() + "'";
            //    MySqlCommand cmd = new MySqlCommand(sql, conn);
            //    MySqlDataReader rdr = cmd.ExecuteReader();
            //    rdr.Read();
            //    jumlahbarang = Convert.ToInt32(rdr[0].ToString());
            //}
            //catch (Exception ex)
            //{
            //    Label2.Text = ex.Message;
            //    Label2.Visible = true;
            //}
            conn.Close();
        }

        protected void cb_DistUpdateIdKendaraan_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                conn.Open();
                string sql = "select harga_per_km from kendaraan  where id_kendaraan='" + cb_DistUpdateIdKendaraan.SelectedItem.ToString() + "'";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader rdr = cmd.ExecuteReader();
                rdr.Read();
                /*int biaya = (int)rdr[0];*/
                biaya = Convert.ToInt32(rdr[0].ToString());
            }
            catch (Exception ex)
            {
                Label2.Text = ex.Message;
                Label2.Visible = true;
            }
            conn.Close();
        }

        protected void bt_DistUpdate_Click(object sender, EventArgs e)
        {
            //Label3.Text = jumlahbarang.ToString();
            int hargabarang = 0;
            //int jumlahbarang = 0;

           /* try
            {
                conn.Open();
                string sql = "select jarak,harga_per_km from barang where barang.id_barang='" + cb_DistUpdateIdBarang.SelectedItem.ToString() + "' AND daerah.id_daerah =barang.id_daerah ";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader rdr = cmd.ExecuteReader();
                rdr.Read();
                jarak = Convert.ToInt32(rdr[0].ToString());
            }
            catch (Exception ex)
            {
                Label2.Text = ex.Message;
                Label2.Visible = true;
            }
            conn.Close();*/

            /*try
            {
                conn.Open();
                string sql = "select harga_per_km from kendaraan  where id_kendaraan='" + cb_DistUpdateIdKendaraan.SelectedItem.ToString() + "'";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader rdr = cmd.ExecuteReader();
                rdr.Read();
                biaya = Convert.ToInt32(rdr[0].ToString());
            }
            catch (Exception ex)
            {
                Label2.Text = ex.Message;
                Label2.Visible = true;
            }
            conn.Close();*/

            try
            {
                conn.Open();
                string sql = "select harga, jumlah from barang where id_barang='" + cb_DistUpdateIdBarang.SelectedItem.ToString() + "'";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader rdr = cmd.ExecuteReader();
                rdr.Read();
                hargabarang = Convert.ToInt32(rdr[0].ToString());
                int jumlahbarang = (int)rdr[1];



                int hargaawal = 0;
                int hargabruto = 0;
                string idBarang = cb_DistUpdateIdBarang.SelectedItem.ToString();
                string idKendaraan = cb_DistUpdateIdKendaraan.SelectedItem.ToString();
                hargaawal = (jarak * biaya) + (hargabarang * jumlahbarang);
                hargabruto = hargaawal + ((hargaawal * 10) / 100);
                hargaakhir = hargabruto / jumlahbarang;
                //Label3.Text = jumlahbarang.ToString();
            }
            catch (Exception ex)
            {
                Label2.Text = ex.Message;
                Label2.Visible = true;
            }
            conn.Close();

            try
            {

                conn.Open();
                //string sql = "INSERT INTO `user` (  `NRP` ,  `PASSWORD` ,  `EMAIL` ) VALUES ( '" + uname + "',  '" + psswd + "',  '" + email + "')";
                string sql = "INSERT INTO `fp`.`distribusi` (`id_distribusi`, `id_barang`, `id_kendaraan`, `harga`) VALUES (NULL, '" + cb_DistUpdateIdBarang.SelectedItem.ToString() + "', '" + cb_DistUpdateIdKendaraan.SelectedItem.ToString() + "', '" + hargaakhir.ToString() + "');";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
                GridView2.DataBind();
                Label2.Text = "Distribusi berhasil diupdate!";
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