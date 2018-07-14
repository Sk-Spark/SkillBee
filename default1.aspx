<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="default1.aspx.cs" Inherits="SkillBee.WebForm1" %>

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


        function decider(el)
        {

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

    <div class="topicNav">

        <ul class="topicUl">
            <li><a class="a" onclick="decider('db');">Database Management </a></li>
            <li><a class="a" onclick="decider('ui');">Web UI </a></li>
            <li><a class="a" onclick="decider('os');">OS </a></li>
            <li><a class="a" onclick="decider('programming');">Programming </a></li>
        </ul>

    </div>

    <div class="container">

        <div id="programming">
            <h1 class="heading1">Programming</h1>
            <hr />
            <div class="subParts">

                <div class="topic">
                    <a runat="server" href="~/c/challenges.aspx">
                        <div class="topicHeader">C Programming</div>
                        <img src="img/c.png" />
                    </a>
                </div>

                <div class="topic">
                    <a runat="server" href="~/cSharp/challenges.aspx">
                        <div class="topicHeader">C# </div>
                        <img src="img/cSharp.png" />
                    </a>
                </div>

                <div class="topic">
                    <a runat="server" href="~/cpp/challenges.aspx">
                        <div class="topicHeader">C++ </div>
                        <img src="img/cpp.png" />
                    </a>
                </div>

                <div class="topic">
                    <a runat="server" href="~/java/challenges.aspx">
                        <div class="topicHeader">Java </div>
                        <img src="img/java.png" />
                    </a>
                </div>

            </div>

        </div>

        <div id="os" class="superTopic">
            <h1 class="heading1">Operating System</h1>
            <hr />
            <div class="subParts">

                <div class="topic">
                    <a runat="server" href="~/linux/challenges.aspx">
                        <div class="topicHeader">Linux</div>
                        <img src="img/linux.png" />
                    </a>
                </div>

                <div class="topic">
                    <a runat="server" href="~/windows/challenges.aspx">
                        <div class="topicHeader">Windows </div>
                        <img src="img/windows.png" />
                    </a>
                </div>

                <div class="topic">
                    <a runat="server" href="~/unix/challenges.aspx">
                        <div class="topicHeader">Unix</div>
                        <img src="img/unix.png" />
                    </a>
                </div>


            </div>

        </div>

        <div id="ui" class="superTopic" >
            <h1 class="heading1">Web UI</h1>
            <hr />
            <div class="subParts">

                <div class="topic">
                    <a href="~/html/challenges.aspx" runat="server">
                        <div class="topicHeader">HTML</div>
                        <img src="img/html.png" />
                    </a>
                </div>

                <div class="topic">
                    <a href="~/css/challenges.aspx" runat="server">
                        <div class="topicHeader">CSS </div>
                        <img src="img/css.png" />
                    </a>
                </div>


            </div>

        </div>

        <div id="db" class="superTopic" >
            <h1 class="heading1">Database Management </h1>
            <hr />
            <div class="subParts">

                <div class="topic">
                    <a href="~/mySql/challenges.aspx" runat="server">
                        <div class="topicHeader">My SQL</div>
                        <img src="img/mySql.png" />
                    </a>
                </div>

                <div class="topic">
                    <a href="~/sqlServer/challenges.aspx" runat="server">
                        <div class="topicHeader">SQL Server </div>
                        <img src="img/sqlServer.png" />
                    </a>
                </div>

                <div class="topic">
                    <a href="~/oracle/challenges.aspx" runat="server">
                        <div class="topicHeader">Oracle </div>
                        <img src="img/oracle.png" />
                    </a>
                </div>

            </div>

        </div>

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
