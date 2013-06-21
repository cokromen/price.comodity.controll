<%@ Page Title="" Language="C#" MasterPageFile="~/Homepage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FINPRO.Login" %>
<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div class="centerCol">
        <h2>
            Log In
        </h2>
        <p>
            Masukkan username dan password anda.
            <asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false">Mendaftar</asp:HyperLink> jika anda belum punya akun.
        </p>
              <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <asp:Login ID="LoginUser" runat="server" EnableViewState="false" RenderOuterTable="false">
            <LayoutTemplate>
                <span class="failureNotification">
                    <asp:Literal ID="FailureText" runat="server"></asp:Literal>

                </span>
                <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification" 
                     ValidationGroup="LoginUserValidationGroup"/>
                <div class="centerAccountInfo">
                    <fieldset class="login">
                        <legend>Informasi Akun</legend>
                        <p>
                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Username:</asp:Label>
                            <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" 
                                 CssClass="failureNotification" ErrorMessage="User Name belum terisi." ToolTip="User Name belum terisi." 
                                 ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                        </p>
                        <p>
                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                            <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" 
                                 CssClass="failureNotification" ErrorMessage="Password belum terisi." ToolTip="Password belum terisi." 
                                 ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                        </p>
                    </fieldset>
                    <p class="submitButton">
                        <%--<asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="LoginUserValidationGroup"/>--%>
                       <%--<asp:button runat=server type="submit" class="positive button" name="ctl00$MainContent$LoginUser$LoginButton" onclick="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$MainContent$LoginUser$LoginButton&quot;, &quot;&quot;, true, &quot;LoginUserValidationGroup&quot;, &quot;&quot;, false, false))">Log In</button>
                         --%>
                        
                        
                        <asp:Button ID="Bt_LoginSubmit" runat="server" type="submit" Text="Log In" 
                            CssClass="button" onclick="LogIn" />
                        
                        
                    </p>
                </div>
            </LayoutTemplate>
        </asp:Login>

    </div>
</asp:Content>