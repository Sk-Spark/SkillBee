<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="SkillBee.feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="Styles/contactUs.css" rel="stylesheet" />
    <link href="Styles/content.css" rel="stylesheet" />
    <script type="text/javascript">

        var color = "#e9cb54";

        function startUpdate(startEl, n, startLbel, startVal)
        {
            var num = parseInt(n);

            for (var i = num; i > 0; i--)
            {
                var startEle = document.getElementById("" + startEl + i.toString());
                var startEleAfter = document.getElementById("" + startEl + "After" + i.toString());

                startEle.style.borderBottom = "20px solid " + color;
                startEleAfter.style.borderTop = "20px solid " + color;
            }

            for (var i = num+1; i <= 5; i++) {
                var startEle = document.getElementById("" + startEl + i.toString());
                var startEleAfter = document.getElementById("" + startEl + "After" + i.toString());

                startEle.style.borderBottom = "20px solid #ddd";
                startEleAfter.style.borderTop = "20px solid #ddd";
            }

            document.getElementById(startLbel).innerHTML = n + " Stars";
            document.getElementById("ContentPlaceHolder1_" + startVal).value = n;
            //alert("" + startVal + " : " + document.getElementById("ContentPlaceHolder1_" + startVal).value);
        }

        function check()
        {
            var Name = document.getElementById('<%=TextBoxName.ClientID %>');
            var Email = document.getElementById('<%=TextBoxEmail.ClientID %>');
            var Msg = document.getElementById('<%=TextBoxMsg.ClientID %>');

            if (Name.value.length == 0)
            {
                Name.style.boxShadow = "0px 0px 5px 2px #F20";
                Email.style.boxShadow ="";
                Msg.style.boxShadow = "";
                Name.focus();
                return false;
            }

            if (Email.value.length == 0) {
                Email.style.boxShadow = "0px 0px 5px 2px #F20";
                Name.style.boxShadow = "";
                Msg.style.boxShadow = "";
                Email.focus();
                return false;
            }

            if (Msg.value.length == 0) {
                Msg.style.boxShadow = "0px 0px 5px 2px #F20";
                Name.style.boxShadow = "";
                Email.style.boxShadow = "";
                Msg.focus();
                return false;
            }


            
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="gradiant">&nbsp;</div>

    <div class="container">
        <div id="divForm" runat="server">
            <div class="heading">
                Feedback
            </div>
            <hr />

            <asp:TextBox CssClass="txtBox" ID="TextBoxName" runat="server" placeholder="Name..."   ></asp:TextBox>
            <asp:TextBox CssClass="txtBox" ID="TextBoxEmail" runat="server" placeholder="Email..." TextMode="Email"></asp:TextBox>

            <fieldset>
                <legend>Look & Feel</legend>

                <div class="divRdo">
                    <div id="rdoLookFeel1" class="divStart" onclick="startUpdate('rdoLookFeel','1','lblLookFeel','LookFeelValue' );"></div>
                    <div id="rdoLookFeelAfter1" class="divStartAfter"></div>
                </div>

                <div class="divRdo">
                    <div id="rdoLookFeel2" class="divStart" onclick="startUpdate('rdoLookFeel','2','lblLookFeel','LookFeelValue' );"></div>
                    <div id="rdoLookFeelAfter2" class="divStartAfter"></div>
                </div>

                <div class="divRdo">
                    <div id="rdoLookFeel3" class="divStart" onclick="startUpdate('rdoLookFeel','3','lblLookFeel','LookFeelValue' );"></div>
                    <div id="rdoLookFeelAfter3" class="divStartAfter"></div>
                </div>

                <div class="divRdo">
                    <div id="rdoLookFeel4" class="divStart" onclick="startUpdate('rdoLookFeel','4','lblLookFeel','LookFeelValue' );"></div>
                    <div id="rdoLookFeelAfter4" class="divStartAfter"></div>
                </div>

                <div class="divRdo">
                    <div id="rdoLookFeel5" class="divStart" onclick="startUpdate('rdoLookFeel','5','lblLookFeel','LookFeelValue' );"></div>
                    <div id="rdoLookFeelAfter5" class="divStartAfter"></div>
                </div>

                <label id="lblLookFeel" class="label">0 Stars</label>
                <input type="hidden" id="LookFeelValue" runat="server" value="0" />
            </fieldset>

            <fieldset>
                <legend>Layout</legend>

                <div class="divRdo">
                    <div id="rdoLayout1" class="divStart" onclick="startUpdate('rdoLayout','1','lblLayout','LayoutValue' );"></div>
                    <div id="rdoLayoutAfter1" class="divStartAfter"></div>
                </div>

                <div class="divRdo">
                    <div id="rdoLayout2" class="divStart" onclick="startUpdate('rdoLayout','2','lblLayout','LayoutValue' );"></div>
                    <div id="rdoLayoutAfter2" class="divStartAfter"></div>
                </div>

                <div class="divRdo">
                    <div id="rdoLayout3" class="divStart" onclick="startUpdate('rdoLayout','3','lblLayout','LayoutValue' );"></div>
                    <div id="rdoLayoutAfter3" class="divStartAfter"></div>
                </div>

                <div class="divRdo">
                    <div id="rdoLayout4" class="divStart" onclick="startUpdate('rdoLayout','4','lblLayout','LayoutValue' );"></div>
                    <div id="rdoLayoutAfter4" class="divStartAfter"></div>
                </div>

                <div class="divRdo">
                    <div id="rdoLayout5" class="divStart" onclick="startUpdate('rdoLayout','5','lblLayout','LayoutValue' );"></div>
                    <div id="rdoLayoutAfter5" class="divStartAfter"></div>
                </div>

                <label id="lblLayout" class="label">0 Stars</label>
                <input type="hidden" id="LayoutValue" runat="server" value="0" />
            </fieldset>


            <asp:TextBox CssClass="txtArea" ID="TextBoxMsg" runat="server" placeholder="Type Your Feedback Message here..." TextMode="MultiLine" Columns="36" Rows="36" EnableTheming="False"></asp:TextBox>
            <asp:Button CssClass="button" ID="btnSubmit" runat="server" Text="Send Feedback" OnClick="btnSubmit_Click" OnClientClick="return check();" />
        </div>

        <div id="divResponce" runat="server">
            <h1 id="result" class="heading" runat="server"></h1>
        </div>
    </div>

</asp:Content>
