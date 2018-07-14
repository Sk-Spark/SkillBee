<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="default2.aspx.cs" Inherits="SkillBee.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/default.css" rel="stylesheet" />

    <script type="text/javascript">

        var scrollY = 0;
        var distance = 20;
        var speed = 24;
        var topDistance = 100;
        var en = 0;

        function autoScroll(el) {
            var currentY = window.pageYOffset;
            var targetY = document.getElementById(el).offsetTop - topDistance;
            var bodyHeight = document.body.offsetHeight;
            var yPos = currentY + window.innerHeight;
            var animator = setTimeout('autoScroll(\'' + el + '\')', speed);

            en = 1;
            if (yPos > bodyHeight) {
                clearTimeout(animator);
            }
            else {
                if (currentY < targetY - distance) {
                    scrollY = currentY + distance;
                    window.scrollTo(currentY, scrollY);
                }
                else {
                    clearTimeout(animator);
                    en = 0;
                }
            }
        }

        function resetScroll(el) {
            var currentY = window.pageYOffset;
            var targetY = document.getElementById(el).offsetTop - topDistance;
            var animator = setTimeout('resetScroll(\'' + el + '\')', speed);

            en = 1;
            if (currentY > targetY) {
                scrollY = currentY - distance;
                window.scrollTo(currentY, scrollY);
            }
            else {
                clearTimeout(animator);
                en = 0;
            }
        }


        function decider(el) {

            if (en == 1) {
                return;
            }

            var currentY = window.pageYOffset;
            var targetY = document.getElementById(el).offsetTop;
            alert(' ' + targetY);

            if (currentY > targetY) {
                resetScroll(el);
            }
            else {
                autoScroll(el);
            }

        }

        function topShado() {
            if (window.pageYOffset > 200) {
                document.getElementById("topAncher").style.visibility = "visible";
            }
            else {
                document.getElementById("topAncher").style.visibility = "hidden";
            }

            setTimeout('topShado()', 40);
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="topicNav" style="margin-top: 54px;">

        <ul class="topicUl">
            <li><a class="a" onclick="decider('db');">Database Management </a></li>
            <li><a class="a" onclick="decider('ui');">Web UI </a></li>
            <li><a class="a" onclick="decider('os');">OS </a></li>
            <li><a class="a" onclick="decider('programming');">Programming </a></li>
        </ul>

    </div>

    <div class="container" style="margin-top:5px;">


        <asp:DataList ID="DLTopic" runat="server">
            <ItemTemplate>
                <div id='<%#Eval("TopicPageID") %>'>
                    <h1 class="heading1"><%#Eval("TopicName") %></h1>
                    <hr />
                    <asp:DataList ID="DLSubTopic" runat="server" AutoGenerateColumns="False" DataSource='<%# Bind("SubTopic") %>' GridLines="None" ShowHeader="False"  RepeatDirection="Horizontal" RepeatColumns="4">
                        <ItemTemplate>
                            <div class="topic">
                                <a id="A1" runat="server" href='<%#Eval("SubTopicID","challenges.aspx?SubTopicID={0}") %>'>
                                    <div class="topicHeader"><%#Eval("SubTopicHeading") %></div>
                                    <img id="Img1" runat="server" src='<%#Eval("SubTopicImg") %>' />
                                </a>
                            </div>
                        </ItemTemplate>

                    </asp:DataList>
                </div>

            </ItemTemplate>
        </asp:DataList>



    </div>



    <div class="top" id="topAncher">
        <a style="cursor: pointer;" onclick="decider('programming');">
            <img src="img/up-arrow-round-blue.png" />
        </a>
    </div>

    <script type="text/javascript">
        topShado();
    </script>


</asp:Content>
