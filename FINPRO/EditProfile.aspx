<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Homepage.master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="FINPRO.EditProfile" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style1
        {
            width: 150px;
        }
        #Text1
        {
            width: 328px;
        }
        #Text2
        {
            width: 328px;
        }
        #Text3
        {
            width: 328px;
        }
    #Text4
    {
        width: 328px;
    }
    #Text5
    {
        width: 328px;
    }
    #Text6
    {
        width: 328px;
    }
        #Select1
        {
            width: 125px;
        }
        .auto-style1 {
            width: 150px;
            height: 21px;
        }
        .auto-style2 {
            height: 21px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div style="padding:20px; text-align:left">
    <h2 >Edit Profile</h2>
        <table style="width:100%">
        
            <tr>
                <td class="style1">
                    Password</td>
                <td>
                    <asp:TextBox ID="tb_EditProfilePassword" runat="server" 
                        ontextchanged="tb_EditProfilePassword_TextChanged" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Konfirmasi
                    Password</td>
                <td>
                    <asp:TextBox ID="tb_EditProfileKonfirmasi" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    Daerah Domisili</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" 
                        DataSourceID="SqlDataSource1" DataTextField="nama_daerah" 
                        DataValueField="nama_daerah">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:fpConnectionString %>" 
                        ProviderName="<%$ ConnectionStrings:fpConnectionString.ProviderName %>" 
                        SelectCommand="SELECT nama_daerah FROM daerah ORDER by id_daerah">
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td>
                    <asp:Button ID="bt_EditProfileSave" runat="server" CssClass="button" 
                        onclick="bt_EditProfileSave_Click" Text="Save" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                </td>
                <td class="auto-style2">
                    </td>
                <td class="auto-style2">
                    </td>
            </tr>
            <tr>
                <td></td>
                <td>&nbsp;</td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>
    </div>
</asp:Content>
