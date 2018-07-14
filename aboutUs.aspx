<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="aboutUs.aspx.cs" Inherits="SkillBee.aboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="Styles/aboutUs.css" rel="stylesheet" />

    <style type="text/css">
        .Contaner {
            width: 100%;
            min-height: 600px;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .left {
            float: left;
            height: 600px;
            width: 4px;
            margin-left: 300px;
            background: -moz-linear-gradient(top,rgba(0,102,255,0.7),rgba(0,0,0,0));
            margin-right: 10px;
        }

        .right {
            height: 60px;
            margin-left: 20.01%;
            color: rgba(12, 166, 200, 0.80);
            font-size: 38px;
            padding: 10px 0px 0px 22px;
            font-style: italic;
            font-family: Cambria;
        }

        .divRightBottom {
            height: 3px;
            margin-left: -10px;
            background: -moz-linear-gradient(left,rgba(0,0,0,0),rgba(0,102,255,0.7),rgba(0,0,0,0),rgba(0,0,0,0));
            margin-top: 10px;
        }

        .SpanRightText {
            margin-left: 224px;
            color: #31AA72;
        }

        #SpanContent {
            font-size: 24px;
            padding-left:5px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="gradiant">&nbsp;</div>

    <div class="Contaner">

        <div class="left">
            
            <img style="margin-left: -292px;" src="img/logo(288x500).png" />

        </div>
        <div class="right">
            <span class="SpanRightText">About US. . .</span>
            <div class="divRightBottom"></div>

            <span id="SpanContent">The website “SKILL BEE” provides facility to the user to test their knowledge in a subject in a simple manner. 
                <br />
                In this system user can register itself by paying a small amount to the owner of site.                         
                <br />
                When user registers itself, it can choose its interested course and related subject to test its skills in that subject through just one click.<br />
                 This website provides an easy and fast method to retrieve our knowledge and test our skills.<br />
                 The key goal of the site is to save user’s manpower time and money also.<br />
            </span>
        </div>

    </div>


</asp:Content>

