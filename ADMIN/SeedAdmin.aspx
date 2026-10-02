<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="SeedAdmin.aspx.cs"
    Inherits="STUDYVAULT.SeedAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Create Admin Account | STUDYVAULT</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: #eef4f8;
            min-height: 100vh;
            color: #172033;
        }

        /* =========================================
           MAIN CONTAINER
        ========================================= */

        .page {
            min-height: 100vh;
            padding: 28px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            width: 100%;
            max-width: 1240px;
            min-height: 720px;

            display: grid;
            grid-template-columns: 48% 52%;

            background: #ffffff;
            border-radius: 30px;
            overflow: hidden;

            box-shadow:
                0 30px 80px rgba(35, 67, 92, 0.12);
        }


        /* =========================================
           LEFT SIDE
        ========================================= */

        .left {
            padding: 48px 70px 45px;
            background: #ffffff;

            display: flex;
            flex-direction: column;
            justify-content: center;
        }


        /* BRAND */

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

            box-shadow:
                0 6px 18px rgba(22,143,229,.25);
        }

        .brand-name {
            font-size: 18px;
            font-weight: 750;
            letter-spacing: -.4px;
        }


        /* HEADING */

        .eyebrow {
            font-size: 12px;
            font-weight: 750;
            letter-spacing: 1.5px;
            color: #94a3b2;

            margin-bottom: 9px;
        }

        .heading {
            font-size: 43px;
            line-height: 1.05;
            letter-spacing: -2px;

            font-weight: 750;

            color: #101827;

            margin-bottom: 12px;
        }

        .heading-dot {
            color: #168fe5;
        }

        .description {
            max-width: 430px;

            font-size: 14px;
            line-height: 1.65;

            color: #8794a2;

            margin-bottom: 25px;
        }


        /* =========================================
           FORM
        ========================================= */

        .form {
            width: 100%;
            max-width: 500px;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 14px;
        }

        .group {
            margin-bottom: 14px;
        }

        .label {
            display: block;

            font-size: 12px;
            font-weight: 650;

            color: #68798b;

            margin-bottom: 7px;
        }

        .input-wrapper {
            position: relative;
        }

        .input {
            width: 100%;
            height: 48px;

            padding: 0 15px;

            border: 1px solid #e1e8ef;
            border-radius: 11px;

            background: #f8fafc;

            color: #172033;

            font-size: 13px;

            outline: none;

            transition: .2s ease;
        }

        .input:hover {
            border-color: #cbd7e2;
        }

        .input:focus {
            border-color: #168fe5;
            background: #ffffff;

            box-shadow:
                0 0 0 4px rgba(22,143,229,.09);
        }

        .input::placeholder {
            color: #b0bbc6;
        }


        /* VALIDATION */

        .validator {
            display: block;

            color: #df4b4b;

            font-size: 10.5px;

            margin-top: 4px;
        }


        /* PASSWORD HINT */

        .password-hint {
            display: flex;
            align-items: center;
            gap: 7px;

            margin-top: 6px;

            font-size: 10.5px;
            line-height: 1.4;

            color: #9aa6b2;
        }

        .hint-dot {
            width: 6px;
            height: 6px;

            flex-shrink: 0;

            border-radius: 50%;

            background: #168fe5;
        }


        /* =========================================
           BUTTONS
        ========================================= */

        .buttons {
            display: grid;

            grid-template-columns: 1fr 105px;

            gap: 12px;

            margin-top: 8px;
        }

        .create-button {
            width: 100%;
            height: 49px;

            border: none;
            border-radius: 11px;

            background: #168fe5;

            color: #ffffff;

            font-size: 13px;
            font-weight: 700;

            cursor: pointer;

            transition: .25s ease;

            box-shadow:
                0 8px 22px rgba(22,143,229,.22);
        }

        .create-button:hover {
            background: #087dcc;

            transform: translateY(-1px);

            box-shadow:
                0 12px 25px rgba(22,143,229,.28);
        }

        .clear-button {
            width: 100%;
            height: 49px;

            border: none;
            border-radius: 11px;

            background: #f1f4f7;

            color: #68798a;

            font-size: 13px;
            font-weight: 650;

            cursor: pointer;

            transition: .2s ease;
        }

        .clear-button:hover {
            background: #e6ebf0;
        }


        /* RESULT */

        .result {
            display: block;

            margin-top: 13px;

            padding: 10px 13px;

            border-radius: 9px;

            font-size: 12px;
            font-weight: 600;
        }


        /* =========================================
           RIGHT SIDE
        ========================================= */

        .right {
            position: relative;

            overflow: hidden;

            background:
                linear-gradient(
                    145deg,
                    #eaf7fc 0%,
                    #d8edf5 45%,
                    #edf8fb 100%
                );

            display: flex;
            align-items: center;
            justify-content: center;
        }


        /* DECORATIVE CIRCLES */

        .circle-one {
            position: absolute;

            width: 450px;
            height: 450px;

            border-radius: 50%;

            background: rgba(255,255,255,.68);

            top: -230px;
            right: -150px;
        }

        .circle-two {
            position: absolute;

            width: 350px;
            height: 350px;

            border-radius: 50%;

            background: rgba(255,255,255,.4);

            bottom: -190px;
            left: -130px;
        }


        /* VISUAL CONTENT */

        .visual {
            position: relative;
            z-index: 3;

            width: 80%;

            text-align: center;
        }


        /* ILLUSTRATION */

        .illustration {
            position: relative;

            width: 100%;
            max-width: 430px;

            height: 310px;

            margin: 0 auto 30px;

            overflow: hidden;

            border-radius: 30px;

            background:
                linear-gradient(
                    160deg,
                    #d9f2fa,
                    #acd6e3
                );

            box-shadow:
                0 25px 50px rgba(48,94,115,.13);
        }


        /* SUN */

        .sun {
            position: absolute;

            width: 74px;
            height: 74px;

            border-radius: 50%;

            background: rgba(255,255,255,.86);

            top: 38px;
            right: 45px;
        }


        /* MOUNTAINS */

        .mountain-back {
            position: absolute;

            bottom: -25px;
            left: -80px;

            width: 0;
            height: 0;

            border-left: 190px solid transparent;
            border-right: 190px solid transparent;
            border-bottom: 205px solid #9ec6d2;
        }

        .mountain-main {
            position: absolute;

            bottom: -25px;
            left: 90px;

            width: 0;
            height: 0;

            border-left: 190px solid transparent;
            border-right: 190px solid transparent;
            border-bottom: 245px solid #75aabd;
        }

        .mountain-front {
            position: absolute;

            bottom: -35px;
            right: -100px;

            width: 0;
            height: 0;

            border-left: 210px solid transparent;
            border-right: 210px solid transparent;
            border-bottom: 220px solid #8cbac8;
        }


        /* LITTLE WHITE PEAK */

        .peak {
            position: absolute;

            width: 0;
            height: 0;

            border-left: 22px solid transparent;
            border-right: 22px solid transparent;
            border-bottom: 30px solid rgba(255,255,255,.65);

            bottom: 185px;
            left: 250px;
        }


        /* VISUAL TEXT */

        .visual-title {
            font-size: 27px;

            letter-spacing: -.7px;

            color: #163b52;

            font-weight: 750;

            margin-bottom: 10px;
        }

        .visual-description {
            max-width: 370px;

            margin: auto;

            font-size: 13px;

            line-height: 1.7;

            color: #718999;
        }


        /* SECURITY CARD */

        .security-card {
            display: inline-flex;

            align-items: center;

            gap: 10px;

            margin-top: 22px;

            padding: 10px 17px;

            border-radius: 30px;

            background: rgba(255,255,255,.72);

            box-shadow:
                0 8px 25px rgba(45,89,109,.08);

            font-size: 11.5px;

            color: #347e9f;

            font-weight: 700;
        }

        .security-icon {
            width: 20px;
            height: 20px;

            border-radius: 50%;

            display: flex;
            align-items: center;
            justify-content: center;

            background: #168fe5;

            color: white;

            font-size: 11px;
        }


        /* =========================================
           RESPONSIVE
        ========================================= */

        @media(max-width: 950px) {

            .page {
                padding: 15px;
            }

            .container {
                grid-template-columns: 1fr;

                max-width: 650px;

                min-height: auto;
            }

            .right {
                display: none;
            }

            .left {
                padding: 45px 45px;
            }

            .form {
                max-width: 100%;
            }
        }


        @media(max-width: 560px) {

            .page {
                padding: 8px;
            }

            .container {
                border-radius: 20px;
            }

            .left {
                padding: 32px 22px;
            }

            .brand {
                margin-bottom: 35px;
            }

            .heading {
                font-size: 35px;
                letter-spacing: -1.5px;
            }

            .form-row {
                grid-template-columns: 1fr;
                gap: 0;
            }

            .buttons {
                grid-template-columns: 1fr;
            }

            .description {
                font-size: 13px;
            }
        }

    </style>

</head>


<body>

<form id="form1" runat="server">

    <div class="page">

        <div class="container">


            <!-- =====================================
                 LEFT FORM
            ====================================== -->

            <section class="left">


                <!-- BRAND -->

                <div class="brand">

                    <div class="brand-logo"></div>

                    <span class="brand-name">
                        STUDYVAULT.
                    </span>

                </div>


                <!-- HEADING -->

                <div class="eyebrow">
                    ADMINISTRATION
                </div>

                <h1 class="heading">

                    Create admin<br />

                    account<span class="heading-dot">.</span>

                </h1>

                <p class="description">

                    Set up a secure administrator account
                    to manage the STUDYVAULT learning platform.

                </p>


                <!-- FORM -->

                <div class="form">


                    <!-- NAME -->

                    <div class="form-row">

                        <div class="group">

                            <asp:Label
                                ID="lblFullName"
                                runat="server"
                                Text="Full Name"
                                CssClass="label" />

                            <div class="input-wrapper">

                                <asp:TextBox
                                    ID="txtFullName"
                                    runat="server"
                                    CssClass="input"
                                    placeholder="Administrator name"
                                    MaxLength="100" />

                            </div>

                            <asp:RequiredFieldValidator
                                ID="rfvFullName"
                                runat="server"
                                ControlToValidate="txtFullName"
                                ErrorMessage="Full name is required."
                                CssClass="validator"
                                Display="Dynamic" />

                            <asp:RegularExpressionValidator
                                ID="revFullName"
                                runat="server"
                                ControlToValidate="txtFullName"
                                ValidationExpression="^[A-Za-z ]{2,100}$"
                                ErrorMessage="Use letters and spaces only."
                                CssClass="validator"
                                Display="Dynamic" />

                        </div>


                        <!-- EMAIL -->

                        <div class="group">

                            <asp:Label
                                ID="lblEmail"
                                runat="server"
                                Text="Email Address"
                                CssClass="label" />

                            <asp:TextBox
                                ID="txtEmail"
                                runat="server"
                                CssClass="input"
                                TextMode="Email"
                                placeholder="admin@studyvult.com"
                                MaxLength="150" />

                            <asp:RequiredFieldValidator
                                ID="rfvEmail"
                                runat="server"
                                ControlToValidate="txtEmail"
                                ErrorMessage="Email is required."
                                CssClass="validator"
                                Display="Dynamic" />

                            <asp:RegularExpressionValidator
                                ID="revEmail"
                                runat="server"
                                ControlToValidate="txtEmail"
                                ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                                ErrorMessage="Enter a valid email."
                                CssClass="validator"
                                Display="Dynamic" />

                        </div>

                    </div>


                    <!-- PASSWORD -->

                    <div class="group">

                        <asp:Label
                            ID="lblPassword"
                            runat="server"
                            Text="Password"
                            CssClass="label" />

                        <asp:TextBox
                            ID="txtPassword"
                            runat="server"
                            CssClass="input"
                            TextMode="Password"
                            placeholder="Create a strong password"
                            MaxLength="100" />

                        <asp:RequiredFieldValidator
                            ID="rfvPassword"
                            runat="server"
                            ControlToValidate="txtPassword"
                            ErrorMessage="Password is required."
                            CssClass="validator"
                            Display="Dynamic" />

                        <div class="password-hint">

                            <span class="hint-dot"></span>

                            8+ characters · uppercase · lowercase · number · special character

                        </div>

                    </div>


                    <!-- CONFIRM PASSWORD -->

                    <div class="group">

                        <asp:Label
                            ID="lblConfirmPassword"
                            runat="server"
                            Text="Confirm Password"
                            CssClass="label" />

                        <asp:TextBox
                            ID="txtConfirmPassword"
                            runat="server"
                            CssClass="input"
                            TextMode="Password"
                            placeholder="Confirm your password"
                            MaxLength="100" />

                        <asp:RequiredFieldValidator
                            ID="rfvConfirmPassword"
                            runat="server"
                            ControlToValidate="txtConfirmPassword"
                            ErrorMessage="Please confirm your password."
                            CssClass="validator"
                            Display="Dynamic" />

                        <asp:CompareValidator
                            ID="cvPassword"
                            runat="server"
                            ControlToValidate="txtConfirmPassword"
                            ControlToCompare="txtPassword"
                            ErrorMessage="Passwords do not match."
                            CssClass="validator"
                            Display="Dynamic" />

                    </div>


                    <!-- BUTTONS -->

                    <div class="buttons">

                        <asp:Button
                            ID="btnCreate"
                            runat="server"
                            Text="Create Admin Account"
                            CssClass="create-button"
                            OnClick="btnCreate_Click" />

                        <asp:Button
                            ID="btnClear"
                            runat="server"
                            Text="Clear"
                            CssClass="clear-button"
                            CausesValidation="false"
                            OnClick="btnClear_Click" />

                    </div>


                    <!-- RESULT -->

                    <asp:Label
                        ID="lblResult"
                        runat="server"
                        CssClass="result" />

                </div>

            </section>



            <!-- =====================================
                 RIGHT VISUAL
            ====================================== -->

            <section class="right">

                <div class="circle-one"></div>
                <div class="circle-two"></div>


                <div class="visual">


                    <!-- ILLUSTRATION -->

                    <div class="illustration">

                        <div class="sun"></div>

                        <div class="peak"></div>

                        <div class="mountain-back"></div>

                        <div class="mountain-main"></div>

                        <div class="mountain-front"></div>

                    </div>


                    <!-- TEXT -->

                    <h2 class="visual-title">

                        Welcome to STUDYVAULT

                    </h2>


                    <p class="visual-description">

                        Create a secure administrator account
                        and manage users, resources, assignments
                        and learning content from one central dashboard.

                    </p>


                    <!-- SECURITY -->

                    <div class="security-card">

                        <div class="security-icon">
                            ✓
                        </div>

                        Secure Administrator Access

                    </div>

                </div>

            </section>


        </div>

    </div>

</form>

</body>

</html>