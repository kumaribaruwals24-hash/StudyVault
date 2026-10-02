<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AdminAccess.aspx.cs"
    Inherits="STUDYVAULT.AdminAccess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Admin Access | STUDYVAULT</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Segoe UI", Inter, Arial, sans-serif;
            background: #eef4f8;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 25px;
            color: #101827;
        }

        .container {
            width: 100%;
            max-width: 900px;
            min-height: 560px;
            background: white;
            border-radius: 30px;
            overflow: hidden;
            display: grid;
            grid-template-columns: 45% 55%;
            box-shadow: 0 24px 65px rgba(15,35,55,.13);
        }

        /* LEFT */

        .left {
            background: linear-gradient(145deg, #dff2ff, #d3ebfa);
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 45px;
            position: relative;
            overflow: hidden;
        }

        .circle {
            position: absolute;
            width: 220px;
            height: 220px;
            border-radius: 50%;
            background: rgba(255,255,255,.55);
            top: -80px;
            left: -80px;
        }

        .circle2 {
            position: absolute;
            width: 180px;
            height: 180px;
            border-radius: 50%;
            background: rgba(255,255,255,.45);
            bottom: -70px;
            right: -60px;
        }

        .left-content {
            position: relative;
            z-index: 2;
        }

        .admin-icon {
            width: 105px;
            height: 105px;
            border-radius: 50%;
            background: white;
            margin: 0 auto 25px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 42px;
            box-shadow: 0 15px 30px rgba(45,108,145,.12);
        }

        .left h2 {
            font-size: 28px;
            margin-bottom: 12px;
        }

        .left p {
            font-size: 13px;
            line-height: 1.7;
            color: #667381;
        }

        /* RIGHT */

        .right {
            display: flex;
            align-items: center;
            padding: 55px;
        }

        .form-box {
            width: 100%;
            max-width: 390px;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 42px;
        }

        .brand-logo {
            width: 27px;
            height: 27px;
            border-radius: 50%;
            background: #168fe5;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 13px;
            font-weight: 700;
        }

        .brand-name {
            font-size: 18px;
            font-weight: 750;
        }

        .eyebrow {
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 1.5px;
            color: #7b8491;
            margin-bottom: 11px;
        }

        h1 {
            font-size: 38px;
            line-height: 1.1;
            margin-bottom: 14px;
        }

        .dot {
            color: #168fe5;
        }

        .description {
            color: #6c7582;
            font-size: 13px;
            line-height: 1.6;
            margin-bottom: 28px;
        }

        label {
            display: block;
            font-size: 13px;
            font-weight: 650;
            color: #374151;
            margin-bottom: 8px;
        }

        .code-input {
            width: 100%;
            height: 48px;
            border: 1px solid #e4e9ef;
            border-radius: 11px;
            background: #f8fafc;
            padding: 0 15px;
            font-family: inherit;
            font-size: 15px;
            letter-spacing: 1px;
            margin-bottom: 18px;
        }

        .code-input:focus {
            outline: none;
            border-color: #168fe5;
            box-shadow: 0 0 0 3px rgba(22,143,229,.10);
            background: white;
        }

        .access-btn {
            width: 100%;
            height: 48px;
            border: none;
            border-radius: 11px;
            background: #168fe5;
            color: white;
            font-family: inherit;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
        }

        .access-btn:hover {
            background: #087dcc;
        }

        .message {
            display: block;
            text-align: center;
            color: #d92d20;
            font-size: 12px;
            margin-top: 13px;
        }

        .back {
            text-align: center;
            margin-top: 20px;
            font-size: 13px;
            color: #7b8491;
        }

        .back a {
            color: #168fe5;
            font-weight: 700;
        }

        @media(max-width:750px) {

            .container {
                grid-template-columns: 1fr;
                max-width: 520px;
            }

            .left {
                min-height: 230px;
                padding: 30px;
            }

            .admin-icon {
                width: 75px;
                height: 75px;
                font-size: 30px;
                margin-bottom: 15px;
            }

            .left h2 {
                font-size: 24px;
            }

            .left p {
                display: none;
            }

            .right {
                padding: 40px 30px;
            }
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

    <div class="container">

        <!-- LEFT -->

        <div class="left">

            <div class="circle"></div>
            <div class="circle2"></div>

            <div class="left-content">

                <div class="admin-icon">
                    🔐
                </div>

                <h2>
                    Admin Access
                </h2>

                <p>
                    This area is for StudyVault administrator
                    account setup and management.
                </p>

            </div>

        </div>


        <!-- RIGHT -->

        <div class="right">

            <div class="form-box">

                <div class="brand">

                    <div class="brand-logo">
                        S
                    </div>

                    <div class="brand-name">
                        STUDYVAULT.
                    </div>

                </div>


                <div class="eyebrow">
                    ADMINISTRATION
                </div>


                <h1>
                    Enter access code<span class="dot">.</span>
                </h1>


                <p class="description">
                    Enter the administrator setup code to continue
                    to the StudyVault admin setup page.
                </p>


                <label>
                    Access Code
                </label>


                <asp:TextBox
                    ID="txtAccessCode"
                    runat="server"
                    TextMode="Password"
                    CssClass="code-input"
                    placeholder="Enter access code">
                </asp:TextBox>


                <asp:Button
                    ID="btnAccess"
                    runat="server"
                    Text="Continue"
                    CssClass="access-btn"
                    OnClick="btnAccess_Click" />


                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="message">
                </asp:Label>


                <div class="back">

                    <a href="Login.aspx">
                        ← Back to Login
                    </a>

                </div>

            </div>

        </div>

    </div>

</form>

</body>

</html>