<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="STUDYVAULT.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>StudyVault Register</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: "Segoe UI", Inter, Arial, sans-serif;
            background: #eef4f8;
            color: #101827;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 28px;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        /* =========================================
           MAIN CONTAINER
        ========================================= */

        .container {
            width: 100%;
            max-width: 1240px;
            min-height: 720px;
            background: #ffffff;
            border-radius: 30px;
            overflow: hidden;
            display: grid;
            grid-template-columns: 48% 52%;
            box-shadow: 0 24px 65px rgba(15, 35, 55, 0.13);
        }


        /* =========================================
           LEFT - REGISTER FORM
        ========================================= */

        .left {
            background: #ffffff;
            padding: 48px 70px 45px;
            display: flex;
            align-items: center;
        }

        .form-content {
            width: 100%;
            max-width: 560px;
            margin: 0 auto;
        }


        /* BRAND */

        .brand {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 48px;
        }

        .brand-logo {
            width: 27px;
            height: 27px;
            border-radius: 50%;
            background: #168fe5;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 13px;
            font-weight: 700;
        }

        .brand-name {
            font-size: 18px;
            font-weight: 750;
            letter-spacing: .2px;
            color: #101827;
        }


        /* HEADING */

        .eyebrow {
            font-size: 12px;
            font-weight: 700;
            letter-spacing: 1.5px;
            color: #7b8491;
            margin-bottom: 12px;
        }

        .form-content h1 {
            font-size: 43px;
            line-height: 1.05;
            letter-spacing: -1.4px;
            color: #101827;
            margin-bottom: 17px;
        }

        .blue-dot {
            color: #168fe5;
        }

        .intro {
            font-size: 14px;
            line-height: 1.65;
            color: #6c7582;
            max-width: 470px;
            margin-bottom: 31px;
        }


        /* =========================================
           FORM
        ========================================= */

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 17px;
        }

        .field {
            margin-bottom: 18px;
        }

        .field label {
            display: block;
            font-size: 13px;
            font-weight: 650;
            color: #374151;
            margin-bottom: 8px;
        }

        .input-box {
            width: 100%;
            height: 48px;
            border: 1px solid #e4e9ef;
            border-radius: 11px;
            background: #f8fafc;
            padding: 0 15px;
            font-family: inherit;
            font-size: 14px;
            color: #101827;
            transition: .2s ease;
        }

        .input-box::placeholder {
            color: #9aa3af;
        }

        .input-box:focus {
            outline: none;
            border-color: #168fe5;
            box-shadow: 0 0 0 3px rgba(22, 143, 229, .10);
            background: #ffffff;
        }


        /* VALIDATION */

        .validator {
            display: block;
            color: #d92d20;
            font-size: 11px;
            margin-top: 5px;
        }


        /* PASSWORD NOTE */

        .password-note {
            display: flex;
            align-items: center;
            gap: 7px;
            color: #168fe5;
            font-size: 11px;
            margin-top: -7px;
            margin-bottom: 21px;
        }

        .password-note span {
            width: 6px;
            height: 6px;
            border-radius: 50%;
            background: #168fe5;
            display: inline-block;
        }


        /* REGISTER BUTTON */

        .register-btn {
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
            transition: .2s ease;
        }

        .register-btn:hover {
            background: #087dcc;
        }


        /* MESSAGE */

        .message {
            display: block;
            text-align: center;
            font-size: 12px;
            margin-top: 13px;
            color: #d92d20;
        }


        /* LOGIN LINK */

        .login-link {
            text-align: center;
            margin-top: 21px;
            font-size: 13px;
            color: #7b8491;
        }

        .login-link a {
            color: #168fe5;
            font-weight: 700;
            margin-left: 3px;
        }

        .login-link a:hover {
            text-decoration: underline;
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
                    #dff2ff 0%,
                    #eaf6fd 48%,
                    #d6ecfb 100%
                );
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 55px;
        }


        /* DECORATIVE CIRCLES */

        .circle-one {
            position: absolute;
            width: 280px;
            height: 280px;
            border-radius: 50%;
            background: rgba(255,255,255,.55);
            top: -120px;
            right: -85px;
        }

        .circle-two {
            position: absolute;
            width: 190px;
            height: 190px;
            border-radius: 50%;
            background: rgba(255,255,255,.42);
            bottom: -80px;
            left: -60px;
        }

        .circle-three {
            position: absolute;
            width: 90px;
            height: 90px;
            border-radius: 50%;
            background: rgba(255,255,255,.45);
            top: 90px;
            left: 45px;
        }


        /* WELCOME CONTENT */

        .welcome {
            position: relative;
            z-index: 2;
            width: 100%;
            max-width: 450px;
            text-align: center;
        }

        .illustration {
            width: 100%;
            max-width: 390px;
            height: 265px;
            margin: 0 auto 35px;
            background: rgba(255,255,255,.72);
            border: 1px solid rgba(255,255,255,.9);
            border-radius: 25px;
            position: relative;
            overflow: hidden;
            box-shadow: 0 18px 40px rgba(45, 108, 145, .10);
        }


        /* SIMPLE LANDSCAPE ILLUSTRATION */

        .sun {
            position: absolute;
            width: 66px;
            height: 66px;
            border-radius: 50%;
            background: #ffffff;
            top: 40px;
            right: 62px;
            box-shadow: 0 0 0 12px rgba(255,255,255,.35);
        }

        .mountain-back {
            position: absolute;
            bottom: 54px;
            left: 20px;
            width: 220px;
            height: 150px;
            background: #b7dff5;
            clip-path: polygon(
                0 100%,
                35% 35%,
                53% 62%,
                70% 20%,
                100% 100%
            );
        }

        .mountain-front {
            position: absolute;
            bottom: 54px;
            right: 10px;
            width: 250px;
            height: 155px;
            background: #8dc9ed;
            clip-path: polygon(
                0 100%,
                38% 30%,
                57% 60%,
                76% 12%,
                100% 100%
            );
        }

        .ground {
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 65px;
            background: #ffffff;
            border-radius: 50% 50% 0 0;
        }

        .book-icon {
            position: absolute;
            left: 50%;
            bottom: 31px;
            transform: translateX(-50%);
            width: 95px;
            height: 70px;
            background: #168fe5;
            border-radius: 9px 12px 12px 9px;
            box-shadow: 7px 8px 0 rgba(8,125,204,.18);
        }

        .book-icon:before {
            content: "";
            position: absolute;
            left: 45px;
            top: 0;
            width: 4px;
            height: 100%;
            background: rgba(255,255,255,.55);
        }

        .book-icon:after {
            content: "";
            position: absolute;
            left: 13px;
            top: 18px;
            width: 22px;
            height: 4px;
            background: rgba(255,255,255,.75);
            box-shadow:
                48px 0 rgba(255,255,255,.75),
                0 12px rgba(255,255,255,.45),
                48px 12px rgba(255,255,255,.45);
        }


        /* WELCOME TEXT */

        .welcome h2 {
            font-size: 30px;
            line-height: 1.15;
            color: #101827;
            margin-bottom: 13px;
        }

        .welcome p {
            font-size: 14px;
            line-height: 1.7;
            color: #667381;
            max-width: 390px;
            margin: 0 auto 21px;
        }


        /* SECURITY / STUDY PILL */

        .info-pill {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 9px 14px;
            border-radius: 30px;
            background: rgba(255,255,255,.78);
            border: 1px solid rgba(255,255,255,.95);
            color: #168fe5;
            font-size: 12px;
            font-weight: 650;
        }

        .check {
            width: 18px;
            height: 18px;
            border-radius: 50%;
            background: #168fe5;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 11px;
            font-weight: bold;
        }


        /* =========================================
           RESPONSIVE
        ========================================= */

        @media (max-width: 950px) {

            body {
                padding: 20px;
            }

            .container {
                grid-template-columns: 1fr;
                min-height: auto;
            }

            .right {
                display: none;
            }

            .left {
                padding: 45px 60px;
            }

            .form-content {
                max-width: 600px;
            }
        }


        @media (max-width: 560px) {

            body {
                padding: 12px;
            }

            .container {
                border-radius: 22px;
            }

            .left {
                padding: 35px 24px;
            }

            .brand {
                margin-bottom: 35px;
            }

            .form-content h1 {
                font-size: 34px;
            }

            .form-row {
                grid-template-columns: 1fr;
                gap: 0;
            }

            .login-link {
                margin-bottom: 5px;
            }
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

    <div class="container">

        <!-- =========================================
             LEFT SIDE - REGISTER FORM
        ========================================== -->

        <div class="left">

            <div class="form-content">

                <div class="brand">

                    <div class="brand-logo">
                        S
                    </div>

                    <div class="brand-name">
                        STUDYVAULT.
                    </div>

                </div>


                <div class="eyebrow">
                    STUDENT REGISTRATION
                </div>


                <h1>
                    Create your<br />
                    account<span class="blue-dot">.</span>
                </h1>


                <p class="intro">
                    Create your StudyVault account to organize your notes,
                    manage your courses, and keep your academic resources
                    in one place.
                </p>


                <!-- NAME + EMAIL -->

                <div class="form-row">

                    <div class="field">

                        <label>
                            Full Name
                        </label>

                        <asp:TextBox
                            ID="txtFullName"
                            runat="server"
                            CssClass="input-box"
                            placeholder="Enter Full Name">
                        </asp:TextBox>

                    </div>


                    <div class="field">

                        <label>
                            Email
                        </label>

                        <asp:TextBox
                            ID="txtEmail"
                            runat="server"
                            CssClass="input-box"
                            placeholder="Enter Email">
                        </asp:TextBox>

                    </div>

                </div>


                <!-- PASSWORD -->

                <div class="field">

                    <label>
                        Password
                    </label>

                    <asp:TextBox
                        ID="txtPassword"
                        runat="server"
                        TextMode="Password"
                        CssClass="input-box"
                        placeholder="Enter Password">
                    </asp:TextBox>

                </div>


                <div class="password-note">
                    <span></span>
                    Use a password you can remember for your account.
                </div>


                <!-- REGISTER -->

                <asp:Button
                    ID="btnRegister"
                    runat="server"
                    Text="Create Account"
                    CssClass="register-btn"
                    OnClick="btnRegister_Click" />


                <asp:Label
                    ID="lblMessage"
                    runat="server"
                    CssClass="message">
                </asp:Label>


                <div class="login-link">

                    Already have an account?

                    <a href="Login.aspx">
                        Sign in
                    </a>

                </div>

            </div>

        </div>


        <!-- =========================================
             RIGHT SIDE - WELCOME
        ========================================== -->

        <div class="right">

            <div class="circle-one"></div>
            <div class="circle-two"></div>
            <div class="circle-three"></div>


            <div class="welcome">


                <div class="illustration">

                    <div class="sun"></div>

                    <div class="mountain-back"></div>

                    <div class="mountain-front"></div>

                    <div class="ground"></div>

                    <div class="book-icon"></div>

                </div>


                <h2>
                    Start your StudyVault journey
                </h2>


                <p>
                    Keep your learning materials organized,
                    access academic resources easily, and make
                    your study experience simpler.
                </p>


                <div class="info-pill">

                    <div class="check">
                        ✓
                    </div>

                    Your personal learning space

                </div>


            </div>

        </div>

    </div>

</form>

</body>

</html>