<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="SkillBee.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login / Sign Up</title>

    <style type="text/css">
        body {
            padding: 0px;
            margin: 0px;
            background-color: #0094ff;
            background-image:url("img/backgrounds/registration.jpg");
            color: #eee;
        }

        h1 {
            font-size: 50px;
            font-family: Lucida Calligraphy;
            margin: 70px 0px 0px;
            padding: 0px;
        }

        h2 {
            margin: 0px;
            padding: 0px;
            font-size: 20px;
            font-family: 'Arial';
        }

        .contaner {
            margin: 0px auto;
            width: 80%;
            opacity:0.8;
        }

        .main {
            text-align: center;
        }

        .content {
            margin: auto;
            width: 60%;
        }

        .header {
            margin-top: 20px;
            height: 50px;
        }

        .Tab {
            height: 50px;
            font-size: 20px;
            border-radius: 3px 4px 0px 0px;
            color: #09E;
            border-style: none;
            width: 48.9%;
            cursor: pointer;
        }

        .divform {
            background-color: #EEE;
            padding-top: 20px;
            padding-bottom: 20px;
            border-radius: 0px 0px 3px 4px;
            margin-left: 0.7%;
            width: 98.8%;
        }

        .TextBox {
            padding: 10px;
            margin: 5px;
            width: 80%;
            color: #555;
            border-color: #aaa;
            border-radius: 4px;
        }

        .button {
            padding: 5px;
            margin-top: 20px;
            width: 20%;
            background-color: #0ae;
            color: #fff;
            font-size: 15px;
            border:1px;
            border-radius: 5px;
        }

            .button:hover {
                background-color: #09e;
                box-shadow: 0px 0px 10px 2px #06f;
            }

        p {
            padding: 0px 20px;
            margin: 0px 15px;
            font-size: 13px;
            color: #e54141;
        }

        .radio {
            margin-top: 10px;
            padding: 10px;
            margin-left: 29%;
            color: #555;
            border-color: #aaa;
            border-radius: 4px;
        }

        input[type="checkbox"] {
            display: none;
        }

            input[type="checkbox"]:checked + .divToggal {
                background-color: #0ae;
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
    </style>

    <script type="text/javascript">

        function Signup() {
            var divlogin = document.getElementById("divlogin");
            divlogin.style.visibility = "hidden";
            divlogin.style.maxHeight = "0px";

            var divsignup = document.getElementById("divsignup");
            divsignup.style.maxHeight = "initial";

            var divsignup = document.getElementById("divsignup");
            divsignup.style.visibility = "visible";

            var TabLogin = document.getElementById("TabLogin");
            TabLogin.style.backgroundColor = "#ccc";

            var TabSignUp = document.getElementById("TabSignUp");
            TabSignUp.style.backgroundColor = "#eee";

            var nm = document.getElementById("TextBoxUserNameSignUp");
            nm.required = "required";

            var em = document.getElementById("TextBoxEmail");
            em.required = "required";

            var p1 = document.getElementById("TextBoxPasswordSignUp1");
            p1.required = "required";

            var p2 = document.getElementById("TextBoxPasswordSignUp2");
            p2.required = "required";
        }

        function Login() {
            var divsignup = document.getElementById("divsignup");
            divsignup.style.visibility = "hidden";
            divsignup.style.maxHeight = "0px";

            var divlogin = document.getElementById("divlogin");
            divlogin.style.maxHeight = "initial";

            var divlogin = document.getElementById("divlogin");
            divlogin.style.visibility = "visible";

            var TabLogin = document.getElementById("TabLogin");
            TabLogin.style.backgroundColor = "#eee";

            var TabSignUp = document.getElementById("TabSignUp");
            TabSignUp.style.backgroundColor = "#ccc";

            var nm = document.getElementById("TextBoxUserNameSignUp");
            nm.required = "";

            var em = document.getElementById("TextBoxEmail");
            em.required = "";

            var p1 = document.getElementById("TextBoxPasswordSignUp1");
            p1.required = "";

            var p2 = document.getElementById("TextBoxPasswordSignUp2");
            p2.required = "";

        }

        function PassFintion1() {

            var x = document.getElementById("checkboxPass1");

            if (x.checked) {
                x.checked = false;
            }
            else {
                x.checked = true;
            }


            var y = document.getElementById("TextBoxPassword");

            if (x.checked) {
                y.type = "text";
            }
            else {
                y.type = "password";
            }
            y.focus();
        }


        function PassFintion2() {

            var x = document.getElementById("checkboxPass2");

            if (x.checked) {
                x.checked = false;
            }
            else {
                x.checked = true;
            }


            var y = document.getElementById("TextBoxPasswordSignUp1");
            var z = document.getElementById("TextBoxPasswordSignUp2");

            if (x.checked) {
                y.type = "text";
                z.type = "text";
            }
            else {
                y.type = "password";
                z.type = "password";
            }
            y.focus();
        }

        function CheckSignUp() {
            var p1, p2, alrt;

            alrt = document.getElementById("alrtSignUp");
            p1 = document.getElementById("TextBoxPasswordSignUp1");
            p2 = document.getElementById("TextBoxPasswordSignUp2");

            var cv = p1.toString();
            cv = p1.value;

            if (p1.value.toString().length < 6) {
                alrt.innerHTML = "Password You type Is less then 6 characters !!!";
                return false;
            }

            if (p1.value.toString().length > 16) {
                alrt.innerHTML = "Password You type Is greater then 16 characters !!!";
                return false;
            }

            if (cv.localeCompare(p2.value) != 0) {
                alrt.innerHTML = "Password You type does not match !!!";
                return false;
            }
            else {
                alrt.innerHTML = "";
            }
        }

        function checkLogin()
        {
            alrt = document.getElementById("alrtLogin");

            if (document.getElementById('TextBoxEmailLogin').value.toString().length < 1)
            {
                alrt.innerHTML = "Enter Your Email ID !!!";
                document.getElementById('TextBoxEmailLogin').focus();
                return false;
            }

            if (document.getElementById('TextBoxPassword').value.toString().length < 1)
            {
                alrt.innerHTML = "Enter Your Password !!!";
                document.getElementById('TextBoxPassword').focus();
                return false;
            }
        }

        function funSignUp() {
            var alrt = document.getElementById("alrtSignUp");
            var val = document.getElementById("HiddenFieldValue");
            var em = document.getElementById("TextBoxEmail");

            alrt.innerHTML = val.value;
            Signup();
            em.focus();

        }

        function funLogin() {
            var alrt = document.getElementById("alrtLogin");
            var val = document.getElementById("HiddenFieldValue");

            alrt.innerHTML = val.value;

        }


    </script>

</head>
<body>

    <div class="contaner">
        <div style="float: left;">
            <img style="padding-top: 35%;" src="img/logo(288x500).png" />
        </div>

        <div style="float: left">
            <form id="form1" runat="server">

                <div class="main">

                    <h1>Welcome to SkillBee.com </h1>
                    <h2>Test your skills with us . . .   </h2>

                    <div class="content">

                        <div class="header">
                            <input type="button" id="TabLogin" class="Tab" value="Log In" onclick="Login();" />
                            <input type="Button" id="TabSignUp" class="Tab" style="background-color: #ccc;" value="Sign Up" onclick="Signup();" />
                        </div>

                        <div class="divform">

                            <div id="divlogin" runat="server">
                                <asp:TextBox ID="TextBoxEmailLogin" CssClass="TextBox" runat="server" placeholder="Enter Your Email " BorderStyle="Solid" TextMode="Email"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="TextBoxPassword" CssClass="TextBox" runat="server" placeholder="Password " BorderStyle="Solid" TextMode="Password"></asp:TextBox>
                                <br />
                                <br />
                                <label style="color: #06f" onclick="PassFintion1();">
                                    <input id="checkboxPass1" type="checkbox" />
                                    <label class="divToggal"></label>
                                    Show Password
                                </label>
                                <br />
                                <p id="alrtLogin" style="font-size: 25px; margin-top:20px;"></p>
                                <br />
                                <asp:Button ID="ButtonLogin" runat="server" BorderStyle="Solid" CssClass="button" Text="Log In" OnClick="ButtonLogin_Click" OnClientClick="return checkLogin();"/>
                            </div>

                            <div id="divsignup" runat="server" style="color: #000; max-height: 0px; visibility: hidden;">

                                <asp:TextBox ID="TextBoxUserNameSignUp" CssClass="TextBox" runat="server" placeholder="Enter Your Name " BorderStyle="Solid"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="TextBoxEmail" CssClass="TextBox" runat="server" placeholder="Email " BorderStyle="Solid" TextMode="Email"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="TextBoxPasswordSignUp1" CssClass="TextBox" runat="server" placeholder="Password " BorderStyle="Solid" TextMode="Password"></asp:TextBox>
                                <br />
                                <asp:TextBox ID="TextBoxPasswordSignUp2" CssClass="TextBox" runat="server" placeholder="Re-Enter Password " BorderStyle="Solid" TextMode="Password"></asp:TextBox>
                                <br />
                                <p>Apart from Alphabets and Numbers Only allowed special chars are _!$@#^& . Min 6 and Max 16 chars. </p>
                                <br />
                                <label onclick="PassFintion2();" style="color: #06f;">
                                    <input id="checkboxPass2" type="checkbox" />
                                    <label class="divToggal"></label>
                                    Show Password
                                </label>
                                <asp:RadioButtonList ID="RadioButtonList1" Required="required" runat="server" CssClass="radio" Height="24px" RepeatDirection="Horizontal" Width="201px" BorderStyle="Solid">
                                    <asp:ListItem Value="M" Selected="True">Male</asp:ListItem>
                                    <asp:ListItem Value="F">Female</asp:ListItem>
                                </asp:RadioButtonList>
                                <br />

                                <p id="alrtSignUp" style="font-size: 25px;"></p>

                                <asp:Button ID="ButtonSigUp" runat="server" BorderStyle="Solid" CssClass="button" Text="Sign Up" OnClientClick="return CheckSignUp();" OnClick="ButtonSigUp_Click" />

                            </div>

                        </div>

                    </div>

                </div>
                <asp:HiddenField ID="HiddenFieldValue" runat="server" Value="0" />
                <asp:HiddenField ID="st" runat="server" Value="0" />
            </form>
        </div>
    </div>


    <script>
        var x = document.getElementById("st");
        if (x.value.localeCompare("1") == 0) {
            funSignUp();
        }

        if (x.value.localeCompare("2") == 0) {
            funLogin();
        }
    </script>

</body>
</html>
