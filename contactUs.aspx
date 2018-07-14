<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="contactUs.aspx.cs" Inherits="SkillBee.contactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="Styles/contactUs.css" rel="stylesheet" />
    <link href="Styles/content.css" rel="stylesheet" />

    <script type="text/javascript">

        function check()
        {
            var Name  = document.getElementById('<% =TextBoxName.ClientID %>');
            var Email = document.getElementById('<% =TextBoxEmail.ClientID %>');
            var Sub = document.getElementById('<% =TextBoxSubject.ClientID %>');
            var Msg = document.getElementById('<% =TextBoxMsg.ClientID %>');

            if (Name.value.length == 0)
            {
                Name.style.boxShadow = "0px 0px 5px 2px #F20";
                Email.style.boxShadow = "";
                Sub.style.boxShadow = "";
                Msg.style.boxShadow = "";
                Name.focus();
                return false;
            }

            if (Email.value.length == 0) {
                Email.style.boxShadow = "0px 0px 5px 2px #F20";
                Name.style.boxShadow = "";
                Sub.style.boxShadow = "";
                Msg.style.boxShadow = "";
                Email.focus();
                return false;
            }

            if (Sub.value.length == 0) {
                Sub.style.boxShadow = "0px 0px 5px 2px #F20";
                Name.style.boxShadow = "";
                Email.style.boxShadow = "";
                Msg.style.boxShadow = "";
                Sub.focus();
                return false;
            }

            if (Msg.value.length == 0) {
                Msg.style.boxShadow = "0px 0px 5px 2px #F20";
                Name.style.boxShadow = "";
                Email.style.boxShadow = "";
                Sub.style.boxShadow = "";
                Msg.focus();
                return false;
            }

            return true;
        }

    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="gradiant">&nbsp;</div>

    <div class="container">
        <div id="divForm" runat="server">
            <div class="heading">
                Contact Us
            </div>
            <hr />

            <asp:TextBox CssClass="txtBox" ID="TextBoxName" runat="server" placeholder="Name..." ></asp:TextBox>
            <asp:TextBox CssClass="txtBox" ID="TextBoxEmail" runat="server" placeholder="Email..."  TextMode="Email"></asp:TextBox>
            <asp:TextBox CssClass="txtBox" ID="TextBoxSubject" runat="server" placeholder="Subject..." ></asp:TextBox>
            <asp:TextBox CssClass="txtArea" ID="TextBoxMsg" runat="server" placeholder="Type Your Message here..."  TextMode="MultiLine" Columns="36" Rows="36" EnableTheming="False"></asp:TextBox>
            <asp:Button CssClass="button" ID="btnSubmit" runat="server" Text="Send" OnClick="btnSubmit_Click" OnClientClick="return check();" />
        </div>

        <div id="divResponce" runat="server">
            <h1 id="result" class="heading" runat="server">  </h1>
        </div>
    </div>

</asp:Content>
