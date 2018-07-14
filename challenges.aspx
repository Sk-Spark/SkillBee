<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="challenges.aspx.cs" Inherits="SkillBee.challenges" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="../Styles/challenges.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <div id="headding">
            <h1><%=Session["SubTopic"] %> Challenges </h1>
        </div>
        <hr />

        <asp:DataList runat="server" ID="DLChallenge" RepeatDirection="Horizontal" RepeatColumns="4">
            <ItemTemplate>
                <div class="challenge">
                    <h2 class="challengeHeading"><%#Eval("Heading1") %>
                    <br>
                        <%#Eval("Heading2") %></h2>
                    <asp:Button runat="server" class="button" Text="Take Challenge" PostBackUrl='<%#Eval("ChallengesID","ExamForm.aspx?ID={0}") %>'/>
                </div>
            </ItemTemplate>
        </asp:DataList>

    </div>
</asp:Content>
