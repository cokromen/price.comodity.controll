<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FINPRO.Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="mainCol">
    <div class="subtitle">
    <h1>"Price Comodity Cotroller, Pastikan barang anda dihargai dengan benar"</h1>
    </div>
        <div class="rightCol">
            

                        <h2>
                            Daftar Sekarang, gratis!
                        </h2>
                        
                        <span class="failureNotification">
                            <asp:Label ID="lb_DefaultRegisterError" runat="server" Text="Label" 
                            Visible="False"></asp:Label>
                            <br />
                            <asp:Label ID="lb_DefaultRegisterEmptyUser" runat="server" 
                            Text="Label" Visible="False"></asp:Label>
                            <br />
                            <asp:Label ID="lb_DefaultRegisterEmptyEmail" runat="server" 
                            Text="Label" Visible="False"></asp:Label>
                            <br />
                            <asp:Label ID="lb_DefaultRegisterEmptyPasswordError" runat="server" 
                            Text="Label" Visible="False"></asp:Label>
                            <br />
                            <asp:Label ID="lb_DefaultRegisterPassowordNotMatch" runat="server" 
                            Text="Label" Visible="False"></asp:Label>
                        </span>
                        <div class="rightAccountInfo">
                            <fieldset class="register">
                                <legend>Informasi Akun</legend>
                                <p>
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                    <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                                         CssClass="failureNotification" ErrorMessage="User Name belum terisi." ToolTip="User Name belum terisi." 
                                         ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                </p>
                                <div style="padding:0 10px 0 10px">
                                    <div style="float:left; width:50%">
                                        <asp:Label ID="Label1" runat="server" AssociatedControlID="Password">Saya Seorang:</asp:Label>
                                        <asp:DropDownList ID="DropDownList1" runat="server" 
                                            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                                            <asp:ListItem>Distributor</asp:ListItem>
                                            <asp:ListItem>Petani</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Password" 
                                         CssClass="failureNotification" ErrorMessage="Password belum terisi." ToolTip="Password belum terisi." 
                                         ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                    </div>
                                    <div>
                                        <asp:Label ID="Label2" runat="server" AssociatedControlID="Password">Daerah Asal:</asp:Label>
                                        <asp:DropDownList ID="DropDownList2" runat="server" 
                                            DataSourceID="SqlDataSource1" DataTextField="nama_daerah" 
                                            DataValueField="nama_daerah" 
                                            onselectedindexchanged="DropDownList2_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:fpConnectionString %>" 
                                            ProviderName="<%$ ConnectionStrings:fpConnectionString.ProviderName %>" 
                                            SelectCommand="SELECT nama_daerah from daerah"></asp:SqlDataSource>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Password" 
                                         CssClass="failureNotification" ErrorMessage="Password belum terisi." ToolTip="Password belum terisi." 
                                         ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                    
                                    </div>
                                </div>
                                <p>
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password 
                            (<%= Membership.MinRequiredPasswordLength %> karakter):</asp:Label>
                                    <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                                         CssClass="failureNotification" ErrorMessage="Password belum terisi." ToolTip="Password belum terisi." 
                                         ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                </p>
                                <p>
                                    <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Konfirmasi Password:</asp:Label>
                                    <asp:TextBox ID="ConfirmPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="ConfirmPassword" CssClass="failureNotification" Display="Dynamic" 
                                         ErrorMessage="Confirm Password belum terisi." ID="ConfirmPasswordRequired" runat="server" 
                                         ToolTip="Konfirmasi Password belum terisi." ValidationGroup="RegisterUserValidationGroup">*</asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                         CssClass="failureNotification" Display="Dynamic" ErrorMessage="Password and Konfirmasi Password tidak sama."
                                         ValidationGroup="RegisterUserValidationGroup">*</asp:CompareValidator>
                                </p>
                            </fieldset>
                            <p class="submitButton">
                                <%--<asp:Button class="positiveButton" ID="CreateUserButton" runat="server" CommandName="MoveNext" Text="Daftarkan Saya" ValidationGroup="RegisterUserValidationGroup"/>--%>
                                     <asp:button type="submit" ID="bt_DefaultRegistSubmit" onclick="RegisterUser_CreatedUser" class="positive button" Text="Daftarkan Saya" runat="server" CssClass="button"/>
                            </p>
                        </div> 
                    </ContentTemplate>
                   <CustomNavigationTemplate>
                    </CustomNavigationTemplate>
        </div>
        
    </div>
</asp:Content>