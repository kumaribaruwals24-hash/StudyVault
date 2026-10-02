<%@ Page Title="Settings - Admin"
    Language="C#"
    AutoEventWireup="true"
    CodeBehind="AdminSettings.aspx.cs"
    Inherits="STUDYVAULT.AdminSettings" %>

<!DOCTYPE html>

<html lang="en">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
          content="width=device-width, initial-scale=1" />

    <title>Settings - Admin</title>


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
           ROOT
        ========================================================= */

        :root {

            --purple: #5146e5;
            --purple-dark: #4037c8;
            --purple-soft: #efedff;

            --ink: #171827;
            --body-text: #3f4354;
            --muted: #7b8194;

            --page: #f7f7fb;

            --white: #ffffff;

            --line: #e7e8ef;
            --line-dark: #dfe1ea;

            --green: #087f5b;
            --green-bg: #e9f9f2;

            --orange: #a85d00;
            --orange-bg: #fff8e8;

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

            color: var(--body-text);

        }


        a {
            color: inherit;
            text-decoration: none;
        }


        button,
        input {
            font-family: inherit;
        }


        /* =========================================================
           TOP NAVIGATION
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


        /* =========================================================
           BRAND
        ========================================================= */

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


        /* =========================================================
           NAV LINKS
        ========================================================= */

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


        /* =========================================================
           ADMIN USER
        ========================================================= */

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
           MAIN PAGE
        ========================================================= */

        .page {

            width: 100%;

            max-width: 1180px;

            margin: 0 auto;

            padding:
                62px 40px
                100px;

        }


        /* =========================================================
           PAGE HEADER
        ========================================================= */

        .page-header {

            margin-bottom: 38px;

        }


        .eyebrow {

            display: flex;

            align-items: center;

            gap: 9px;

            margin-bottom: 14px;

            color: var(--purple);

            font-size: 11px;

            font-weight: 800;

            text-transform: uppercase;

            letter-spacing: 1.5px;

        }


        .eyebrow-dot {

            width: 7px;

            height: 7px;

            border-radius: 50%;

            background: var(--purple);

        }


        .page-header h1 {

            font-family:
                Georgia,
                "Times New Roman",
                serif;

            font-size: 56px;

            line-height: 1;

            letter-spacing: -2.5px;

            color: var(--ink);

            font-weight: 700;

            margin-bottom: 15px;

        }


        .page-header p {

            font-size: 15px;

            line-height: 1.7;

            color: var(--muted);

            max-width: 650px;

        }


        /* =========================================================
           SETTINGS LAYOUT
        ========================================================= */

        .settings-layout {

            display: grid;

            grid-template-columns:
                250px 1fr;

            gap: 24px;

            align-items: start;

        }


        /* =========================================================
           SETTINGS MENU
        ========================================================= */

        .settings-menu {

            background: white;

            border: 1px solid var(--line);

            border-radius: 18px;

            padding: 9px;

            box-shadow:
                0 10px 30px
                rgba(22,27,45,.045);

        }


        .settings-menu-title {

            padding:
                14px 13px
                9px;

            color: #9296a6;

            font-size: 10px;

            font-weight: 800;

            letter-spacing: 1.2px;

            text-transform: uppercase;

        }


        .settings-menu-item {

            display: flex;

            align-items: center;

            gap: 11px;

            padding:
                12px 13px;

            border-radius: 11px;

            color: #646a7b;

            font-size: 13px;

            font-weight: 600;

            margin-bottom: 3px;

        }


        .settings-menu-item:last-child {
            margin-bottom: 0;
        }


        .settings-menu-item:hover {

            background: #f7f7fc;

            color: var(--purple);

        }


        .settings-menu-item.active {

            background: var(--purple-soft);

            color: var(--purple);

        }


        .menu-icon {

            width: 30px;

            height: 30px;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 8px;

            background: #f4f4f8;

            font-size: 13px;

        }


        .settings-menu-item.active .menu-icon {

            background: white;

        }


        /* =========================================================
           SETTINGS CONTENT
        ========================================================= */

        .settings-content {

            display: flex;

            flex-direction: column;

            gap: 18px;

        }


        /* =========================================================
           SETTINGS CARD
        ========================================================= */

        .settings-card {

            background: white;

            border: 1px solid var(--line);

            border-radius: 18px;

            overflow: hidden;

            box-shadow:
                0 10px 30px
                rgba(22,27,45,.045);

        }


        .card-header {

            padding:
                23px 26px
                20px;

            border-bottom: 1px solid var(--line);

        }


        .card-header h2 {

            font-size: 18px;

            color: var(--ink);

            margin-bottom: 6px;

        }


        .card-header p {

            color: var(--muted);

            font-size: 13px;

            line-height: 1.6;

        }


        .card-body {

            padding:
                8px 26px
                15px;

        }


        /* =========================================================
           SETTING ROW
        ========================================================= */

        .setting-row {

            min-height: 72px;

            display: flex;

            align-items: center;

            justify-content: space-between;

            gap: 25px;

            border-bottom: 1px solid #f0f0f4;

        }


        .setting-row:last-child {
            border-bottom: none;
        }


        .setting-info {

            min-width: 0;

        }


        .setting-name {

            color: #292d3d;

            font-size: 13.5px;

            font-weight: 700;

            margin-bottom: 5px;

        }


        .setting-description {

            color: var(--muted);

            font-size: 12px;

            line-height: 1.5;

        }


        .setting-value {

            flex-shrink: 0;

            color: var(--ink);

            font-size: 13px;

            font-weight: 750;

        }


        /* =========================================================
           VALUE BADGES
        ========================================================= */

        .value-badge {

            display: inline-flex;

            align-items: center;

            justify-content: center;

            min-width: 46px;

            padding:
                7px 12px;

            border-radius: 20px;

            background: var(--purple-soft);

            color: var(--purple);

            font-size: 12px;

            font-weight: 800;

        }


        .value-badge.green {

            background: var(--green-bg);

            color: var(--green);

        }


        .value-badge.orange {

            background: var(--orange-bg);

            color: var(--orange);

        }


        /* =========================================================
           STATUS BANNER
        ========================================================= */

        .status-banner {

            display: flex;

            align-items: center;

            gap: 14px;

            padding:
                17px 20px;

            background: #f8f8ff;

            border: 1px solid #dedcff;

            border-radius: 15px;

            margin-bottom: 18px;

        }


        .status-icon {

            width: 36px;

            height: 36px;

            flex-shrink: 0;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 10px;

            background: var(--purple);

            color: white;

            font-size: 15px;

        }


        .status-text strong {

            display: block;

            color: var(--ink);

            font-size: 13px;

            margin-bottom: 3px;

        }


        .status-text span {

            color: var(--muted);

            font-size: 12px;

        }


        /* =========================================================
           ROADMAP
        ========================================================= */

        .roadmap {

            padding:
                18px 20px;

            border:
                1px dashed #d9dbe6;

            border-radius: 15px;

            color: var(--muted);

            background: #fbfbfd;

            font-size: 12.5px;

            line-height: 1.7;

        }


        .roadmap strong {

            color: #555a6c;

        }


        /* =========================================================
           RESPONSIVE
        ========================================================= */

        @media (max-width: 1050px) {

            .nav-inner {

                padding:
                    0 28px;

            }


            .nav-links {

                gap: 22px;

            }


            .page {

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


            .page {

                padding:
                    45px 20px
                    80px;

            }


            .page-header h1 {

                font-size: 48px;

                letter-spacing: -2px;

            }


            .settings-layout {

                grid-template-columns: 1fr;

            }


            .settings-menu {

                display: flex;

                align-items: center;

                gap: 5px;

                overflow-x: auto;

                padding: 7px;

            }


            .settings-menu-title {

                display: none;

            }


            .settings-menu-item {

                flex-shrink: 0;

                margin: 0;

            }

        }


        @media (max-width: 550px) {

            .page {

                padding-left: 15px;

                padding-right: 15px;

            }


            .page-header h1 {

                font-size: 40px;

                letter-spacing: -1.5px;

            }


            .setting-row {

                align-items: flex-start;

                flex-direction: column;

                justify-content: center;

                gap: 8px;

                padding:
                    15px 0;

            }


            .setting-value {

                align-self: flex-start;

            }


            .card-header {

                padding:
                    20px;

            }


            .card-body {

                padding:
                    5px 20px
                    12px;

            }

        }

    </style>

</head>


<body>


<form id="form1" runat="server">


    <!-- =========================================================
         TOP NAVIGATION
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

                <a href="ASSIGNMENTCLINICadmin.aspx">
                    Assignments
                </a>

                <a href="AdminProfile.aspx">
                    Profile
                </a>

                <a
                    href="AdminSettings.aspx"
                    class="active">

                    Settings

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
         MAIN PAGE
    ========================================================== -->

    <main class="page">


        <!-- PAGE HEADER -->

        <section class="page-header">

            <div class="eyebrow">

                <span class="eyebrow-dot"></span>

                STUDYVAULT ADMINISTRATION

            </div>


            <h1>
                Settings
            </h1>


            <p>
                Review the current rules and configuration
                used across the StudyVault platform.
            </p>

        </section>


        <!-- =====================================================
             SETTINGS AREA
        ====================================================== -->

        <div class="settings-layout">


            <!-- =================================================
                 SETTINGS MENU
            ================================================== -->

            <div class="settings-menu">

                <div class="settings-menu-title">
                    Configuration
                </div>


                <a
                    href="#assignment-rules"
                    class="settings-menu-item active">

                    <span class="menu-icon">
                        ⚙
                    </span>

                    Assignment Rules

                </a>


                <a
                    href="#platform-status"
                    class="settings-menu-item">

                    <span class="menu-icon">
                        ◉
                    </span>

                    Platform Status

                </a>

            </div>


            <!-- =================================================
                 CONTENT
            ================================================== -->

            <div class="settings-content">


                <!-- PLATFORM STATUS -->

                <div
                    class="status-banner"
                    id="platform-status">

                    <div class="status-icon">
                        ✓
                    </div>


                    <div class="status-text">

                        <strong>
                            Platform is operational
                        </strong>

                        <span>
                            StudyVault administration is currently available.
                        </span>

                    </div>

                </div>


                <!-- ASSIGNMENT RULES -->

                <section
                    class="settings-card"
                    id="assignment-rules">


                    <div class="card-header">

                        <h2>
                            Assignment Rules
                        </h2>

                        <p>
                            Current submission rules applied to
                            assignments on the platform.
                        </p>

                    </div>


                    <div class="card-body">


                        <!-- MAX SUBMISSIONS -->

                        <div class="setting-row">

                            <div class="setting-info">

                                <div class="setting-name">
                                    Maximum submissions
                                </div>

                                <div class="setting-description">
                                    Maximum number of submissions
                                    allowed for each assignment.
                                </div>

                            </div>


                            <div class="setting-value">

                                <span class="value-badge">
                                    3
                                </span>

                            </div>

                        </div>


                        <!-- LATE SUBMISSIONS -->

                        <div class="setting-row">

                            <div class="setting-info">

                                <div class="setting-name">
                                    Late submissions
                                </div>

                                <div class="setting-description">
                                    Submissions after the assignment
                                    deadline are not accepted.
                                </div>

                            </div>


                            <div class="setting-value">

                                <span class="value-badge orange">
                                    Blocked
                                </span>

                            </div>

                        </div>


                        <!-- CONFIGURATION -->

                        <div class="setting-row">

                            <div class="setting-info">

                                <div class="setting-name">
                                    Configuration status
                                </div>

                                <div class="setting-description">
                                    These values are currently defined
                                    by the application.
                                </div>

                            </div>


                            <div class="setting-value">

                                <span class="value-badge green">
                                    Active
                                </span>

                            </div>

                        </div>


                    </div>

                </section>


                <!-- INFORMATION -->

                <div class="roadmap">

                    <strong>
                        Configuration note:
                    </strong>

                    These settings are currently fixed in the
                    application code and are displayed here for
                    reference. Editable configuration can be added
                    later without changing the navigation design.

                </div>


            </div>

        </div>

    </main>


</form>


</body>

</html>