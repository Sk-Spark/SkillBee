<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="challenges.aspx.cs" Inherits="SkillBee.unix.challenges" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/challenges.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <div id="headding">   
            <h1> UNIX Programming Challenges </h1> 
        </div>
        <hr />

        <div class="challenge">
            <h2 class="challengeHeading">UNIX Programming <br>Easy Level</h2>
            <input type="button" class="button" value="Take Challenge">
        </div>

        <div class="challenge">
            <h2 class="challengeHeading">UNIX Programming <br>Difficult Level</h2>
            <input type="button" class="button" value="Take Challenge">
        </div>

        <div class="challenge">
            <h2 class="challengeHeading">UNIX Terminal <br>Challenge</h2>
            <input type="button" class="button" value="Take Challenge">
        </div>

        <div class="challenge">
            <h2 class="challengeHeading">UNIX Shell Script <br>Programming</h2>
            <input type="button" class="button" value="Take Challenge">
        </div>

    </div>

</asp:Content>
