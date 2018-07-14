<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Results.aspx.cs" Inherits="SkillBee.Results" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        #Content {
            margin-top: 60px;
            background-color: #D5D5D5;
        }

        #DivResult {
            width: 60%;
            margin: 0px auto;
            padding-top: 50px;
        }

        #DivHeading {
            text-align: center;
            font-family: Lucida;
            font-style: italic;
            color: #2b83e6;
            font-size: 23px;
        }

        .GVResult {
        }

            .GVResult th {
                background-color: #1929a1;
                width: 33%;
                line-height: 45px;
                border: 2px solid #1688C6;
                color: #FFF;
                font-size: 25px;
                font-family: Arial Rounded MT;
                font-style: italic;
            }

            .GVResult td {
                border: 2px solid #1688C6;
                color: #fff;
                background-color: #09745A;
                text-align: center;
                line-height: 38px;
                padding: 5px 20px;
                font-size: 20px;
                font-family: Lucida Calligraphy;
            }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="DivResult">
        <div id="DivHeading">
            <h1>Your Result</h1>
        </div>
        <asp:GridView runat="server" ID="GVResult" CssClass="GVResult" AutoGenerateColumns="False" GridLines="None">
            <Columns>
                <asp:BoundField DataField="ChallengeName" HeaderText="Challenge Name" />
                <asp:BoundField DataField="MarksObtain" HeaderText="Marks Obtain" />
                <asp:BoundField DataField="MaxMarks" HeaderText="Max Marks" />
            </Columns>

        </asp:GridView>
    </div>
</asp:Content>
