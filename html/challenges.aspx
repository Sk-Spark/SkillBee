<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="challenges.aspx.cs" Inherits="SkillBee.webUi.challenges" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/challenges.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <div id="headding">   
            <h1> HTML Programming Challenges </h1> 
        </div>
        <hr />

        <div class="challenge">
            <h2 class="challengeHeading">DHTML <br>&nbsp;</h2>
            <input type="button" class="button" value="Take Challenge">
        </div>

        <div class="challenge">
            <h2 class="challengeHeading">HTML 5.0 <br>&nbsp;</h2>
            <input type="button" class="button" value="Take Challenge">
        </div>

        <div class="challenge">
            <h2 class="challengeHeading">XHTML <br>&nbsp;</h2>
            <input type="button" class="button" value="Take Challenge">
        </div>

    </div>

</asp:Content>
