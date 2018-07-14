 <%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="adminLogin.aspx.cs" Inherits="SkillBee.adminLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="Styles/contactUs.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="gradiant">&nbsp;</div>

    <div class="container">
        <div class="heading">
                Admin Login
            </div>
            <hr />

        <asp:TextBox CssClass="txtBox" ID="TextBoxAdminId" runat="server" placeholder="Admin ID" required="reduired"></asp:TextBox>
        <asp:TextBox CssClass="txtBox" ID="TextBoxAdminPass" runat="server" placeholder="Password" required="reduired" TextMode="Password"></asp:TextBox>
        <asp:Button CssClass="button" ID="btnSubmit" runat="server" Text="Login" OnClick="btnSubmit_Click" />


    </div>

</asp:Content>
