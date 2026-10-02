<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AdminDashboard.aspx.cs"
    Inherits="STUDYVAULT.AdminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>STUDYVAULT | Admin Dashboard</title>

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0" />

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
            background: #071923;
            color: #ffffff;
        }

        a {
            text-decoration: none;
            color: inherit;
        }


        /* =========================================
           HERO
        ========================================= */

        .hero {
            min-height: 100vh;
            position: relative;
            overflow: hidden;

            background:
                linear-gradient(
                    90deg,
                    rgba(3, 18, 27, 0.78),
                    rgba(3, 35, 45, 0.52),
                    rgba(3, 18, 27, 0.72)
                ),
                url("https://images.unsplash.com/photo-1758685734343-491353d96a81?q=80&w=1332&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D");

            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
        }


        /* =========================================
           BACKGROUND LIGHT
        ========================================= */

        .ambient-light {
            position: absolute;
            width: 650px;
            height: 650px;
            left: 50%;
            top: 43%;

            transform: translate(-50%, -50%);

            border-radius: 50%;

            background:
                radial-gradient(
                    circle,
                    rgba(102, 231, 237, .23),
                    rgba(102, 231, 237, .08) 35%,
                    transparent 70%
                );

            filter: blur(15px);
            pointer-events: none;
        }


        /* =========================================
           STARS
        ========================================= */

        .stars {
            position: absolute;
            inset: 0;

            opacity: .22;

            background-image:
                radial-gradient(
                    circle,
                    rgba(255,255,255,.9) 1px,
                    transparent 1px
                );

            background-size: 95px 95px;
            pointer-events: none;
        }


        /* =========================================
           NAVIGATION
        ========================================= */

        .top-nav {
            position: absolute;
            z-index: 50;

            top: 0;
            left: 0;
            right: 0;

            height: 82px;

            padding: 0 5%;

            display: flex;
            align-items: center;
            justify-content: space-between;
        }


        .logo {
            font-size: 21px;
            font-weight: 800;
            letter-spacing: -1px;
        }


        .logo-dot {
            color: #64dce8;
        }


        .nav-links {
            display: flex;
            align-items: center;
            gap: 24px;
            flex-wrap: wrap;
        }


        .nav-links a {
            position: relative;

            color: rgba(255,255,255,.62);

            font-size: 12px;

            transition:
                color .25s ease,
                transform .25s ease;
        }


        .nav-links a:hover {
            color: #ffffff;
            transform: translateY(-1px);
        }


        .nav-links a::after {
            content: "";

            position: absolute;

            left: 0;
            bottom: -7px;

            width: 0;
            height: 1px;

            background: #6ee4ed;

            transition: width .25s ease;
        }


        .nav-links a:hover::after {
            width: 100%;
        }


        /* =========================================
           ADMIN PROFILE
        ========================================= */

        .admin-area {
            display: flex;
            align-items: center;
            gap: 10px;

            padding: 6px 12px 6px 6px;

            border: 1px solid rgba(255,255,255,.13);
            border-radius: 40px;

            background: rgba(255,255,255,.07);

            backdrop-filter: blur(18px);
        }


        .avatar {
            width: 32px;
            height: 32px;

            border-radius: 50%;

            display: flex;
            align-items: center;
            justify-content: center;

            background:
                linear-gradient(
                    135deg,
                    #63e1eb,
                    #188bc7
                );

            color: #ffffff;

            font-size: 12px;
            font-weight: 800;

            box-shadow:
                0 5px 20px
                rgba(30,160,200,.25);
        }


        .admin-name {
            max-width: 150px;

            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;

            font-size: 12px;
            font-weight: 650;
        }


        /* =========================================
           HERO CONTENT
        ========================================= */

        .hero-content {
            position: relative;
            z-index: 20;

            min-height: 100vh;

            display: flex;
            justify-content: center;
            align-items: center;

            text-align: center;

            padding: 100px 25px 230px;
        }


        .hero-inner {
            max-width: 900px;
            margin-top: -30px;
        }


        .eyebrow {
            display: inline-flex;
            align-items: center;
            gap: 8px;

            padding: 8px 15px;

            border-radius: 30px;

            border: 1px solid rgba(255,255,255,.12);

            background: rgba(255,255,255,.07);

            backdrop-filter: blur(15px);

            color: #9be8ef;

            font-size: 10px;
            font-weight: 700;
            letter-spacing: 2px;

            margin-bottom: 25px;
        }


        .eyebrow-dot {
            width: 6px;
            height: 6px;

            border-radius: 50%;

            background: #64e3ed;

            box-shadow:
                0 0 13px
                rgba(100,227,237,.9);
        }


        .welcome {
            font-size: 16px;
            color: rgba(255,255,255,.68);
            margin-bottom: 9px;
        }


        .welcome strong {
            color: #ffffff;
            font-weight: 650;
        }


        .main-title {
            font-size: clamp(58px, 9vw, 112px);

            line-height: .87;

            letter-spacing: -7px;

            font-weight: 800;

            margin-bottom: 27px;
        }


        .main-title .accent {
            color: #65dce8;

            text-shadow:
                0 0 45px
                rgba(101,220,232,.25);
        }


        .hero-description {
            max-width: 590px;

            margin: 0 auto;

            color: rgba(255,255,255,.57);

            font-size: 14px;
            line-height: 1.8;
        }


        /* =========================================
           BUTTONS
        ========================================= */

        .buttons {
            display: flex;
            justify-content: center;

            gap: 12px;

            margin-top: 30px;
        }


        .btn {
            display: inline-flex;

            align-items: center;
            justify-content: center;

            min-width: 155px;

            padding: 13px 20px;

            border-radius: 30px;

            font-size: 12px;
            font-weight: 700;

            transition:
                transform .25s ease,
                box-shadow .25s ease,
                background .25s ease;
        }


        .btn-primary {
            background: #ffffff;
            color: #073142;

            box-shadow:
                0 12px 35px
                rgba(0,0,0,.18);
        }


        .btn-primary:hover {
            transform: translateY(-3px);

            box-shadow:
                0 18px 45px
                rgba(0,0,0,.25);
        }


        .btn-secondary {
            color: #ffffff;

            background: rgba(255,255,255,.08);

            border: 1px solid rgba(255,255,255,.15);

            backdrop-filter: blur(15px);
        }


        .btn-secondary:hover {
            background: rgba(255,255,255,.14);

            transform: translateY(-3px);
        }


        /* =========================================
           LANDSCAPE
        ========================================= */

        .landscape {
            position: absolute;

            left: 0;
            right: 0;
            bottom: 0;

            height: 300px;

            pointer-events: none;
        }


        .mountain {
            position: absolute;

            bottom: -70px;

            width: 0;
            height: 0;

            border-left: 430px solid transparent;
            border-right: 430px solid transparent;
            border-bottom: 320px solid;
        }


        .mountain-one {
            left: -240px;

            border-bottom-color:
                rgba(2,28,37,.95);

            transform: scale(1.25);
        }


        .mountain-two {
            left: 28%;

            border-bottom-color:
                rgba(5,47,58,.90);

            transform: scale(.95);
        }


        .mountain-three {
            right: -240px;

            border-bottom-color:
                rgba(2,23,31,.98);

            transform: scale(1.3);
        }


        .mist {
            position: absolute;

            left: 0;
            right: 0;

            bottom: 90px;

            height: 100px;

            background:
                linear-gradient(
                    to top,
                    rgba(91,205,213,.13),
                    transparent
                );

            filter: blur(20px);
        }


        /* =========================================
           FLOATING STAT PANEL
        ========================================= */

        .stats-panel {
            position: absolute;

            z-index: 40;

            bottom: 42px;
            left: 50%;

            transform: translateX(-50%);

            width: min(980px, 92%);

            display: grid;

            grid-template-columns: repeat(6, 1fr);

            border: 1px solid rgba(255,255,255,.13);

            background: rgba(255,255,255,.08);

            backdrop-filter: blur(22px);

            border-radius: 23px;

            overflow: hidden;

            box-shadow:
                0 20px 60px
                rgba(0,0,0,.16);
        }


        .stat {
            min-height: 95px;

            padding: 18px 14px;

            display: flex;
            flex-direction: column;
            justify-content: center;

            border-right:
                1px solid
                rgba(255,255,255,.08);
        }


        .stat:last-child {
            border-right: none;
        }


        .stat-number {
            font-size: 23px;

            font-weight: 750;

            letter-spacing: -.5px;

            margin-bottom: 4px;
        }


        .stat-label {
            color: rgba(255,255,255,.48);

            font-size: 9px;

            text-transform: uppercase;

            letter-spacing: 1.2px;
        }


        /* =========================================
           OVERVIEW SECTION
        ========================================= */

        .overview {
            background: #f5fafc;

            color: #102630;

            padding: 120px 7% 130px;
        }


        .overview-intro {
            max-width: 650px;
            margin-bottom: 55px;
        }


        .section-label {
            color: #139bcf;

            font-size: 10px;

            font-weight: 800;

            letter-spacing: 2px;
        }


        .overview-title {
            font-size: clamp(40px, 5vw, 65px);

            line-height: .95;

            letter-spacing: -3px;

            margin-top: 12px;

            font-weight: 800;
        }


        .overview-text {
            color: #78909b;

            font-size: 14px;

            line-height: 1.8;

            max-width: 560px;

            margin-top: 18px;
        }


        /* =========================================
           MANAGEMENT
        ========================================= */

        .management-grid {
            max-width: 1150px;

            display: grid;

            grid-template-columns: repeat(3, 1fr);

            gap: 18px;
        }


        .management-card {
            position: relative;

            min-height: 220px;

            padding: 28px;

            border-radius: 25px;

            background: #ffffff;

            border: 1px solid #e6f0f4;

            overflow: hidden;

            transition:
                transform .3s ease,
                box-shadow .3s ease;
        }


        .management-card:hover {
            transform: translateY(-7px);

            box-shadow:
                0 25px 60px
                rgba(26,88,110,.11);
        }


        .card-number {
            position: absolute;

            top: 15px;
            right: 22px;

            font-size: 50px;

            line-height: 1;

            font-weight: 800;

            color: #edf5f7;
        }


        .card-icon {
            width: 45px;
            height: 45px;

            display: flex;

            align-items: center;
            justify-content: center;

            border-radius: 14px;

            background: #e9f8fc;

            color: #1299cd;

            margin-bottom: 25px;
        }


        .card-icon svg {
            width: 20px;
            height: 20px;
        }


        .management-card h3 {
            font-size: 18px;
            margin-bottom: 8px;
        }


        .management-card p {
            color: #81949e;

            font-size: 12px;

            line-height: 1.7;

            max-width: 280px;
        }


        .card-arrow {
            position: absolute;

            right: 25px;
            bottom: 24px;

            color: #139bcf;

            font-size: 11px;

            font-weight: 750;
        }


        /* =========================================
           RECENT ACTIVITY
        ========================================= */

        .activity-section {
            max-width: 1150px;
            margin-top: 80px;
        }


        .activity-panel {
            background: #ffffff;

            border: 1px solid #e6f0f4;

            border-radius: 22px;

            overflow: hidden;

            box-shadow:
                0 20px 50px
                rgba(26,88,110,.06);
        }


        table.activity-table {
            width: 100%;
            border-collapse: collapse;
        }


        table.activity-table th {
            text-align: left;

            font-size: 11px;

            text-transform: uppercase;

            letter-spacing: 1px;

            color: #81949e;

            padding: 16px 22px;

            border-bottom: 1px solid #e6f0f4;
        }


        table.activity-table td {
            padding: 15px 22px;

            font-size: 13px;

            color: #102630;

            border-bottom: 1px solid #e6f0f4;
        }


        table.activity-table tr:last-child td {
            border-bottom: none;
        }


        .status-pill {
            font-size: 11px;

            font-weight: 700;

            padding: 4px 12px;

            border-radius: 12px;
        }


        .status-pill.pending {
            background: #fff4e0;
            color: #b45309;
        }


        .status-pill.active {
            background: #e6f9f0;
            color: #047857;
        }


        .status-pill.published {
            background: #e6f2fc;
            color: #1d4ed8;
        }


        /* =========================================
           LOGOUT
        ========================================= */

        .logout-form {
            display: inline;
        }


        .logout-btn {
            border: none;

            cursor: pointer;

            font-family: inherit;

            color: rgba(255,255,255,.65);

            background: transparent;

            font-size: 11px;

            transition: .25s ease;
        }


        .logout-btn:hover {
            color: #ffffff;
        }


        /* =========================================
           FOOTER
        ========================================= */

        .footer {
            background: #061821;

            color: rgba(255,255,255,.45);

            padding: 28px 7%;

            display: flex;

            align-items: center;

            justify-content: space-between;

            font-size: 11px;
        }


        .footer strong {
            color: rgba(255,255,255,.8);
        }


        /* =========================================
           RESPONSIVE
        ========================================= */

        @media (max-width: 1000px) {

            .nav-links {
                gap: 16px;
            }

            .management-grid {
                grid-template-columns: repeat(2, 1fr);
            }

            .stats-panel {
                grid-template-columns: repeat(3, 1fr);
            }

            .stat:nth-child(3n) {
                border-right: none;
            }
        }


        @media (max-width: 760px) {

            .top-nav {
                height: 70px;
                padding: 0 20px;
            }


            .nav-links {
                display: none;
            }


            .admin-name {
                display: none;
            }


            .main-title {
                letter-spacing: -4px;
                font-size: 65px;
            }


            .hero-description {
                font-size: 12px;
            }


            .stats-panel {
                width: calc(100% - 30px);

                grid-template-columns: repeat(2, 1fr);

                bottom: 15px;
            }


            .stat {
                min-height: 75px;

                padding: 14px;

                border-bottom:
                    1px solid
                    rgba(255,255,255,.08);
            }


            .stat:nth-child(odd) {
                border-right:
                    1px solid
                    rgba(255,255,255,.08);
            }


            .stat:nth-child(even) {
                border-right: none;
            }


            .stat-number {
                font-size: 20px;
            }


            .management-grid {
                grid-template-columns: 1fr;
            }


            .overview {
                padding: 80px 6%;
            }


            .footer {
                flex-direction: column;

                gap: 10px;

                text-align: center;
            }


            .activity-panel {
                overflow-x: auto;
            }


            table.activity-table {
                min-width: 650px;
            }
        }


        @media (max-width: 480px) {

            .hero-content {
                padding-bottom: 210px;
            }


            .main-title {
                font-size: 52px;
                letter-spacing: -3px;
            }


            .welcome {
                font-size: 14px;
            }


            .buttons {
                flex-direction: column;
                align-items: center;
            }


            .btn {
                width: 190px;
            }


            .stats-panel {
                border-radius: 18px;
            }


            .stat-label {
                font-size: 8px;
            }
        }

    </style>

</head>


<body>

<form id="form1" runat="server">


    <!-- =========================================
         HERO
    ========================================== -->

    <section class="hero">

        <div class="stars"></div>

        <div class="ambient-light"></div>


        <!-- TOP NAV -->

        <nav class="top-nav">


            <!-- LOGO -->

            <a href="AdminDashboard.aspx"
               class="logo">

                STUDYVAULT<span class="logo-dot">.</span>

            </a>


            <!-- LINKS -->

            <div class="nav-links">

                <a href="#overview">
                    Overview
                </a>

                <a href="Users.aspx">
                    Users
                </a>

                <a href="AdminResources.aspx">
                    Resources
                </a>
                <a href="AdminCategories.aspx">
    Categories
</a>

                <a href="ASSIGNMENTCLINICadmin.aspx">
                    Assignments
                </a>

                <a href="AdminVideoTutorials.aspx">
                    Videos
                </a>

                <a href="AdminProfile.aspx">
                    Profile
                </a>

                <a href="AdminSettings.aspx">
                    Settings
                </a>

                <a href="AdminFeedback.aspx">
    Feedback
</a>

            </div>


            <!-- ADMIN -->

            <div class="admin-area">

                <div class="avatar">

                    <asp:Label
                        ID="lblAvatar"
                        runat="server"
                        Text="A" />

                </div>

                <asp:Label
                    ID="lblAdminName"
                    runat="server"
                    CssClass="admin-name"
                    Text="Admin" />

            </div>


        </nav>


        <!-- HERO CONTENT -->

        <div class="hero-content">

            <div class="hero-inner">


                <div class="eyebrow">

                    <span class="eyebrow-dot"></span>

                    STUDYVAULT ADMINISTRATION

                </div>


                <div class="welcome">

                    Welcome back,

                    <strong>
                        <asp:Label
                            ID="lblWelcomeName"
                            runat="server"
                            Text="Admin" />
                    </strong>

                </div>


                <h1 class="main-title">

                    Manage.<br />

                    <span class="accent">
                        Inspire.
                    </span>
                    <br />

                    Empower.

                </h1>


                <p class="hero-description">

                    Your central space for managing
                    students, study resources, assignments,
                    research papers and educational content
                    across STUDYVAULT.

                </p>


                <div class="buttons">

                    <a href="#overview"
                       class="btn btn-primary">

                        Explore Dashboard
                        &nbsp;↗

                    </a>


                    <a href="AdminResources.aspx"
                       class="btn btn-secondary">

                        Manage Resources

                    </a>

                </div>


            </div>

        </div>


        <!-- LANDSCAPE -->

        <div class="landscape">

            <div class="mist"></div>

            <div class="mountain mountain-one"></div>

            <div class="mountain mountain-two"></div>

            <div class="mountain mountain-three"></div>

        </div>



        <!-- STATS -->

        <div class="stats-panel">


            <div class="stat">

                <div class="stat-number">

                   <asp:Label
    ID="lblStudentCount"
    runat="server"
    Text="0" />
                </div>

                <div class="stat-label">
                    Students
                </div>

            </div>


            <div class="stat">

                <div class="stat-number">

                    <asp:Label
                        ID="lblTotalNotes"
                        runat="server"
                        Text="0" />

                </div>

                <div class="stat-label">
                    Study Notes
                </div>

            </div>


            <div class="stat">

                <div class="stat-number">

                    <asp:Label
                        ID="lblTotalAssignments"
                        runat="server"
                        Text="0" />

                </div>

                <div class="stat-label">
                    Assignments
                </div>

            </div>


            <div class="stat">

                <div class="stat-number">

                    <asp:Label
                        ID="lblTotalVideos"
                        runat="server"
                        Text="0" />

                </div>

                <div class="stat-label">
                    Tutorials
                </div>

            </div>


            <div class="stat">

                <div class="stat-number">

                    <asp:Label
                        ID="lblTotalPapers"
                        runat="server"
                        Text="0" />

                </div>

                <div class="stat-label">
                    Research Papers
                </div>

            </div>


            <div class="stat">

                <div class="stat-number">

                    <asp:Label
                        ID="lblPendingSubmissions"
                        runat="server"
                        Text="0" />

                </div>

                <div class="stat-label">
                    Pending Submissions
                </div>

            </div>


        </div>

    </section>



    <!-- =========================================
         OVERVIEW
    ========================================== -->

    <section
        class="overview"
        id="overview">


        <div class="overview-intro">

            <div class="section-label">
                ADMINISTRATION
            </div>


            <h2 class="overview-title">

                Everything you need.
                <br />
                Nothing you don't.

            </h2>


            <p class="overview-text">

                Keep STUDYVAULT organised from one
                central workspace. Manage your users,
                learning resources and academic content
                without unnecessary complexity.

            </p>

        </div>



        <!-- MANAGEMENT GRID -->

        <div class="management-grid">


            <!-- USERS -->

            <a href="Users.aspx"
               class="management-card">

                <div class="card-number">
                    01
                </div>


                <div class="card-icon">

                    <svg
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="1.7">

                        <circle
                            cx="9"
                            cy="8"
                            r="3" />

                        <path
                            d="M3 20c0-3.3 2.7-6 6-6s6 2.7 6 6" />

                        <path
                            d="M16 5.5c2.2.2 4 2 4 4.2" />

                        <path
                            d="M18 14c1.8.8 3 2.7 3 5" />

                    </svg>

                </div>


                <h3>
                    Users
                </h3>


                <p>

                    Manage student accounts,
                    administrator access and
                    user information.

                </p>


                <span class="card-arrow">
                    Manage users →
                </span>

            </a>



            <!-- STUDY NOTES -->

            <a href="StudyNotes.aspx"
               class="management-card">

                <div class="card-number">
                    02
                </div>


                <div class="card-icon">

                    <svg
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="1.7">

                        <path
                            d="M6 3h12v18l-6-4-6 4z" />

                    </svg>

                </div>


                <h3>
                    Study Notes
                </h3>


                <p>

                    Add, edit, delete and
                    categorize study notes
                    across subjects.

                </p>


                <span class="card-arrow">
                    Manage notes →
                </span>

            </a>



            <!-- ASSIGNMENTS -->

            <a href="ASSIGNMENTCLINICadmin.aspx"
               class="management-card">

                <div class="card-number">
                    03
                </div>


                <div class="card-icon">

                    <svg
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="1.7">

                        <rect
                            x="5"
                            y="3"
                            width="14"
                            height="18"
                            rx="2" />

                        <path
                            d="M8 8h8" />

                        <path
                            d="M8 12h8" />

                        <path
                            d="M8 16h5" />

                    </svg>

                </div>


                <h3>
                    Assignments
                </h3>


                <p>

                    Add, edit and delete
                    assignments, and set
                    submission deadlines.

                </p>


                <span class="card-arrow">
                    Manage assignments →
                </span>

            </a>



            <!-- RESEARCH PAPERS -->

            <a href="ResearchPapers.aspx"
               class="management-card">

                <div class="card-number">
                    04
                </div>


                <div class="card-icon">

                    <svg
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="1.7">

                        <path
                            d="M6 3h9l4 4v14H6z" />

                        <path
                            d="M15 3v5h5" />

                        <path
                            d="M9 13h6" />

                        <path
                            d="M9 17h6" />

                    </svg>

                </div>


                <h3>
                    Research Papers
                </h3>


                <p>

                    Upload papers, edit
                    details and manage
                    learning references.

                </p>


                <span class="card-arrow">
                    Manage papers →
                </span>

            </a>



            <!-- VIDEOS -->

            <a href="AdminVideoTutorials.aspx"
               class="management-card">

                <div class="card-number">
                    05
                </div>


                <div class="card-icon">

                    <svg
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="1.7">

                        <rect
                            x="3"
                            y="5"
                            width="18"
                            height="14"
                            rx="2" />

                        <path
                            d="m10 9 5 3-5 3z" />

                    </svg>

                </div>


                <h3>
                    Video Tutorials
                </h3>


                <p>

                    Add, edit, delete and
                    categorize video tutorials
                    by subject.

                </p>


                <span class="card-arrow">
                    Manage tutorials →
                </span>

            </a>
            <!-- ANNOUNCEMENTS -->

            <a href="Announcements.aspx"
               class="management-card">

                <div class="card-number">
                    07
                </div>


                <div class="card-icon">

                    <svg
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="1.7">

                        <path
                            d="M3 10v4a1 1 0 0 0 1 1h3l5 4V5L7 9H4a1 1 0 0 0-1 1z" />

                        <path
                            d="M14 8.5a3.5 3.5 0 0 1 0 7" />

                    </svg>

                </div>


                <h3>
                    Announcements
                </h3>


                <p>

                    Create, edit and delete
                    announcements shown to
                    all students.

                </p>


                <span class="card-arrow">
                    Manage announcements →
                </span>

            </a>



            <!-- RESOURCES -->

            <a href="AdminResources.aspx"
               class="management-card">

                <div class="card-number">
                    08
                </div>


                <div class="card-icon">

                    <svg
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="1.7">

                        <path
                            d="M4 5.5A2.5 2.5 0 0 1 6.5 3H20v17H6.5A2.5 2.5 0 0 0 4 22z" />

                        <path
                            d="M4 5.5V22" />

                        <path
                            d="M8 7h8" />

                    </svg>

                </div>


                <h3>
                    Resources
                </h3>


                <p>

                    Organise study materials
                    and make learning resources
                    available to students.

                </p>


                <span class="card-arrow">
                    Manage resources →
                </span>

            </a>



            <!-- FEEDBACK -->

            <a href="AdminFeedback.aspx"
               class="management-card">

                <div class="card-number">
                    09
                </div>


                <div class="card-icon">

                    <svg
                        viewBox="0 0 24 24"
                        fill="none"
                        stroke="currentColor"
                        stroke-width="1.7">

                        <path
                            d="M20 11.5a7.5 7.5 0 0 1-11.7 6.2L4 20l1.4-4.3A7.5 7.5 0 1 1 20 11.5z" />

                    </svg>

                </div>


                <h3>
                    Feedback
                </h3>


                <p>

                    Review student feedback
                    and improve the STUDYVAULT
                    learning experience.

                </p>


                <span class="card-arrow">
                    View feedback →
                </span>

            </a>


        </div>



        <!-- RECENT ACTIVITY -->

        <div class="activity-section">

            <div class="section-label">
                RECENT ACTIVITY
            </div>


            <h2
                class="overview-title"
                style="font-size: clamp(28px, 3vw, 42px); margin-bottom: 24px;">

                What's happening now

            </h2>


            <div class="activity-panel">

                <table class="activity-table">

                    <thead>

                        <tr>
                            <th>Activity</th>
                            <th>User</th>
                            <th>Date</th>
                            <th>Status</th>
                        </tr>

                    </thead>


                    <tbody>

                        <asp:Repeater
                            ID="rptRecentActivity"
                            runat="server">

                            <ItemTemplate>

                                <tr>

                                    <td>
                                        <%# Eval("Activity") %>
                                    </td>

                                    <td>
                                        <%# Eval("UserName") %>
                                    </td>

                                    <td>
                                        <%# Eval("DateDisplay") %>
                                    </td>

                                    <td>

                                        <span class='status-pill <%# Eval("StatusKey") %>'>
                                            <%# Eval("Status") %>
                                        </span>

                                    </td>

                                </tr>

                            </ItemTemplate>

                        </asp:Repeater>

                    </tbody>

                </table>

            </div>

        </div>

    </section>



    <!-- =========================================
         FOOTER
    ========================================== -->

    <footer class="footer">

        <span>

            © 2026
            <strong>STUDYVAULT</strong>.
            Knowledge, unlocked.

        </span>


        <asp:Button
            ID="btnLogout"
            runat="server"
            Text="Logout"
            CssClass="logout-btn"
            OnClick="btnLogout_Click" />

    </footer>


</form>

</body>

</html>