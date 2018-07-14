<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExamForm.aspx.cs" Inherits="SkillBee.ExamForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Exam Form</title>

    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
        }

        .main {
            margin: 0px auto;
            width: 80%;
            background-color: #eee;
        }

        .DivQues {
            margin: 10px;
            font-size: 26px;
            font-family: 'Bookman Old Style';
            color: #077ea7;
            font-style: italic;
            min-height: 300px;
        }

        .DivAns {
            margin: 0px 30px 0px 30px;
            background-color: #37d;
            color: #ffffff;
            line-height: 60px;
            font-size: 23px;
            font-style: italic;
            padding: 0px 17px;
        }

        .DivAnsAll {
        }

        .DivAnsHeading {
            line-height: 30px;
            font-size: 30px;
            text-align: center;
            color: #02ae37;
            font-family: 'Agency FB';
            font-weight: bold;
            padding: 7px 0px;
            border-top: 2px solid;
        }



        .divToggal {
            background-color: #fff;
            border: 2px solid #ccc;
            margin-bottom: 2px;
            content: "";
            display: inline-block;
            font-size: 12px;
            height: 16px;
            width: 16px;
            line-height: 16px;
            text-align: center;
            vertical-align: middle;
        }

        .Btn {
            background-color: #080;
            line-height: 40px;
            width: 110px;
            color: #fff;
            font-size: 21px;
            padding: 3px 8px;
            margin: 10px;
            cursor: pointer;
        }

        #DivTimmer {
            color: #fff;
            background-color: #f51;
            font-size: 30px;
            text-align: center;
            padding: 10px 0px;
            font-style: italic;
            font-family: Lucida Calligraphy;
        }

        #Minutes {
        }

        #Second {
        }

        #Minutes, #Second {
            font-family: LCDMono2;
            font-style: normal;
        }

        #BtnPrevious {
        }

        #BtnNext {
            float: right;
        }

        #DivChallengeHead {
            text-align: left;
            font-size: 40px;
            color: #fff;
            background-color: #29bd70;
            padding: 10px 0px;
            padding-left: 28px;
            font-style: italic;
        }
    </style>

    <script type="text/javascript">
        function PassFintion2(el) {
            var chk = document.getElementById("checkbox" + el);
            var lbl = document.getElementById("Lbl" + el);
            lbl.style.backgroundColor = "rgb(209, 96, 44)";
            chk.checked = true;

            if (el != '1') {
                document.getElementById('checkbox1').checked = false;
                document.getElementById('Lbl1').style.backgroundColor = "#fff";
            }

            if (el != '2') {
                document.getElementById('checkbox2').checked = false;
                document.getElementById('Lbl2').style.backgroundColor = "#fff";
            }

            if (el != '3') {
                document.getElementById('checkbox3').checked = false;
                document.getElementById('Lbl3').style.backgroundColor = "#fff";
            }

            if (el != '4') {
                document.getElementById('checkbox4').checked = false;
                document.getElementById('Lbl4').style.backgroundColor = "#fff";
            }
        }

        function Counter(min, sec) {
            var DivMin = document.getElementById("Minutes");
            var DivSec = document.getElementById("Second");

            if (min == 0 && sec == 59) {
                DivMin.style.fontSize = "36px";
                DivMin.style.color = "#f00";

                DivSec.style.fontSize = "36px";
                DivSec.style.color = "#f00";
            }

            if (sec == 0 && min == 0) {
                document.getElementById("form1").submit();
                return;
            }

            if (sec == 0) {
                sec = 59;
                min--;
            }
            else {
                sec--;
            }

            if (sec < 10) {
                DivSec.innerHTML = "0" + sec;
            }
            else {
                DivSec.innerHTML = sec;
            }

            if (min < 10) {
                DivMin.innerHTML = "0" + min + ":";
            }
            else {
                DivMin.innerHTML = min + ":";
            }

            document.getElementById("HiddenMin").value = min;
            document.getElementById("HiddenSec").value = sec;

            setTimeout('Counter(' + min + ',' + sec + ')', 1000);

        }

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:HiddenField ID="HiddenQues1" runat="server" Value="0" />
        <asp:HiddenField ID="HiddenQues2" runat="server" Value="0" />
        <asp:HiddenField ID="HiddenQues3" runat="server" Value="0" />
        <asp:HiddenField ID="HiddenQues4" runat="server" Value="0" />
        <asp:HiddenField ID="HiddenQues5" runat="server" Value="0" />
        <asp:HiddenField ID="HiddenQues6" runat="server" Value="0" />
        <asp:HiddenField ID="HiddenQues7" runat="server" Value="0" />
        <asp:HiddenField ID="HiddenQues8" runat="server" Value="0" />
        <asp:HiddenField ID="HiddenQues9" runat="server" Value="0" />
        <asp:HiddenField ID="HiddenQues10" runat="server" Value="0" />
        <asp:HiddenField ID="HiddenQuesNo" runat="server" Value="0" />

        <asp:HiddenField ID="HiddenMin" runat="server" Value="20" />
        <asp:HiddenField ID="HiddenSec" runat="server" Value="0" />


        <div class="main">
            <div id="DivTimmer" runat="server">
                Time Remaining &nbsp;
                  <span id="Minutes">20:</span><span id="Second">00</span>
            </div>

            <div id="DivChallengeHead" runat="server"></div>

            <div class="DivQues" id="DivQues" runat="server">
            </div>
            <div class="DivAnsAll">

                <div class="DivAnsHeading">Answers </div>

                <div class="DivAns" onclick="PassFintion2('1');">
                    <asp:CheckBox ID="checkbox1" runat="server" Style="visibility: hidden" />
                    <label id="Lbl1" class="divToggal"></label>
                    <span id="DivAns1" runat="server"></span>
                </div>
                <br />

                <div onclick="PassFintion2('2');" class="DivAns">
                    <asp:CheckBox runat="server" ID="checkbox2" Style="visibility: hidden" />
                    <label id="Lbl2" class="divToggal"></label>
                    <span id="DivAns2" runat="server"></span>
                </div>
                <br />

                <div onclick="PassFintion2('3');" class="DivAns">
                    <asp:CheckBox runat="server" ID="checkbox3" Style="visibility: hidden" />
                    <label id="Lbl3" class="divToggal"></label>
                    <span id="DivAns3" runat="server"></span>
                </div>
                <br />

                <div onclick="PassFintion2('4');" class="DivAns" runat="server">
                    <asp:CheckBox runat="server" ID="checkbox4" Style="visibility: hidden" />
                    <label id="Lbl4" class="divToggal"></label>
                    <span id="DivAns4" runat="server"></span>

                </div>
                <br />
            </div>

            <div class="DivControls">
                <asp:Button runat="server" CssClass="Btn" ID="BtnPrevious" Text="Previous" BorderStyle="None" OnClick="BtnPrevious_Click" />
                <asp:Button runat="server" CssClass="Btn" ID="BtnSubmit" Text="SUBMIT" BorderStyle="None" OnClick="ButtonSubmit_Click" Visible="false" />
                <asp:Button runat="server" CssClass="Btn" ID="BtnNext" Text="Next" BorderStyle="None" OnClick="BtnNext_Click" />
            </div>
        </div>
    </form>

    <div id="DivCounterCall" runat="server">
        <script type="text/javascript">

            var HMin = document.getElementById("HiddenMin");
            var HSec = document.getElementById("HiddenSec");

            Counter(parseInt(HMin.value), parseInt(HSec.value));
        </script>
    </div>
</body>
</html>
