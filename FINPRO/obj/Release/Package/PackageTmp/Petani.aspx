<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="Petani.aspx.cs" Inherits="FINPRO.Petani" %>
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
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div style="padding: 20px; ">
        <table style="width:100%; padding:10px" cellspacing="5">
            <tr>
                <td colspan="3">
                    <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
            </tr>
            <tr>
                <td class="style1" colspan="2">
                    <asp:Label ID="lb_TabelBarangJudul" runat="server" Text="Label" Font-Size="Large" Font-Bold="True">Daftar barang di </asp:Label>
        
                </td>
                <td class="style1">
                <asp:Label ID="Label1" runat="server" Text="Label" Font-Size="Large" Font-Bold="True">Daftar barang di Pasar Surabaya</asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style1" colspan="2">
                    <asp:Button ID="bt_BarangSortByNamaBarang" runat="server" Text="Sort by Nama" 
                        onclick="bt_BarangSortByNamaBarang_Click" CssClass="left button" />
                    <asp:Button ID="bt_BarangSortByTipe" runat="server" Text="Sort by Tipe" 
                        onclick="bt_BarangSortByTipe_Click" CssClass="middle button" />
                    <asp:Button ID="bt_BarangSortByHarga" runat="server" Text="Sort by Harga" 
                        onclick="bt_BarangSortByHarga_Click" CssClass="middle button" />
                    <asp:Button ID="bt_PetaniBarangSortByJumlah" runat="server" 
                        onclick="bt_PetaniBarangSortByJumlah_Click" Text="Sort by Jumlah" 
                        CssClass="right button" />
                    </td>
                <td class="style1">
                    <asp:Button ID="bt_DistSortByNama" runat="server" Text="Sort by Barang" 
                        CssClass="left button" />
                    <asp:Button ID="bt_DistSortByKendaraan" runat="server" 
                        Text="Sort by Kendaraan" CssClass="middle button" />
                    <asp:Button ID="bt_DistSortByHarga" runat="server" Text="Sort by Harga" 
                        CssClass="right button" />
                </td>
            </tr>
            <tr style="vertical-align:top;">
                <td class="style1" colspan="2">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSource1" CellPadding="5">
                        <Columns>
                            <asp:BoundField DataField="nama_barang" HeaderText="nama_barang" 
                                SortExpression="nama_barang" />
                            <asp:BoundField DataField="jenis" HeaderText="jenis" SortExpression="jenis" />
                            <asp:BoundField DataField="harga" HeaderText="harga" SortExpression="harga" />
                            <asp:BoundField DataField="jumlah" HeaderText="jumlah" 
                                SortExpression="jumlah" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:fpConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:fpConnectionString.ProviderName %>" 
                        
                        SelectCommand="Select nama_barang,jenis,harga,jumlah from barang where id_daerah='d1'">
                    </asp:SqlDataSource></td>
                <td class="style1">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="id_distribusi" DataSourceID="SqlDataSource2" CellPadding="5">
                        <Columns>
                            <asp:BoundField DataField="id_distribusi" HeaderText="id_distribusi" 
                                ReadOnly="True" SortExpression="id_distribusi" InsertVisible="False" />
                            <asp:BoundField DataField="id_barang" HeaderText="id_barang" 
                                SortExpression="id_barang" />
                            <asp:BoundField DataField="harga" HeaderText="harga" 
                                SortExpression="harga" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:fpConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:fpConnectionString.ProviderName %>" 
                        SelectCommand="select id_distribusi, id_barang, harga from distribusi"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <h3>Upload Data Barang</h3></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width:35%">
                    Nama Barang</td>
                <td>
                    <asp:TextBox ID="tb_PetaniUploadNamaBarang" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td >
                    Jenis</td>
                <td>
                    <asp:DropDownList ID="cb_PetaniUploadJenis" runat="server">
                        <asp:ListItem>Beras</asp:ListItem>
                        <asp:ListItem>Sayur</asp:ListItem>
                        <asp:ListItem>Daging</asp:ListItem>
                        <asp:ListItem>Telur</asp:ListItem>
                        <asp:ListItem>Ikan</asp:ListItem>
                        <asp:ListItem>Buah</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
             <tr>
                <td >
                    Jumlah</td>
                <td>
                    <asp:TextBox ID="tb_PetaniUploadJumlah" runat="server"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td >
                    &nbsp;</td>
                <td>
                    <asp:Button ID="bt_PetaniUpload" runat="server" CssClass="positive button" 
                        onclick="bt_PetaniUpload_Click" Text="Upload" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </div>
</asp:Content>
