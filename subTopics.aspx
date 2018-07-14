<%@ Page Title="" Language="C#" MasterPageFile="~/NestedMasterPageAdmin.master" AutoEventWireup="true" CodeBehind="subTopics.aspx.cs" Inherits="SkillBee.subTopics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <link href="Styles/addTopics.css" rel="stylesheet" />

    
    <style type="text/css">

        .container {
            width: 1100px;
        }

    </style>

    <script type="text/javascript">

        function validate() {
            var SubTopicHeading = document.getElementById("<% =TextBoxSubTopicHeading.ClientID %>");
            var TopicID = document.getElementById("<% =DDLTopicID.ClientID %>");
            var Display = document.getElementById("<% =TextBoxDisplay.ClientID %>");

            if (TopicID.value.length == 0) {
                TopicID.style.boxShadow = "0px 0px 5px 2px #F20";
                SubTopicHeading.style.boxShadow = "";
                Display.style.boxShadow = "";

                TopicID.focus();
                return false;
            }
            else if (SubTopicHeading.value.length == 0) {
                SubTopicHeading.style.boxShadow = "0px 0px 5px 2px #F20";
                TopicID.style.boxShadow = "";
                Display.style.boxShadow = "";

                SubTopicHeading.focus();
                return false
            }
            else if (Display.value.length == 0) {
                Display.style.boxShadow = "0px 0px 5px 2px #F20";
                TopicID.style.boxShadow = "";
                SubTopicHeading.style.boxShadow = "";

                Display.focus();
                return false;
            }
            else if (isNaN(Display.value)) {
                Display.style.boxShadow = "0px 0px 5px 2px #F20";
                TopicID.style.boxShadow = "";
                SubTopicHeading.style.boxShadow = "";

                Display.focus();
                return false;
            }


        }

        function EditFunction() {

            var SubTopicHeading = document.getElementById("<% =TextBoxSubTopicHeading.ClientID %>" + "E");
            var Display = document.getElementById("<% =TextBoxDisplay.ClientID %>" + "E");
            var TopicID = document.getElementById("<% =DDLTopicID.ClientID %>" + "E");
            var SubTopicImg = document.getElementById("<% =TextBoxSubTopicImg.ClientID %>" + "E");

            if (SubTopicHeading.value.length == 0) {
                SubTopicHeading.style.boxShadow = "0px 0px 5px 2px #F20";
                Display.style.boxShadow = "";

                SubTopicHeading.focus();
                return false
            }
            else if (Display.value.length == 0) {
                Display.style.boxShadow = "0px 0px 5px 2px #F20";
                SubTopicHeading.style.boxShadow = "";

                Display.focus();
                return false
            } else if (isNaN(Display.value)) {
                Display.style.boxShadow = "0px 0px 5px 2px #F20";
                SubTopicHeading.style.boxShadow = "";

                Display.focus();
                return false;
            }

            document.getElementById("<% =Event.ClientID %>").value = "edit";
            document.getElementById("<% =SubTopicHeading.ClientID %>").value = SubTopicHeading.value;
            document.getElementById("<% =Display.ClientID %>").value = Display.value;
            document.getElementById("<% =SubTopicImg.ClientID %>").value = SubTopicImg.value;
            document.getElementById("<% =TopicID.ClientID %>").value = TopicID.value;

        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <asp:HiddenField runat="server" ID="SubTopicID" />
        <asp:HiddenField runat="server" ID="SubTopicHeading" />
        <asp:HiddenField runat="server" ID="SubTopicImg" />
        <asp:HiddenField runat="server" ID="Display" />
        <asp:HiddenField runat="server" ID="TopicID" />
        <asp:HiddenField runat="server" ID="Event" />

        <div class="heading">
            Sub-Topics
        </div>
        <hr />
        <asp:Label ID="LblResult" runat="server"></asp:Label>
        <asp:Table ID="TableTopic" runat="server" ViewStateMode="Enabled">
            <asp:TableHeaderRow ID="TableHeaderRow1" CssClass="TableHeader" runat="server" ViewStateMode="Enabled">
                <asp:TableHeaderCell ID="TableHeaderCell1" runat="server" CssClass="TableHeaderCell">#ID</asp:TableHeaderCell>
                <asp:TableHeaderCell ID="TableHeaderCell2" runat="server" CssClass="TableHeaderCell">Topics Name</asp:TableHeaderCell>
                <asp:TableHeaderCell ID="TableHeaderCell6" runat="server" CssClass="TableHeaderCell">Sub-Topic Heading</asp:TableHeaderCell>
                <asp:TableHeaderCell ID="TableHeaderCell3" runat="server" CssClass="TableHeaderCell">Sub-Topic Img</asp:TableHeaderCell>
                <asp:TableHeaderCell ID="TableHeaderCell4" runat="server" CssClass="TableHeaderCell">Display</asp:TableHeaderCell>
                <asp:TableHeaderCell ID="TableHeaderCell5" runat="server" CssClass="TableHeaderCell">Controls </asp:TableHeaderCell>
            </asp:TableHeaderRow>

            <asp:TableRow ID="TableRow1" runat="server">

                <asp:TableCell CssClass="TableCell">
                    Auto Generated
                </asp:TableCell>

                <asp:TableCell ID="TableCell1" runat="server" CssClass="TableCell">
                    <%--<asp:TextBox CssClass="txtBox" ID="TextBoxTopicID" runat="server" placeholder="Topic ID..."></asp:TextBox>--%>
                    <asp:DropDownList ID="DDLTopicID" runat="server"></asp:DropDownList>
                </asp:TableCell>

                <asp:TableCell ID="TableCell2" runat="server" CssClass="TableCell" ViewStateMode="Enabled">
                    <asp:TextBox CssClass="txtBox" ID="TextBoxSubTopicHeading" runat="server" placeholder="Sub-Topic Heading..."></asp:TextBox>
                </asp:TableCell>

                <asp:TableCell ID="TableCell3" runat="server" CssClass="TableCell">
                    <asp:FileUpload ID="TextBoxSubTopicImg" runat="server" Style="width: 200px;" CssClass="txtBox" placeholder="Sub-Topic Img... " />
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
        document.getElementById("subTopics").style.width = "190px";
        document.getElementById("<% =DDLTopicID.ClientID %>").focus();

    </script>
</asp:Content>
