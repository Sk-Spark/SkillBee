<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPageAdmin.master" AutoEventWireup="true" CodeBehind="addQuestions.aspx.cs" Inherits="SkillBee.addQuestions" %>



<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">

    <link href="Styles/addTopics.css" rel="stylesheet" />

    <style type="text/css">
        #Content {
            width: 1981px;
        }

        .container {
            width: 1600px;
        }
    </style>

    <script type="text/javascript">

        function validate() {
            var ChallengesID = document.getElementById("<% =DDLChallengeID.ClientID %>");
            var CorrectAns = document.getElementById("<% =TextBoxCorrectAns.ClientID %>");
            var Ques = document.getElementById("<% =TextBoxQues.ClientID %>");
            var Ans1 = document.getElementById("<% =TextBoxAns1.ClientID %>");
            var Ans2 = document.getElementById("<% =TextBoxAns2.ClientID %>");
            var Ans3 = document.getElementById("<% =TextBoxAns3.ClientID %>");
            var Ans4 = document.getElementById("<% =TextBoxAns4.ClientID %>");

            if (Ques.value.length == 0) {
                Ques.style.boxShadow = "0px 0px 5px 2px #F20";
                CorrectAns.style.boxShadow = "";
                Ans1.style.boxShadow = "";
                Ans2.style.boxShadow = "";
                Ans3.style.boxShadow = "";
                Ans4.style.boxShadow = "";

                Ques.focus();
                return false;
            }
            else if (Ans1.value.length == 0) {
                Ans1.style.boxShadow = "0px 0px 5px 2px #F20";
                CorrectAns.style.boxShadow = "";
                Ques.style.boxShadow = "";
                Ans2.style.boxShadow = "";
                Ans3.style.boxShadow = "";
                Ans4.style.boxShadow = "";

                Ans1.focus();
                return false;
            }
            else if (Ans2.value.length == 0) {
                Ans2.style.boxShadow = "0px 0px 5px 2px #F20";
                CorrectAns.style.boxShadow = "";
                Ques.style.boxShadow = "";
                Ans1.style.boxShadow = "";
                Ans3.style.boxShadow = "";
                Ans4.style.boxShadow = "";

                Ans2.focus();
                return false;
            }
            else if (Ans3.value.length == 0) {
                Ans3.style.boxShadow = "0px 0px 5px 2px #F20";
                CorrectAns.style.boxShadow = "";
                Ques.style.boxShadow = "";
                Ans1.style.boxShadow = "";
                Ans2.style.boxShadow = "";
                Ans4.style.boxShadow = "";

                Ans3.focus();
                return false;
            }
            else if (Ans4.value.length == 0) {
                Ans4.style.boxShadow = "0px 0px 5px 2px #F20";
                CorrectAns.style.boxShadow = "";
                Ques.style.boxShadow = "";
                Ans1.style.boxShadow = "";
                Ans2.style.boxShadow = "";
                Ans3.style.boxShadow = "";

                Ans4.focus();
                return false;
            }
            else if (CorrectAns.value.length == 0) {
                CorrectAns.style.boxShadow = "0px 0px 5px 2px #F20";
                Ques.style.boxShadow = "";
                Ans1.style.boxShadow = "";
                Ans2.style.boxShadow = "";
                Ans3.style.boxShadow = "";
                Ans4.style.boxShadow = "";

                CorrectAns.focus();
                return false;
            }
            else if (isNaN(CorrectAns.value)) {
                CorrectAns.style.boxShadow = "0px 0px 5px 2px #F20";
                Ques.style.boxShadow = "";
                Ans1.style.boxShadow = "";
                Ans2.style.boxShadow = "";
                Ans3.style.boxShadow = "";
                Ans4.style.boxShadow = "";

                CorrectAns.focus();
                return false;
            }

        }


        function EditFunction() {

            var ChallengesID = document.getElementById("<% =DDLChallengeID.ClientID %>" + "E");
            var CorrectAns = document.getElementById("<% =TextBoxCorrectAns.ClientID %>" + "E");
            var Ques = document.getElementById("<% =TextBoxQues.ClientID %>" + "E");
            var Ans1 = document.getElementById("<% =TextBoxAns1.ClientID %>" + "E");
            var Ans2 = document.getElementById("<% =TextBoxAns2.ClientID %>" + "E");
            var Ans3 = document.getElementById("<% =TextBoxAns3.ClientID %>" + "E");
            var Ans4 = document.getElementById("<% =TextBoxAns4.ClientID %>" + "E");

            if (Ques.value.length == 0) {
                Ques.style.boxShadow = "0px 0px 5px 2px #F20";
                CorrectAns.style.boxShadow = "";
                Ans1.style.boxShadow = "";
                Ans2.style.boxShadow = "";
                Ans3.style.boxShadow = "";
                Ans4.style.boxShadow = "";

                Ques.focus();
                return false;
            }
            else if (Ans1.value.length == 0) {
                Ans1.style.boxShadow = "0px 0px 5px 2px #F20";
                CorrectAns.style.boxShadow = "";
                Ques.style.boxShadow = "";
                Ans2.style.boxShadow = "";
                Ans3.style.boxShadow = "";
                Ans4.style.boxShadow = "";

                Ans1.focus();
                return false;
            }
            else if (Ans2.value.length == 0) {
                Ans2.style.boxShadow = "0px 0px 5px 2px #F20";
                CorrectAns.style.boxShadow = "";
                Ques.style.boxShadow = "";
                Ans1.style.boxShadow = "";
                Ans3.style.boxShadow = "";
                Ans4.style.boxShadow = "";

                Ans2.focus();
                return false;
            }
            else if (Ans3.value.length == 0) {
                Ans3.style.boxShadow = "0px 0px 5px 2px #F20";
                CorrectAns.style.boxShadow = "";
                Ques.style.boxShadow = "";
                Ans1.style.boxShadow = "";
                Ans2.style.boxShadow = "";
                Ans4.style.boxShadow = "";

                Ans3.focus();
                return false;
            }
            else if (Ans4.value.length == 0) {
                Ans4.style.boxShadow = "0px 0px 5px 2px #F20";
                CorrectAns.style.boxShadow = "";
                Ques.style.boxShadow = "";
                Ans1.style.boxShadow = "";
                Ans2.style.boxShadow = "";
                Ans3.style.boxShadow = "";

                Ans4.focus();
                return false;
            }
            else if (CorrectAns.value.length == 0) {
                CorrectAns.style.boxShadow = "0px 0px 5px 2px #F20";
                Ques.style.boxShadow = "";
                Ans1.style.boxShadow = "";
                Ans2.style.boxShadow = "";
                Ans3.style.boxShadow = "";
                Ans4.style.boxShadow = "";

                CorrectAns.focus();
                return false;
            }
            else if (isNaN(CorrectAns.value)) {
                CorrectAns.style.boxShadow = "0px 0px 5px 2px #F20";
                Ques.style.boxShadow = "";
                Ans1.style.boxShadow = "";
                Ans2.style.boxShadow = "";
                Ans3.style.boxShadow = "";
                Ans4.style.boxShadow = "";

                CorrectAns.focus();
                return false;
            }

            document.getElementById("<% =Event.ClientID%>").value = "edit";
            document.getElementById("<% =ChallengesID.ClientID %>").value = ChallengesID.value;
            document.getElementById("<% =CorrectAns.ClientID%>").value = CorrectAns.value;
            document.getElementById("<% =Ques.ClientID%>").value = Ques.value;
            document.getElementById("<% =Ans1.ClientID%>").value = Ans1.value;
            document.getElementById("<% =Ans2.ClientID%>").value = Ans2.value;
            document.getElementById("<% =Ans3.ClientID%>").value = Ans3.value;
            document.getElementById("<% =Ans4.ClientID%>").value = Ans4.value;

        }

    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <asp:HiddenField runat="server" ID="QuesID" />
        <asp:HiddenField runat="server" ID="ChallengesID" />
        <asp:HiddenField runat="server" ID="CorrectAns" />
        <asp:HiddenField runat="server" ID="Ques" />
        <asp:HiddenField runat="server" ID="Ans1" />
        <asp:HiddenField runat="server" ID="Ans2" />
        <asp:HiddenField runat="server" ID="Ans3" />
        <asp:HiddenField runat="server" ID="Ans4" />
        <asp:HiddenField runat="server" ID="Event" />

        <div class="heading">
            Challenges
        </div>
        <hr />
        <asp:Label ID="LblResult" runat="server"></asp:Label>
        <asp:Table ID="TableTopic" runat="server" ViewStateMode="Enabled">
            <asp:TableHeaderRow ID="TableHeaderRow1" CssClass="TableHeader" runat="server" ViewStateMode="Enabled">
                <asp:TableHeaderCell ID="TableHeaderCell1" runat="server" CssClass="TableHeaderCell">#ID</asp:TableHeaderCell>
                <asp:TableHeaderCell ID="TableHeaderCell2" runat="server" CssClass="TableHeaderCell">Challenges Name</asp:TableHeaderCell>
                <asp:TableHeaderCell ID="TableHeaderCell6" runat="server" CssClass="TableHeaderCell">Ques</asp:TableHeaderCell>
                <asp:TableHeaderCell ID="TableHeaderCell3" runat="server" CssClass="TableHeaderCell">Ans1</asp:TableHeaderCell>
                <asp:TableHeaderCell ID="TableHeaderCell4" runat="server" CssClass="TableHeaderCell">Ans2</asp:TableHeaderCell>
                <asp:TableHeaderCell ID="TableHeaderCell7" runat="server" CssClass="TableHeaderCell">Ans3 </asp:TableHeaderCell>
                <asp:TableHeaderCell ID="TableHeaderCell8" runat="server" CssClass="TableHeaderCell">Ans4 </asp:TableHeaderCell>
                <asp:TableHeaderCell ID="TableHeaderCell9" runat="server" CssClass="TableHeaderCell">Correct Ans </asp:TableHeaderCell>
                <asp:TableHeaderCell ID="TableHeaderCell5" runat="server" CssClass="TableHeaderCell">Controles </asp:TableHeaderCell>
            </asp:TableHeaderRow>

            <asp:TableRow ID="TableRow1" runat="server">

                <asp:TableCell CssClass="TableCell">
                    Auto Generated
                </asp:TableCell>

                <asp:TableCell ID="TableCell1" runat="server" CssClass="TableCell">
                    <asp:DropDownList ID="DDLChallengeID" runat="server"></asp:DropDownList>
                </asp:TableCell>

                <asp:TableCell ID="TableCell2" runat="server" CssClass="TableCell" ViewStateMode="Enabled">
                    <asp:TextBox CssClass="txtBox" ID="TextBoxQues" runat="server" placeholder="Question..."></asp:TextBox>
                </asp:TableCell>

                <asp:TableCell ID="TableCell4" runat="server" CssClass="TableCell">
                    <asp:TextBox CssClass="txtBox" ID="TextBoxAns1" runat="server" placeholder=" Ans 1... "></asp:TextBox>
                </asp:TableCell>

                <asp:TableCell ID="TableCell5" runat="server" CssClass="TableCell">
                    <asp:TextBox CssClass="txtBox" ID="TextBoxAns2" runat="server" placeholder=" Ans 2... "></asp:TextBox>
                </asp:TableCell>

                <asp:TableCell ID="TableCell6" runat="server" CssClass="TableCell">
                    <asp:TextBox CssClass="txtBox" ID="TextBoxAns3" runat="server" placeholder=" Ans 3... "></asp:TextBox>
                </asp:TableCell>

                <asp:TableCell ID="TableCell7" runat="server" CssClass="TableCell">
                    <asp:TextBox CssClass="txtBox" ID="TextBoxAns4" runat="server" placeholder=" Ans 4... "></asp:TextBox>
                </asp:TableCell>

                <asp:TableCell ID="TableCell3" runat="server" CssClass="TableCell">
                    <asp:TextBox CssClass="txtBox" ID="TextBoxCorrectAns" runat="server" placeholder=" Correct Ans... "></asp:TextBox>
                </asp:TableCell>

                <asp:TableCell CssClass="TableCell">
                    <asp:Button ID="btnAdd" CssClass="button" Text="ADD" OnClick="btnAdd_Click" OnClientClick="return validate();" runat="server"></asp:Button>
                </asp:TableCell>

            </asp:TableRow>

        </asp:Table>

        <div id="divResponce" runat="server">
            <h1 id="result" class="heading" runat="server"></h1>
        </div>

    </div>




    <script type="text/javascript">
        document.getElementById("question").style.width = "190px";
        document.getElementById("<% =DDLChallengeID.ClientID %>").focus();

    </script>
</asp:Content>
