<%@ Page Title="Distributor Page" Language="C#" MasterPageFile="~/Homepage.master" AutoEventWireup="true" CodeBehind="Distributor.aspx.cs" Inherits="FINPRO.Distributor" %>
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

</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div style="padding: 20px; ">
        <table style="width:100%; padding:10px; vertical-align:top;" cellpadding="10px" >
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
                <asp:Label ID="Label1" runat="server" Text="Daftar Distribusi" Font-Size="Large" 
                        Font-Bold="True"></asp:Label>
                </td>

            </tr>
            <tr>
                <td class="style1" colspan="2">
                        <asp:Button ID="bt_DistBarangSortByID" runat="server" Text="Sort by ID" 
                        onclick="bt_DistBarangSortByID_Click" CssClass="button" />
                        <asp:Button ID="bt_DistBarangSortByNama" runat="server" Text="Sort by Nama" 
                        onclick="bt_DistBarangSortByNama_Click" CssClass="button" />
                        <asp:Button ID="bt_DistBarangSortByJenis" runat="server" Text="Sort by Jenis" 
                        onclick="bt_DistBarangSortByJenis_Click" CssClass="button" />
                        <asp:Button ID="bt_DistBarangSortByHarga" runat="server" Text="Sort by Harga" 
                        onclick="bt_DistBarangSortByHarga_Click" CssClass="button" />
                        <asp:Button ID="bt_DistBarangSortByDaerah" runat="server" Text="Sort by Daerah" 
                        onclick="bt_DistBarangSortByDaerah_Click" CssClass="button" />
                    </td>
                <td class="style1" >
                    <asp:Button ID="bt_KendaraanSortByID" runat="server" Text="Sort by ID" 
                        onclick="bt_KendaraanSortByID_Click" CssClass="button" />
                    <asp:Button ID="bt_KendaraanSortByHarga" runat="server" Text="Sort by Harga" 
                        onclick="bt_KendaraanSortByHarga_Click" CssClass="button" />
                    </td>
                <td class="style1">
                    <asp:Button ID="bt_DistDistSortByNama" runat="server" Text="Sort by Barang" 
                        CssClass="button" onclick="bt_DistDistSortByNama_Click" />
                    <asp:Button ID="bt_DistDistSortByKendaraan" runat="server" 
                        Text="Sort by Kendaraan" CssClass="button" 
                        onclick="bt_DistDistSortByKendaraan_Click" />
                    <asp:Button ID="bt_DistDistSortByHarga" runat="server" Text="Sort by Harga" 
                        CssClass="button" onclick="bt_DistDistSortByHarga_Click" />
                </td>
            </tr>
            <tr style="vertical-align:top;">
                <td class="style1" colspan="2">
                    
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="id_barang" DataSourceID="SqlDataSource3" CssClass="tabel" CellPadding="5">
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
                        SelectCommand="select * from barang where harga is not null"></asp:SqlDataSource>
                    
                </td>
                <td class="style1" >
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="SqlDataSource1" DataKeyNames="id_kendaraan" 
                        CssClass="tabel" CellPadding="5">
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
                        DataSourceID="SqlDataSource2" CssClass="tabel" CellPadding="5">
                        <Columns>
                            <asp:BoundField DataField="id_barang" HeaderText="id_barang" 
                                SortExpression="id_barang" />
                            <asp:BoundField DataField="id_kendaraan" HeaderText="id_kendaraan" 
                                SortExpression="id_kendaraan" />
                            <asp:BoundField DataField="harga" HeaderText="harga" 
                                SortExpression="harga" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:fpConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:fpConnectionString.ProviderName %>" 
                        
                        
                        SelectCommand="select id_barang,id_kendaraan,harga from distribusi order by id_distribusi"></asp:SqlDataSource>
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
                    <h3>Update info kendaraan distribusi</h3></td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td >
                    ID Barang</td>
                <td class="style3">
                    <asp:DropDownList ID="cb_DistUpdateIdBarang" runat="server" 
                        DataSourceID="SqlDataSource5" DataTextField="id_barang" 
                        DataValueField="id_barang" 
                        onselectedindexchanged="cb_DistUpdateIdBarang_SelectedIndexChanged">
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
                    ID Kendaraan</td>
                <td class="style3">
                    <asp:DropDownList ID="cb_DistUpdateIdKendaraan" runat="server" 
                        DataSourceID="SqlDataSource4" DataTextField="id_kendaraan" 
                        DataValueField="id_kendaraan" 
                        onselectedindexchanged="cb_DistUpdateIdKendaraan_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:fpConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:fpConnectionString.ProviderName %>" 
                        SelectCommand="select id_kendaraan from kendaraan order by id_kendaraan">
                    </asp:SqlDataSource>
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
        </table>
    </div>
</asp:Content>
