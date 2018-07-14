<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPageAdmin.master" AutoEventWireup="true" Trace="true" CodeBehind="addChallenges.aspx.cs" Inherits="SkillBee.addChallenges" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">

    <link href="Styles/addTopics.css" rel="stylesheet" />

    <style type="text/css">
       
        .container {
            width: 1030px;
        }

    </style>
    
    <script type="text/javascript">

        function validate() {
            var Heading1 = document.getElementById("<% =TextBoxHeading1.ClientID %>");
            var Heading2 = document.getElementById("<% =TextBoxHeading2.ClientID %>");
            var SubTopicID = document.getElementById("<% =DDLSubTopicID.ClientID %>");
            var Display = document.getElementById("<% =TextBoxDisplay.ClientID %>");

            if (Heading1.value.length == 0) {
                Heading1.style.boxShadow = "0px 0px 5px 2px #F20";
                Heading2.style.boxShadow = "";
                Display.style.boxShadow = "";

                Heading1.focus();
                return false;
            }
            else if (Heading2.value.length == 0) {
                Heading2.style.boxShadow = "0px 0px 5px 2px #F20";
                Heading1.style.boxShadow = "";
                Display.style.boxShadow = "";

                Heading2.focus();
                return false
            }
            else if (Display.value.length == 0) {
                Display.style.boxShadow = "0px 0px 5px 2px #F20";
                Heading1.style.boxShadow = "";
                Heading2.style.boxShadow = "";

                Display.focus();
                return false;
            }
            else if (isNaN(Display.value)) {
                Display.style.boxShadow = "0px 0px 5px 2px #F20";
                Heading1.style.boxShadow = "";
                Heading2.style.boxShadow = "";

                Display.focus();
                return false;
            }


        }

        function EditFunction() {

            var Heading1 = document.getElementById("<% =TextBoxHeading1.ClientID %>"+"E");
            var Heading2 = document.getElementById("<% =TextBoxHeading2.ClientID %>"+"E");
            var Display = document.getElementById("<% =TextBoxDisplay.ClientID %>" + "E");
            var SubTopicID = document.getElementById("ContentPlaceHolder1_ContentPlaceHolder1_DDLSubTopicNameE");

            if (Heading1.value.length == 0) {
                Heading1.style.boxShadow = "0px 0px 5px 2px #F20";
                Heading2.style.boxShadow = "";
                Display.style.boxShadow = "";

                Heading1.focus();
                return false
            }
            else if (Heading2.value.length == 0) {
                Heading2.style.boxShadow = "0px 0px 5px 2px #F20";
                Heading1.style.boxShadow = "";
                Display.style.boxShadow = "";

                Heading2.focus();
                return false
            }
        else if (Display.value.length == 0) {
                Display.style.boxShadow = "0px 0px 5px 2px #F20";
                Heading1.style.boxShadow = "";
                Heading2.style.boxShadow = "";

                Display.focus();
                return false
            } else if (isNaN(Display.value)) {
                Display.style.boxShadow = "0px 0px 5px 2px #F20";
                Heading1.style.boxShadow = "";
                Heading2.style.boxShadow = "";

                Display.focus();
                return false;
            }

            document.getElementById("<% =Event.ClientID %>").value = "edit";
            document.getElementById("<% =SubTopicID.ClientID %>").value = SubTopicID.value;
            document.getElementById("<% =Display.ClientID %>").value = Display.value;
            document.getElementById("<% =Heading1.ClientID %>").value = Heading1.value;
            document.getElementById("<% =Heading2.ClientID %>").value = Heading2.value;

        }

    </script>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <asp:HiddenField runat="server" ID="SubTopicID" />
        <asp:HiddenField runat="server" ID="Heading1" />
        <asp:HiddenField runat="server" ID="Heading2" />
        <asp:HiddenField runat="server" ID="Display" />
        <asp:HiddenField runat="server" ID="Challange" />
        <asp:HiddenField runat="server" ID="Event" />

        <div class="heading">
            Challenges
        </div>
        <hr />
        <asp:Label ID="LblResult" runat="server"></asp:Label>
        <asp:Table ID="TableTopic" runat="server" ViewStateMode="Enabled">
            <asp:TableHeaderRow ID="TableHeaderRow1" CssClass="TableHeader" runat="server" ViewStateMode="Enabled">
                <asp:TableHeaderCell ID="TableHeaderCell1" runat="server" CssClass="TableHeaderCell">#ID</asp:TableHeaderCell>
                <asp:TableHeaderCell ID="TableHeaderCell2" runat="server" CssClass="TableHeaderCell">Sub-Topics Name</asp:TableHeaderCell>
                <asp:TableHeaderCell ID="TableHeaderCell6" runat="server" CssClass="TableHeaderCell">Heading1</asp:TableHeaderCell>
                <asp:TableHeaderCell ID="TableHeaderCell3" runat="server" CssClass="TableHeaderCell">Heading2</asp:TableHeaderCell>
                <asp:TableHeaderCell ID="TableHeaderCell4" runat="server" CssClass="TableHeaderCell">Display</asp:TableHeaderCell>
                <asp:TableHeaderCell ID="TableHeaderCell5" runat="server" CssClass="TableHeaderCell">Controls </asp:TableHeaderCell>
            </asp:TableHeaderRow>

            <asp:TableRow ID="TableRow1" runat="server">

                <asp:TableCell CssClass="TableCell">
                    Auto Generated
                </asp:TableCell>

                <asp:TableCell ID="TableCell1" runat="server" CssClass="TableCell">
                    <asp:DropDownList ID="DDLSubTopicID" runat="server"></asp:DropDownList>
                </asp:TableCell>

                <asp:TableCell ID="TableCell2" runat="server" CssClass="TableCell" ViewStateMode="Enabled">
                    <asp:TextBox CssClass="txtBox" ID="TextBoxHeading1" runat="server" placeholder="Heading 1..."></asp:TextBox>
                </asp:TableCell>

                <asp:TableCell ID="TableCell3" runat="server" CssClass="TableCell">
                    <asp:TextBox CssClass="txtBox" ID="TextBoxHeading2" runat="server" placeholder="Heading 2..."></asp:TextBox>
                </asp:TableCell>

                <asp:TableCell ID="TableCell4" runat="server" CssClass="TableCell">
                    <asp:TextBox CssClass="txtBox" ID="TextBoxDisplay" runat="server" placeholder=" '0' OR '1' ... "></asp:TextBox>
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
        document.getElementById("challenges").style.width = "190px";
        document.getElementById("<% =DDLSubTopicID.ClientID %>").focus();

    </script>
</asp:Content>

