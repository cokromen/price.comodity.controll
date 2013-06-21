<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Homepage.master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="FINPRO.Admin" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style1
        {
            height: 21px;
        }
        .style2
        {
            width: 185px;
        }
        .style3
        {
            width: 80px;
        }
    </style>
        <script type="text/javascript">
            function reloadPage() {
                window.location.reload();
            }
    </script>
</asp:Content>

<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div style="padding: 20px; ">
        <table style="width:100%; padding:10px" cellspacing="5">
            <tr>
                <td colspan="3" style="width:120px;">
                    <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
            </tr>
            <tr>
            <td class="style1" colspan="2">
                <asp:Label ID="Label3" runat="server" Text="Daftar Barang" Font-Size="Large" 
                        Font-Bold="True"></asp:Label>
                </td>
                <td class="style1" >
                    <asp:Label ID="lb_TabelBarangJudul" runat="server" Text="Daftar Kendaraan" 
                        Font-Size="Large" Font-Bold="True"></asp:Label>
        
                </td>
                <td class="style1">
                <asp:Label ID="Label1" runat="server" Text="Daftar User" Font-Size="Large" 
                        Font-Bold="True"></asp:Label>
                </td>

            </tr>
            <tr>
                <td class="style1" colspan="2">
                        <asp:Button ID="bt_DistBarangSortByID" runat="server" Text="Sort by ID" 
                        onclick="bt_DistBarangSortByID_Click" CssClass="left button" />
                        <asp:Button ID="bt_DistBarangSortByNama" runat="server" Text="Sort by Nama" 
                        onclick="bt_DistBarangSortByNama_Click" CssClass="middle button" />
                        <asp:Button ID="bt_DistBarangSortByJenis" runat="server" Text="Sort by Jenis" 
                        onclick="bt_DistBarangSortByJenis_Click" CssClass="middle button" />
                        <asp:Button ID="bt_DistBarangSortByHarga" runat="server" Text="Sort by Harga" 
                        onclick="bt_DistBarangSortByHarga_Click" CssClass="middle button" />
                        <asp:Button ID="bt_DistBarangSortByDaerah" runat="server" Text="Sort by Daerah" 
                        onclick="bt_DistBarangSortByDaerah_Click" CssClass="middle button" />
                    </td>
                <td class="style1" >
                    <asp:Button ID="bt_KendaraanSortByID" runat="server" Text="Sort by ID" 
                        onclick="bt_KendaraanSortByID_Click" CssClass="left button" />
                    <asp:Button ID="bt_KendaraanSortByHarga" runat="server" Text="Sort by Harga" 
                        onclick="bt_KendaraanSortByHarga_Click" CssClass="middle button" />
                    </td>
                <td class="style1">
                    <asp:Button ID="bt_DistUserSortByUser" runat="server" Text="Sort by Username" 
                        CssClass="left button" onclick="bt_DistDistSortByNama_Click" />
                    <asp:Button ID="bt_DistUserSortByTipe" runat="server" 
                        Text="Sort by Tipe" CssClass="middle button" 
                        onclick="bt_DistDistSortByKendaraan_Click" />
                    <asp:Button ID="bt_DistDistSortByHarga" runat="server" Text="Sort by Daerah" 
                        CssClass="right button" onclick="bt_DistDistSortByHarga_Click" />
                </td>
            </tr>
            <tr style=" vertical-align:top;">
                <td class="style1" colspan="2">
                    
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="id_barang" DataSourceID="SqlDataSource3" CellPadding="5">
                        <Columns>
                            <asp:BoundField DataField="id_barang" HeaderText="id_barang" 
                                InsertVisible="False" ReadOnly="True" SortExpression="id_barang" />
                            <asp:BoundField DataField="nama_barang" HeaderText="nama_barang" 
                                SortExpression="nama_barang" />
                            <asp:BoundField DataField="jenis" HeaderText="jenis" SortExpression="jenis" />
                            <asp:BoundField DataField="harga" HeaderText="harga" SortExpression="harga" />
                            <asp:BoundField DataField="id_daerah" HeaderText="id_daerah" 
                                SortExpression="id_daerah" />
                            <asp:BoundField DataField="jumlah" HeaderText="jumlah" 
                                SortExpression="jumlah" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:fpConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:fpConnectionString.ProviderName %>" 
                        SelectCommand="select * from barang"></asp:SqlDataSource>
                    
                </td>
                <td class="style1" >
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSource1" DataKeyNames="id_kendaraan" CellPadding="5">
                        <Columns>
                            <asp:BoundField DataField="id_kendaraan" HeaderText="id_kendaraan" 
                                SortExpression="id_kendaraan" ReadOnly="True" />
                            <asp:BoundField DataField="harga_per_km" HeaderText="harga_per_km" 
                                SortExpression="harga_per_km" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:fpConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:fpConnectionString.ProviderName %>" 
                        
                        SelectCommand="Select * from kendaraan">
                    </asp:SqlDataSource></td>
                <td class="style1">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSource2" DataKeyNames="username" CellPadding="5">
                        <Columns>
                            <asp:BoundField DataField="username" HeaderText="username" 
                                SortExpression="username" ReadOnly="True" />
                            <asp:BoundField DataField="id_daerah" HeaderText="id_daerah" 
                                SortExpression="id_daerah" />
                            <asp:BoundField DataField="tipe" HeaderText="tipe" 
                                SortExpression="tipe" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:fpConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:fpConnectionString.ProviderName %>" 
                        
                        SelectCommand="select username,id_daerah,tipe from user order by username"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td class="style3">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    <h3>Update info HARGA BARANG</h3></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td >
                    ID Barang</td>
                <td class="style3">
                    <asp:DropDownList ID="cb_DistUpdateIdBarang" runat="server" 
                        DataSourceID="SqlDataSource5" DataTextField="id_barang" 
                        DataValueField="id_barang">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:fpConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:fpConnectionString.ProviderName %>" 
                        
                        SelectCommand="select id_barang from barang where jumlah is not null order by id_barang">
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
             <tr>
                <td >
                    Harga</td>
                <td class="style3">
                    <asp:TextBox ID="tb_AdminBarangHarga" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td >
                    &nbsp;</td>
                <td class="style3">
                    <asp:Button ID="bt_DistUpdate" runat="server" CssClass="positive button" 
                        onclick="bt_DistUpdate_Click" Text="Update" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
            <td colspan="3">
                 &nbsp;</td>
            </tr>
            <tr>
            <td colspan="3">
                 <h3>TAMBAH Kendaraan</h3>
            </td>
            </tr>
            <tr>
            <td>ID Kendaraan</td>
            <td>
                <asp:TextBox ID="tb_AdminKendaraanID" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
            <td>Harga Per Km</td>
            <td>
                <asp:TextBox ID="tb_AdminKendaraanHarga" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="bt_AdminBarangTambahKendaraan" runat="server" 
                    CssClass="positive button" onclick="bt_AdminBarangTambahKendaraan_Click" 
                    Text="Tambah" />
                </td>
            </tr>
            <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            </tr>
            <tr>
            <td>HAPUS USER</td>
            <td>&nbsp;</td>
            </tr>
            <tr>
            <td>Username</td>
            <td>
                <asp:TextBox ID="tb_AdminUserHapus" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
            <td>&nbsp;</td>
            <td>
                <asp:Button ID="bt_AdminHapusUser" runat="server" CssClass="negative button" 
                    onclick="bt_AdminHapusUser_Click" Text="Hapus" />
                </td>
            </tr>
            </table>
    </div>
</asp:Content>
