<%@ Page Title="Admin Profile"
    Language="C#"
    AutoEventWireup="true"
    CodeBehind="AdminProfile.aspx.cs"
    Inherits="STUDYVAULT.AdminProfile" %>

<!DOCTYPE html>

<html lang="en">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
          content="width=device-width, initial-scale=1" />

    <title>Admin Profile - StudyVault</title>


    <style>

        /* =========================================================
           RESET
        ========================================================= */

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }


        /* =========================================================
           COLORS
        ========================================================= */

        :root {

            --purple: #5146e5;
            --purple-dark: #4037c8;
            --purple-light: #efedff;

            --ink: #171827;
            --text: #3f4354;
            --muted: #7b8194;

            --page: #f7f7fb;

            --white: #ffffff;

            --line: #e7e8ef;

            --green: #087f5b;
            --green-bg: #e9f9f2;

            --red: #d92d20;
            --red-bg: #fff0ef;
        }


        /* =========================================================
           BODY
        ========================================================= */

        html {
            min-height: 100%;
        }


        body {

            min-height: 100vh;

            font-family:
                "Segoe UI",
                Inter,
                system-ui,
                -apple-system,
                BlinkMacSystemFont,
                Arial,
                sans-serif;

            background: var(--page);

            color: var(--text);
        }


        a {
            text-decoration: none;
            color: inherit;
        }


        button,
        input {
            font-family: inherit;
        }


        /* =========================================================
           NAVIGATION
        ========================================================= */

        .top-nav {

            height: 94px;

            background: #ffffff;

            border-bottom: 1px solid #e9e9ef;

            position: sticky;

            top: 0;

            z-index: 100;
        }


        .nav-inner {

            width: 100%;

            height: 100%;

            padding: 0 5.5%;

            display: grid;

            grid-template-columns:
                1fr auto 1fr;

            align-items: center;
        }


        /* LOGO */

        .brand {

            justify-self: start;

            font-family:
                Georgia,
                "Times New Roman",
                serif;

            font-size: 26px;

            font-weight: 700;

            letter-spacing: -.7px;

            color: #17213b;

            white-space: nowrap;
        }


        .brand span {
            color: var(--purple);
        }


        /* NAV LINKS */

        .nav-links {

            justify-self: center;

            display: flex;

            align-items: center;

            justify-content: center;

            gap: 34px;

            height: 100%;
        }


        .nav-links a {

            height: 100%;

            display: flex;

            align-items: center;

            position: relative;

            color: #62687a;

            font-size: 14px;

            font-weight: 500;

            white-space: nowrap;

            transition: color .2s ease;
        }


        .nav-links a:hover {
            color: var(--purple);
        }


        .nav-links a.active {

            color: var(--purple);

            font-weight: 650;
        }


        .nav-links a.active::after {

            content: "";

            position: absolute;

            left: 0;

            right: 0;

            bottom: 22px;

            height: 2px;

            border-radius: 10px;

            background: var(--purple);
        }


        /* ADMIN */

        .nav-user {

            justify-self: end;

            display: flex;

            align-items: center;

            gap: 10px;

            color: #25283a;

            font-size: 14px;

            font-weight: 600;
        }


        .user-avatar {

            width: 43px;

            height: 43px;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 50%;

            background: var(--purple);

            color: white;

            font-size: 14px;

            font-weight: 800;

            box-shadow:
                0 5px 14px
                rgba(81,70,229,.22);
        }


        .user-arrow {

            color: #969aaa;

            font-size: 10px;

            margin-left: 2px;
        }


        /* =========================================================
           NEW PROFILE BODY
        ========================================================= */

        .profile-page {

            width: 100%;

            max-width: 1180px;

            margin: 0 auto;

            padding:
                55px 40px
                90px;
        }


        /* =========================================================
           PAGE INTRO
        ========================================================= */

        .profile-intro {

            display: flex;

            justify-content: space-between;

            align-items: flex-end;

            margin-bottom: 30px;

            gap: 30px;
        }


        .intro-text {

            max-width: 650px;
        }


        .intro-label {

            color: var(--purple);

            font-size: 11px;

            font-weight: 800;

            letter-spacing: 1.6px;

            text-transform: uppercase;

            margin-bottom: 12px;
        }


        .profile-intro h1 {

            font-family:
                Georgia,
                "Times New Roman",
                serif;

            font-size: 48px;

            line-height: 1;

            letter-spacing: -2px;

            color: var(--ink);

            margin-bottom: 12px;
        }


        .profile-intro p {

            color: var(--muted);

            font-size: 14px;

            line-height: 1.7;
        }


        .profile-status {

            display: flex;

            align-items: center;

            gap: 8px;

            padding:
                9px 14px;

            border-radius: 30px;

            background: var(--green-bg);

            color: var(--green);

            font-size: 12px;

            font-weight: 700;

            white-space: nowrap;
        }


        .profile-status::before {

            content: "";

            width: 7px;

            height: 7px;

            border-radius: 50%;

            background: #10b981;
        }


        /* =========================================================
           MAIN PROFILE AREA
        ========================================================= */

        .profile-layout {

            display: grid;

            grid-template-columns:
                300px 1fr;

            gap: 22px;

            align-items: start;
        }


        /* =========================================================
           IDENTITY PANEL
        ========================================================= */

        .identity-panel {

            background: white;

            border: 1px solid var(--line);

            border-radius: 20px;

            overflow: hidden;

            box-shadow:
                0 12px 35px
                rgba(22,27,45,.055);
        }


        .identity-cover {

            height: 125px;

            background:
                radial-gradient(
                    circle at 20% 20%,
                    rgba(255,255,255,.22),
                    transparent 30%
                ),

                linear-gradient(
                    135deg,
                    #5146e5,
                    #7169ed
                );

            position: relative;
        }


        .identity-avatar {

            position: absolute;

            left: 50%;

            bottom: -45px;

            transform: translateX(-50%);

            width: 90px;

            height: 90px;

            border-radius: 50%;

            border: 6px solid white;

            background: var(--purple-light);

            color: var(--purple);

            display: flex;

            align-items: center;

            justify-content: center;

            font-family: Georgia, serif;

            font-size: 29px;

            font-weight: 700;

            box-shadow:
                0 8px 20px
                rgba(20,20,50,.12);
        }


        .identity-content {

            padding:
                62px 24px
                27px;

            text-align: center;
        }


        .identity-content h2 {

            color: var(--ink);

            font-family:
                Georgia,
                "Times New Roman",
                serif;

            font-size: 23px;

            margin-bottom: 6px;
        }


        .identity-role {

            color: var(--purple);

            font-size: 12px;

            font-weight: 700;

            margin-bottom: 23px;
        }


        .identity-divider {

            height: 1px;

            background: var(--line);

            margin-bottom: 20px;
        }


        .identity-item {

            display: flex;

            align-items: center;

            gap: 10px;

            text-align: left;

            margin-bottom: 15px;

            color: var(--muted);

            font-size: 12.5px;
        }


        .identity-item-icon {

            width: 30px;

            height: 30px;

            border-radius: 8px;

            background: #f5f4ff;

            color: var(--purple);

            display: flex;

            align-items: center;

            justify-content: center;

            flex-shrink: 0;

            font-size: 12px;
        }


        /* =========================================================
           RIGHT CONTENT
        ========================================================= */

        .settings-area {

            display: flex;

            flex-direction: column;

            gap: 22px;
        }


        /* =========================================================
           SECTION
        ========================================================= */

        .settings-section {

            background: white;

            border: 1px solid var(--line);

            border-radius: 20px;

            padding: 28px;

            box-shadow:
                0 12px 35px
                rgba(22,27,45,.045);
        }


        .section-top {

            display: flex;

            align-items: center;

            gap: 13px;

            padding-bottom: 20px;

            margin-bottom: 23px;

            border-bottom: 1px solid var(--line);
        }


        .section-icon {

            width: 42px;

            height: 42px;

            border-radius: 11px;

            display: flex;

            align-items: center;

            justify-content: center;

            background: var(--purple-light);

            color: var(--purple);

            font-size: 17px;

            flex-shrink: 0;
        }


        .section-top h2 {

            color: var(--ink);

            font-size: 18px;

            margin-bottom: 3px;
        }


        .section-top p {

            color: var(--muted);

            font-size: 12px;
        }


        /* =========================================================
           FORM FIELDS
        ========================================================= */

        .fields {

            display: grid;

            grid-template-columns:
                repeat(2, 1fr);

            gap: 19px;
        }


        .field {

            display: flex;

            flex-direction: column;
        }


        .field.full {
            grid-column: 1 / -1;
        }


        .field label {

            color: #343747;

            font-size: 12px;

            font-weight: 700;

            margin-bottom: 8px;
        }


        .field input {

            width: 100%;

            height: 45px;

            padding:
                0 13px;

            border: 1px solid #dfe1ea;

            border-radius: 9px;

            background: #fafbfc;

            color: var(--ink);

            font-size: 13px;

            transition:
                border-color .2s ease,
                box-shadow .2s ease,
                background .2s ease;
        }


        .field input:hover {

            background: white;

            border-color: #cfd2df;
        }


        .field input:focus {

            outline: none;

            background: white;

            border-color: #9a93f2;

            box-shadow:
                0 0 0 3px
                rgba(81,70,229,.08);
        }


        /* =========================================================
           BUTTON ROW
        ========================================================= */

        .button-row {

            display: flex;

            justify-content: flex-end;

            margin-top: 24px;

            padding-top: 21px;

            border-top: 1px solid var(--line);
        }


        .primary-btn {

            height: 42px;

            padding:
                0 24px;

            border: none;

            border-radius: 9px;

            background: var(--purple);

            color: white;

            font-size: 12.5px;

            font-weight: 700;

            cursor: pointer;

            box-shadow:
                0 5px 14px
                rgba(81,70,229,.18);

            transition:
                background .2s ease,
                transform .2s ease;
        }


        .primary-btn:hover {

            background: var(--purple-dark);

            transform: translateY(-1px);
        }


        .secondary-btn {

            height: 42px;

            padding:
                0 24px;

            border: 1px solid var(--purple);

            border-radius: 9px;

            background: white;

            color: var(--purple);

            font-size: 12.5px;

            font-weight: 700;

            cursor: pointer;

            transition:
                background .2s ease,
                color .2s ease;
        }


        .secondary-btn:hover {

            background: var(--purple);

            color: white;
        }


        /* =========================================================
           MESSAGES
        ========================================================= */

        .confirmation {

            display: flex;

            align-items: center;

            gap: 12px;

            padding: 14px 17px;

            margin-bottom: 20px;

            background: var(--green-bg);

            border: 1px solid #c5efdf;

            border-radius: 13px;

            color: var(--green);
        }


        .confirmation .check {

            width: 30px;

            height: 30px;

            border-radius: 50%;

            flex-shrink: 0;

            display: flex;

            align-items: center;

            justify-content: center;

            background: #10a976;

            color: white;

            font-size: 13px;

            font-weight: 800;
        }


        .confirmation h3 {
            font-size: 13px;
        }


        .error-box {

            padding: 14px 17px;

            margin-bottom: 20px;

            border-radius: 13px;

            border: 1px solid #fecaca;

            background: var(--red-bg);

            color: var(--red);

            font-size: 13px;

            font-weight: 600;
        }


        /* =========================================================
           RESPONSIVE
        ========================================================= */

        @media (max-width: 1050px) {

            .nav-inner {
                padding: 0 28px;
            }


            .nav-links {
                gap: 22px;
            }


            .profile-page {

                padding-left: 28px;

                padding-right: 28px;
            }
        }


        @media (max-width: 850px) {

            .top-nav {

                height: auto;

                padding:
                    17px 22px;
            }


            .nav-inner {

                display: flex;

                flex-wrap: wrap;

                gap: 15px;

                height: auto;

                padding: 0;
            }


            .brand {
                font-size: 23px;
            }


            .nav-user {
                margin-left: auto;
            }


            .nav-user > span:not(.user-arrow) {
                display: none;
            }


            .nav-links {

                order: 3;

                width: 100%;

                height: 38px;

                justify-content: flex-start;

                overflow-x: auto;

                gap: 25px;
            }


            .nav-links a {

                height: 38px;

                flex-shrink: 0;
            }


            .nav-links a.active::after {
                bottom: 0;
            }


            .profile-page {

                padding:
                    42px 20px
                    70px;
            }


            .profile-intro {

                display: block;
            }


            .profile-status {

                display: inline-flex;

                margin-top: 18px;
            }


            .profile-layout {

                grid-template-columns: 1fr;
            }


            .identity-panel {

                max-width: 100%;
            }
        }


        @media (max-width: 600px) {

            .profile-page {

                padding-left: 15px;

                padding-right: 15px;
            }


            .profile-intro h1 {

                font-size: 39px;

                letter-spacing: -1.5px;
            }


            .fields {

                grid-template-columns: 1fr;
            }


            .field.full {
                grid-column: auto;
            }


            .settings-section {

                padding: 22px;
            }


            .button-row {

                justify-content: stretch;
            }


            .primary-btn,
            .secondary-btn {

                width: 100%;
            }
        }

    </style>

</head>


<body>

<form
    id="form1"
    runat="server">


    <!-- =========================================================
         NAVIGATION
    ========================================================== -->

    <header class="top-nav">

        <div class="nav-inner">


            <!-- LOGO -->

            <a
                href="AdminDashboard.aspx"
                class="brand">

                STUDYVAULT<span>.</span>

            </a>


            <!-- NAVIGATION -->

            <nav class="nav-links">

                <a href="AdminDashboard.aspx">
                    Overview
                </a>

                <a href="Users.aspx">
                    Users
                </a>

                <a href="AdminResources.aspx">
                    Resources
                </a>

                <a href="ASSIGNMENTCLINICadmin.aspx">
                    Assignments
                </a>

                <a href="AdminVideoTutorials.aspx">
                    Videos
                </a>

                <a
                    href="AdminProfile.aspx"
                    class="active">

                    Profile

                </a>

                <a href="AdminSettings.aspx">
                    Settings
                </a>

                <a href="AdminFeedback.aspx">
                    Feedback
                </a>

            </nav>


            <!-- ADMIN -->

            <div class="nav-user">

                <div class="user-avatar">
                    A
                </div>

                <span>
                    Admin
                </span>

                <span class="user-arrow">
                    ▾
                </span>

            </div>


        </div>

    </header>


    <!-- =========================================================
         PROFILE PAGE
    ========================================================== -->

    <main class="profile-page">


        <!-- INTRO -->

        <section class="profile-intro">

            <div class="intro-text">

                <div class="intro-label">
                    STUDYVAULT ADMINISTRATION
                </div>

                <h1>
                    Your Profile
                </h1>

                <p>
                    Manage your administrator information and
                    account security from one place.
                </p>

            </div>


            <div class="profile-status">
                Account Active
            </div>

        </section>


        <!-- =====================================================
             MESSAGES
        ====================================================== -->

        <asp:Panel
            ID="pnlConfirmation"
            runat="server"
            CssClass="confirmation"
            Visible="false">

            <div class="check">
                ✓
            </div>

            <h3>

                <asp:Label
                    ID="lblConfirmationText"
                    runat="server" />

            </h3>

        </asp:Panel>


        <asp:Panel
            ID="pnlError"
            runat="server"
            CssClass="error-box"
            Visible="false">

            <asp:Label
                ID="lblError"
                runat="server" />

        </asp:Panel>


        <!-- =====================================================
             PROFILE CONTENT
        ====================================================== -->

        <div class="profile-layout">


            <!-- =================================================
                 IDENTITY
            ================================================== -->

            <aside class="identity-panel">

                <div class="identity-cover">

                    <div class="identity-avatar">
                        A
                    </div>

                </div>


                <div class="identity-content">

                    <h2>
                        Administrator
                    </h2>

                    <div class="identity-role">
                        STUDYVAULT ADMIN
                    </div>


                    <div class="identity-divider"></div>


                    <div class="identity-item">

                        <div class="identity-item-icon">
                            ✓
                        </div>

                        <span>
                            Account verified
                        </span>

                    </div>


                    <div class="identity-item">

                        <div class="identity-item-icon">
                            🔒
                        </div>

                        <span>
                            Secure administrator access
                        </span>

                    </div>


                </div>

            </aside>


            <!-- =================================================
                 SETTINGS
            ================================================== -->

            <div class="settings-area">


                <!-- ACCOUNT DETAILS -->

                <section class="settings-section">


                    <div class="section-top">

                        <div class="section-icon">
                            👤
                        </div>

                        <div>

                            <h2>
                                Account Information
                            </h2>

                            <p>
                                Update your personal account details.
                            </p>

                        </div>

                    </div>


                    <div class="fields">


                        <!-- FULL NAME -->

                        <div class="field">

                            <label
                                for="<%= txtFullName.ClientID %>">

                                Full Name

                            </label>


                            <asp:TextBox
                                ID="txtFullName"
                                runat="server"
                                placeholder="Enter your full name">
                            </asp:TextBox>

                        </div>


                        <!-- EMAIL -->

                        <div class="field">

                            <label
                                for="<%= txtEmail.ClientID %>">

                                Email Address

                            </label>


                            <asp:TextBox
                                ID="txtEmail"
                                runat="server"
                                TextMode="Email"
                                placeholder="Enter your email address">
                            </asp:TextBox>

                        </div>


                    </div>


                    <div class="button-row">

                        <asp:Button
                            ID="btnSaveProfile"
                            runat="server"
                            CssClass="primary-btn"
                            Text="Save Changes"
                            OnClick="btnSaveProfile_Click" />

                    </div>


                </section>


                <!-- =================================================
                     PASSWORD
                ================================================== -->

                <section class="settings-section">


                    <div class="section-top">

                        <div class="section-icon">
                            🔒
                        </div>

                        <div>

                            <h2>
                                Account Security
                            </h2>

                            <p>
                                Change your administrator password.
                            </p>

                        </div>

                    </div>


                    <div class="fields">


                        <!-- CURRENT PASSWORD -->

                        <div class="field full">

                            <label
                                for="<%= txtCurrentPassword.ClientID %>">

                                Current Password

                            </label>


                            <asp:TextBox
                                ID="txtCurrentPassword"
                                runat="server"
                                TextMode="Password"
                                placeholder="Enter your current password">
                            </asp:TextBox>

                        </div>


                        <!-- NEW PASSWORD -->

                        <div class="field">

                            <label
                                for="<%= txtNewPassword.ClientID %>">

                                New Password

                            </label>


                            <asp:TextBox
                                ID="txtNewPassword"
                                runat="server"
                                TextMode="Password"
                                placeholder="Enter your new password">
                            </asp:TextBox>

                        </div>


                    </div>


                    <div class="button-row">

                        <asp:Button
                            ID="btnChangePassword"
                            runat="server"
                            CssClass="secondary-btn"
                            Text="Update Password"
                            OnClick="btnChangePassword_Click" />

                    </div>


                </section>


            </div>


        </div>


    </main>


</form>

</body>

</html>