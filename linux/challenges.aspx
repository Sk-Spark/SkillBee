<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="challenges.aspx.cs" Inherits="SkillBee.linux.challenges" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/challenges.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <div id="headding">   
            <h1> Linux Programming Challenges </h1> 
        </div>
        <hr />

        <div class="challenge">
            <h2 class="challengeHeading">Linux Programming <br>Easy Level</h2>
            <input type="button" class="button" value="Take Challenge">
        </div>

        <div class="challenge">
            <h2 class="challengeHeading">Linux Programming <br>Intermediate Level</h2>
            <input type="button" class="button" value="Take Challenge">
        </div>

        <div class="challenge">
            <h2 class="challengeHeading">Linux Programming <br>Difficult Level</h2>
            <input type="button" class="button" value="Take Challenge">
        </div>

    </div>

</asp:Content>
