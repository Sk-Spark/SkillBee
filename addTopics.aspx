<%@ Page Title="" Language="C#" Trace="true" MasterPageFile="~/NestedMasterPageAdmin.master" AutoEventWireup="true" CodeBehind="addTopics.aspx.cs" Inherits="SkillBee.addTopics" %>

<asp:Content ID="Head1" ContentPlaceHolderID="head" runat="server">

    <link href="Styles/addTopics.css" rel="stylesheet" />

    <style type="text/css">

        .container {
            width: 1030px;
        }

    </style>

    <script type="text/javascript">

        function validate()
        {
            var TopicName = document.getElementById("<% =TextBoxTopicName.ClientID %>");
            var TopicID = document.getElementById("<% =TextBoxTopicID.ClientID %>");
            var Display = document.getElementById("<% =TextBoxDisplay.ClientID %>");

            if (TopicName.value.length == 0)
            {
                TopicName.style.boxShadow = "0px 0px 5px 2px #F20";
                TopicID.style.boxShadow = "";
                Display.style.boxShadow = "";

                TopicName.focus();
                return false
            }
            else if(TopicID.value.length == 0)
            {
                TopicID.style.boxShadow = "0px 0px 5px 2px #F20";
                TopicName.style.boxShadow = "";
                Display.style.boxShadow = "";

                TopicID.focus();
                return false;
            }
            else if (Display.value.length == 0) {
                Display.style.boxShadow = "0px 0px 5px 2px #F20";
                TopicID.style.boxShadow = "";
                TopicName.style.boxShadow = "";

                Display.focus();
                return false;
            }
            else if (isNaN(Display.value))
            {
                Display.style.boxShadow = "0px 0px 5px 2px #F20";
                TopicID.style.boxShadow = "";
                TopicName.style.boxShadow = "";

                Display.focus();
                return false;
            }


        }

        function EditFunction()
        {

            var Name = document.getElementById("<% =TextBoxTopicName.ClientID %>"+"E");
            var PageID = document.getElementById("<% =TextBoxTopicID.ClientID %>" + "E");
            var Display = document.getElementById("<% =TextBoxDisplay.ClientID %>" + "E");

            if (Name.value.length == 0)
            {
                Name.style.boxShadow = "0px 0px 5px 2px #F20";
                PageID.style.boxShadow = "";
                Display.style.boxShadow = "";

                Name.focus();
                return false
            }
            else if (PageID.value.length == 0)
            {
                PageID.style.boxShadow = "0px 0px 5px 2px #F20";
                Name.style.boxShadow = "";
                Display.style.boxShadow = "";

                PageID.focus();
                return false
            }
            else if (Display.value.length == 0)
            {
                Display.style.boxShadow = "0px 0px 5px 2px #F20";
                Name.style.boxShadow = "";
                PageID.style.boxShadow = "";

                Display.focus();
                return false
            }

            document.getElementById("<% =TopicName.ClientID %>").value = Name.value;
            document.getElementById("<% =PageID.ClientID %>").value = PageID.value;
            document.getElementById("<% =Display.ClientID %>").value = Display.value;
            document.getElementById("<% =Event.ClientID %>").value = "edit";

        }

    </script>
    
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">

        <asp:HiddenField runat="server" ID="TopicName" />
        <asp:HiddenField runat="server" ID="PageID" />
        <asp:HiddenField runat="server" ID="Display" />
        <asp:HiddenField runat="server" ID="TopicID" />
        <asp:HiddenField runat="server" ID="Event" />

        <div class="heading">
                 Topics
            </div>
            <hr />
        <asp:Label ID="LblResult" runat="server"></asp:Label>
        <asp:Table ID="TableTopic" runat="server">
            <asp:TableHeaderRow cssclass="TableHeader" runat="server">
                <asp:TableHeaderCell runat="server" cssclass="TableHeaderCell" >#ID</asp:TableHeaderCell>
                <asp:TableHeaderCell runat="server" cssclass="TableHeaderCell" >Current Topics</asp:TableHeaderCell>
                <asp:TableHeaderCell runat="server" cssclass="TableHeaderCell" >Page ID</asp:TableHeaderCell>
                <asp:TableHeaderCell runat="server" cssclass="TableHeaderCell" >Display</asp:TableHeaderCell>
                <asp:TableHeaderCell runat="server" cssclass="TableHeaderCell" >Controls </asp:TableHeaderCell>
            </asp:TableHeaderRow>

            <asp:TableRow runat="server">

                <asp:TableCell CssClass="TableCell">
                    Auto Generated
                </asp:TableCell>

                <asp:TableCell runat="server" CssClass="TableCell">
                     <asp:TextBox CssClass="txtBox" ID="TextBoxTopicName" runat="server" placeholder="Topic Name..."></asp:TextBox>
                </asp:TableCell>

                <asp:TableCell runat="server" CssClass="TableCell">
                        <asp:TextBox CssClass="txtBox" ID="TextBoxTopicID" runat="server" placeholder="Topic ID..."></asp:TextBox>                     
                </asp:TableCell>

                <asp:TableCell runat="server" CssClass="TableCell">
                        <asp:TextBox CssClass="txtBox" ID="TextBoxDisplay" runat="server" placeholder=" '0' OR '1'... "></asp:TextBox>                     
                </asp:TableCell>

                <asp:TableCell CssClass="TableCell">
                    <asp:Button ID="btnAdd" CssClass="button" Text="ADD" OnClick="btnAdd_Click" OnClientClick="return validate();" runat="server" ></asp:Button>
                </asp:TableCell>

            </asp:TableRow>


        </asp:Table>
        
         <div id="divResponce" runat="server">
            <h1 id="result" class="heading" runat="server"></h1>
        </div>

    </div>


    <script type="text/javascript">
        document.getElementById("addTopics").style.width = "190px";
        //document.getElementById("addTopics").style.background = "rgb(16, 16, 16) -moz-linear-gradient(left center , transparent, rgba(0, 102, 255, 0.5), transparent) repeat scroll 0% 0%";
    </script>
</asp:Content>

<%--<asp:TextBox CssClass="txtBox" ID="TextBoxTopicName" runat="server" placeholder="Topic Name..." required="reduired"></asp:TextBox>
        <asp:TextBox CssClass="txtBox" ID="TextBoxTopicID" runat="server" placeholder="Topic ID..." required="reduired" TextMode="Password"></asp:TextBox>
        <asp:Button CssClass="button" ID="btnSubmit" runat="server" Text="ADD Topic" />--%>
