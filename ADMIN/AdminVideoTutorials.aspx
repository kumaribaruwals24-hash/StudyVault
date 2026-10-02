<%@ Page Language="C#"
    AutoEventWireup="true"
    CodeBehind="AdminVideoTutorials.aspx.cs"
    Inherits="STUDYVAULT.AdminVideoTutorials" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
          content="width=device-width, initial-scale=1" />

    <title>
        StudyVault | Video Tutorials
    </title>


    <style>

        /* =========================================================
           RESET
        ========================================================= */

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }


        :root {

            --ink: #11162b;
            --ink-soft: #343a52;

            --muted: #7c8398;

            --purple: #5146e5;
            --purple-light: #7167f2;
            --purple-dark: #3e34bd;

            --purple-soft: #efedff;

            --page: #f8f8fc;
            --white: #ffffff;

            --border: #e6e7ef;

            --red: #d92d3d;
            --red-soft: #fff1f3;

            --gold: #a86f00;
            --gold-soft: #fff7df;

            --green: #087f5b;
            --green-soft: #eaf9f3;

            --shadow:
                0 18px 55px rgba(29, 25, 80, .07);
        }


        /* =========================================================
           BODY
        ========================================================= */

        html,
        body {
            min-height: 100%;
        }


        body {

            font-family:
                "Segoe UI",
                Inter,
                system-ui,
                -apple-system,
                BlinkMacSystemFont,
                sans-serif;

            color: var(--ink);

            background:

                radial-gradient(
                    circle at 8% 8%,
                    rgba(81,70,229,.08),
                    transparent 22%
                ),

                radial-gradient(
                    circle at 95% 18%,
                    rgba(124,58,237,.07),
                    transparent 25%
                ),

                #f8f8fc;
        }


        a {
            text-decoration: none;
            color: inherit;
        }


        input,
        textarea,
        select,
        button {
            font-family: inherit;
        }


        /* =========================================================
           TOP NAVIGATION
        ========================================================= */

        .topbar {

            height: 94px;

            padding: 0 5.2vw;

            background: rgba(255,255,255,.95);

            border-bottom:
                1px solid rgba(81,70,229,.09);

            display: grid;

            grid-template-columns:
                240px
                minmax(500px, 1fr)
                240px;

            align-items: center;

            position: sticky;

            top: 0;

            z-index: 100;

            backdrop-filter: blur(18px);
        }


        /* BRAND */

        .brand {

            font-family:
                Georgia,
                "Times New Roman",
                serif;

            font-size: 25px;

            font-weight: 700;

            letter-spacing: -.7px;

            color: #171c35;
        }


        .brand span {
            color: var(--purple);
        }


        /* NAV */

        .main-nav {

            height: 100%;

            display: flex;

            align-items: center;

            justify-content: center;

            gap: 31px;
        }


        .main-nav a {

            height: 100%;

            display: flex;

            align-items: center;

            position: relative;

            color: #646b80;

            font-size: 14px;

            font-weight: 550;

            white-space: nowrap;

            transition:
                color .2s ease;
        }


        .main-nav a:hover {
            color: var(--purple);
        }


        .main-nav a.active {

            color: var(--purple);

            font-weight: 750;
        }


        .main-nav a.active::after {

            content: "";

            position: absolute;

            left: 0;

            right: 0;

            bottom: 23px;

            height: 2px;

            border-radius: 99px;

            background: var(--purple);
        }


        /* ADMIN */

        .admin-area {

            display: flex;

            align-items: center;

            justify-content: flex-end;

            gap: 10px;
        }


        .admin-avatar {

            width: 44px;

            height: 44px;

            border-radius: 50%;

            display: flex;

            align-items: center;

            justify-content: center;

            color: white;

            font-size: 15px;

            font-weight: 800;

            background:
                linear-gradient(
                    135deg,
                    #6c61f0,
                    #4539d4
                );

            box-shadow:
                0 8px 20px rgba(81,70,229,.22);
        }


        .admin-name {

            color: #191e33;

            font-size: 14px;

            font-weight: 700;
        }


        .admin-arrow {

            color: #9398aa;

            font-size: 10px;
        }


        /* =========================================================
           PAGE
        ========================================================= */

        .page {

            width:
                min(
                    1380px,
                    calc(100% - 90px)
                );

            margin: auto;

            padding:
                65px 0
                100px;
        }


        /* =========================================================
           HERO
        ========================================================= */

        .hero {

            display: grid;

            grid-template-columns:
                1fr
                380px;

            gap: 80px;

            align-items: end;

            margin-bottom: 55px;
        }


        .hero-eyebrow {

            display: flex;

            align-items: center;

            gap: 10px;

            margin-bottom: 18px;

            color: var(--purple);

            font-size: 11px;

            font-weight: 850;

            letter-spacing: 1.5px;

            text-transform: uppercase;
        }


        .hero-eyebrow::before {

            content: "";

            width: 29px;

            height: 2px;

            border-radius: 99px;

            background: var(--purple);
        }


        .hero h1 {

            font-family:
                Georgia,
                "Times New Roman",
                serif;

            font-size:
                clamp(
                    54px,
                    6vw,
                    78px
                );

            line-height: .92;

            letter-spacing: -4px;

            color: #11162b;
        }


        .hero-description {

            max-width: 650px;

            margin-top: 22px;

            color: var(--muted);

            font-size: 15px;

            line-height: 1.75;
        }


        /* HERO SIDE */

        .hero-side {

            padding-left: 23px;

            border-left:
                2px solid var(--purple);
        }


        .hero-side-number {

            color: #252a43;

            font-family:
                Georgia,
                serif;

            font-size: 38px;

            font-weight: 700;
        }


        .hero-side-label {

            margin-top: 3px;

            color: var(--muted);

            font-size: 11px;

            text-transform: uppercase;

            letter-spacing: 1px;

            font-weight: 800;
        }


        .hero-side-text {

            margin-top: 16px;

            color: #858b9d;

            font-size: 12px;

            line-height: 1.7;
        }


        /* =========================================================
           MESSAGES
        ========================================================= */

        .message {

            padding: 14px 17px;

            border-radius: 12px;

            margin-bottom: 25px;

            font-size: 13px;

            font-weight: 600;
        }


        .success {

            color: var(--green);

            background: var(--green-soft);

            border:
                1px solid #c8ecde;
        }


        .error {

            color: #b42332;

            background: var(--red-soft);

            border:
                1px solid #f4c4ca;
        }


        /* =========================================================
           ADD VIDEO SECTION
        ========================================================= */

        .create-video {

            display: grid;

            grid-template-columns:
                275px
                1fr;

            background: white;

            border:
                1px solid var(--border);

            border-radius: 24px;

            overflow: hidden;

            box-shadow: var(--shadow);

            margin-bottom: 65px;
        }


        /* LEFT PANEL */

        .create-side {

            position: relative;

            overflow: hidden;

            padding: 35px 29px;

            color: white;

            background:

                radial-gradient(
                    circle at 100% 0%,
                    rgba(126,116,255,.35),
                    transparent 32%
                ),

                linear-gradient(
                    145deg,
                    #15172f,
                    #26214e 65%,
                    #4036b3
                );
        }


        .create-side::before {

            content: "";

            position: absolute;

            width: 190px;

            height: 190px;

            border:
                1px solid rgba(255,255,255,.09);

            border-radius: 50%;

            right: -80px;

            top: -70px;
        }


        .create-side::after {

            content: "▶";

            position: absolute;

            right: 26px;

            bottom: 25px;

            width: 53px;

            height: 53px;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 50%;

            color: rgba(255,255,255,.65);

            background:
                rgba(255,255,255,.08);

            font-size: 15px;
        }


        .create-number {

            position: relative;

            z-index: 2;

            color: #aba6ff;

            font-size: 10px;

            font-weight: 850;

            letter-spacing: 1.5px;
        }


        .create-side h2 {

            position: relative;

            z-index: 2;

            margin-top: 68px;

            max-width: 190px;

            font-family:
                Georgia,
                "Times New Roman",
                serif;

            font-size: 35px;

            line-height: 1.04;

            letter-spacing: -1.2px;
        }


        .create-side p {

            position: relative;

            z-index: 2;

            max-width: 205px;

            margin-top: 16px;

            color: rgba(255,255,255,.62);

            font-size: 12px;

            line-height: 1.7;
        }


        /* =========================================================
           FORM
        ========================================================= */

        .video-form {

            padding: 35px 40px;
        }


        .form-title {

            margin-bottom: 26px;

            color: #181d35;

            font-family:
                Georgia,
                "Times New Roman",
                serif;

            font-size: 28px;

            letter-spacing: -.8px;
        }


        .form-grid {

            display: grid;

            grid-template-columns:
                1fr
                1fr;

            gap: 20px 24px;
        }


        .form-group {

            display: flex;

            flex-direction: column;
        }


        .form-group.full {
            grid-column: 1 / -1;
        }


        .form-group label {

            margin-bottom: 8px;

            color: #4d5368;

            font-size: 10px;

            font-weight: 850;

            letter-spacing: .7px;

            text-transform: uppercase;
        }


        .form-control {

            width: 100%;

            height: 45px;

            padding:
                0 13px;

            color: #252b41;

            background: #fbfbfd;

            border:
                1px solid #e0e2eb;

            border-radius: 10px;

            outline: none;

            font-size: 13px;

            transition:
                border-color .2s ease,
                background .2s ease,
                box-shadow .2s ease;
        }


        textarea.form-control {

            height: auto;

            min-height: 105px;

            padding: 12px 13px;

            resize: vertical;

            line-height: 1.55;
        }


        .form-control:focus {

            background: white;

            border-color: var(--purple);

            box-shadow:
                0 0 0 4px
                rgba(81,70,229,.08);
        }


        .help-text {

            margin-top: 6px;

            color: #9399aa;

            font-size: 11px;
        }


        /* =========================================================
           FEATURED CHECKBOX
        ========================================================= */

        .featured-row {

            display: inline-flex;

            align-items: center;

            gap: 9px;

            margin-top: 3px;

            color: #555b70;

            font-size: 12px;

            font-weight: 600;
        }


        .featured-row input {

            width: 18px;

            height: 18px;

            accent-color: var(--purple);

            cursor: pointer;
        }


        /* =========================================================
           FORM BUTTONS
        ========================================================= */

        .button-row {

            display: flex;

            align-items: center;

            gap: 9px;

            margin-top: 25px;
        }


        .btn {

            height: 43px;

            padding: 0 19px;

            border-radius: 10px;

            border: 0;

            cursor: pointer;

            font-size: 11px;

            font-weight: 800;

            transition:
                transform .2s ease,
                box-shadow .2s ease,
                background .2s ease;
        }


        .btn-primary {

            color: white;

            background:
                linear-gradient(
                    135deg,
                    #655bf0,
                    #493ed3
                );

            box-shadow:
                0 8px 19px
                rgba(81,70,229,.20);
        }


        .btn-primary:hover {

            transform: translateY(-2px);

            box-shadow:
                0 12px 25px
                rgba(81,70,229,.29);
        }


        .btn-success {

            color: white;

            background:
                linear-gradient(
                    135deg,
                    #10a777,
                    #07835e
                );

            box-shadow:
                0 8px 18px
                rgba(8,127,91,.16);
        }


        .btn-success:hover {

            transform: translateY(-2px);

            box-shadow:
                0 12px 23px
                rgba(8,127,91,.23);
        }


        .btn-secondary {

            color: #596075;

            background: #f0f1f5;

            border:
                1px solid #e2e3e9;
        }


        .btn-secondary:hover {

            background: #e5e6eb;

            transform: translateY(-1px);
        }


        /* =========================================================
           VIDEOS HEADER
        ========================================================= */

        .videos-header {

            display: flex;

            align-items: end;

            justify-content: space-between;

            margin-bottom: 24px;
        }


        .videos-header-left {

            display: flex;

            flex-direction: column;

            gap: 6px;
        }


        .videos-kicker {

            color: var(--purple);

            font-size: 10px;

            font-weight: 850;

            letter-spacing: 1.4px;

            text-transform: uppercase;
        }


        .videos-header h2 {

            color: #171c33;

            font-family:
                Georgia,
                "Times New Roman",
                serif;

            font-size: 38px;

            letter-spacing: -1.3px;
        }


        .videos-header p {

            color: #8b91a3;

            font-size: 12px;
        }


        /* =========================================================
           VIDEO GRID
        ========================================================= */

        .video-grid {

            display: grid;

            grid-template-columns:
                repeat(2, 1fr);

            gap: 25px;
        }


        /* =========================================================
           VIDEO CARD
        ========================================================= */

        .video-card {

            position: relative;

            background: white;

            border:
                1px solid var(--border);

            border-radius: 20px;

            overflow: hidden;

            box-shadow:
                0 13px 40px
                rgba(29,25,80,.055);

            transition:
                transform .25s ease,
                box-shadow .25s ease,
                border-color .25s ease;
        }


        .video-card:hover {

            transform: translateY(-5px);

            border-color:
                #d9d6ff;

            box-shadow:
                0 22px 55px
                rgba(55,45,140,.11);
        }


        /* =========================================================
           YOUTUBE AREA
        ========================================================= */

        .youtube-box {

            position: relative;

            width: 100%;

            height: 250px;

            overflow: hidden;

            display: flex;

            align-items: center;

            justify-content: center;

            background:

                radial-gradient(
                    circle at 50% 45%,
                    #303354,
                    #101225 68%
                );
        }


        .youtube-box::before {

            content: "";

            position: absolute;

            width: 145px;

            height: 145px;

            border-radius: 50%;

            border:
                1px solid
                rgba(255,255,255,.08);
        }


        .youtube-box::after {

            content: "";

            position: absolute;

            width: 210px;

            height: 210px;

            border-radius: 50%;

            border:
                1px solid
                rgba(255,255,255,.045);
        }


        /* PLAY */

        .youtube-btn {

            position: relative;

            z-index: 3;

            width: 66px;

            height: 66px;

            display: flex;

            align-items: center;

            justify-content: center;

            border-radius: 50%;

            color: white;

            background:
                linear-gradient(
                    135deg,
                    #ff3347,
                    #d7192c
                );

            font-size: 0;

            box-shadow:
                0 14px 35px
                rgba(220,38,54,.30);

            transition:
                transform .2s ease,
                box-shadow .2s ease;
        }


        .youtube-btn::after {

            content: "▶";

            margin-left: 3px;

            font-size: 18px;

            color: white;
        }


        .youtube-btn:hover {

            transform:
                scale(1.09);

            box-shadow:
                0 17px 42px
                rgba(220,38,54,.40);
        }


        /* =========================================================
           VIDEO CONTENT
        ========================================================= */

        .video-content {

            padding: 25px;
        }


        .video-title {

            color: #171c34;

            font-family:
                Georgia,
                "Times New Roman",
                serif;

            font-size: 23px;

            line-height: 1.15;

            font-weight: 700;

            letter-spacing: -.4px;

            margin-bottom: 14px;
        }


        /* =========================================================
           BADGES
        ========================================================= */

        .video-meta {

            display: flex;

            flex-wrap: wrap;

            gap: 6px;

            margin-bottom: 17px;
        }


        .badge {

            display: inline-flex;

            align-items: center;

            padding:
                6px 10px;

            border-radius: 99px;

            color: #5146b8;

            background: var(--purple-soft);

            font-size: 10px;

            font-weight: 800;

            letter-spacing: .15px;
        }


        .featured-badge {

            color: #956500;

            background:
                var(--gold-soft);

            border:
                1px solid #f6dfa1;
        }


        /* =========================================================
           DESCRIPTION
        ========================================================= */

        .video-description {

            color: #71788c;

            font-size: 13px;

            line-height: 1.7;

            min-height: 45px;

            margin-bottom: 17px;
        }


        /* =========================================================
           INFO
        ========================================================= */

        .video-info {

            padding:
                13px 0;

            border-top:
                1px solid #eeeeF3;

            border-bottom:
                1px solid #eeeeF3;

            color: #747b8f;

            font-size: 11px;

            line-height: 1.8;

            margin-bottom: 15px;
        }


        .video-info strong {

            color: #353b51;

            font-weight: 750;
        }


        /* =========================================================
           TOPICS
        ========================================================= */

        .topics {

            min-height: 29px;

            margin-bottom: 20px;
        }


        .topic {

            display: inline-block;

            margin:
                2px 3px 2px 0;

            padding:
                5px 8px;

            border-radius: 7px;

            color: #666d81;

            background: #f4f4f8;

            font-size: 10px;

            font-weight: 650;
        }


        /* =========================================================
           VIDEO ACTIONS
        ========================================================= */

        .video-actions {

            display: grid;

            grid-template-columns:
                1fr
                1fr
                1fr;

            gap: 8px;
        }


        .action-btn {

            height: 39px;

            border-radius: 9px;

            border: 1px solid transparent;

            cursor: pointer;

            font-size: 10px;

            font-weight: 800;

            transition:
                transform .18s ease,
                box-shadow .18s ease,
                background .18s ease,
                border-color .18s ease;
        }


        /* EDIT */

        .edit-btn {

            color: #4b40c9;

            background: #f0eeff;

            border-color:
                #dfdcff;
        }


        .edit-btn:hover {

            transform: translateY(-2px);

            background: #e8e5ff;

            border-color:
                #d0cbff;

            box-shadow:
                0 7px 16px
                rgba(81,70,229,.10);
        }


        /* FEATURE */

        .feature-btn {

            color: #986700;

            background: #fff8e5;

            border-color:
                #f4e3af;
        }


        .feature-btn:hover {

            transform: translateY(-2px);

            background: #fff2c9;

            border-color:
                #edd593;

            box-shadow:
                0 7px 16px
                rgba(168,111,0,.09);
        }


        /* DELETE */

        .delete-btn {

            color: #bd2738;

            background: #fff5f6;

            border-color:
                #f3d4d8;
        }


        .delete-btn:hover {

            transform: translateY(-2px);

            color: #a7192a;

            background: #ffedef;

            border-color:
                #eeb8bf;

            box-shadow:
                0 7px 16px
                rgba(185,28,48,.10);
        }


        /* =========================================================
           EMPTY STATE
        ========================================================= */

        .no-videos {

            padding:
                75px 30px;

            text-align: center;

            background: white;

            border:
                1px solid var(--border);

            border-radius: 20px;

            box-shadow: var(--shadow);
        }


        .no-videos::before {

            content: "▶";

            width: 58px;

            height: 58px;

            display: flex;

            align-items: center;

            justify-content: center;

            margin:
                0 auto 18px;

            border-radius: 50%;

            color: var(--purple);

            background:
                var(--purple-soft);

            font-size: 16px;
        }


        .no-videos h3 {

            margin-bottom: 8px;

            color: #343a50;

            font-family:
                Georgia,
                serif;

            font-size: 25px;
        }


        .no-videos p {

            color: #858b9d;

            font-size: 13px;
        }


        /* =========================================================
           RESPONSIVE
        ========================================================= */

        @media (max-width: 1200px) {

            .topbar {

                grid-template-columns:
                    190px
                    minmax(420px, 1fr)
                    190px;

                padding:
                    0 28px;
            }


            .main-nav {
                gap: 20px;
            }


            .main-nav a {
                font-size: 13px;
            }


            .page {

                width:
                    calc(100% - 50px);
            }


            .hero {

                grid-template-columns:
                    1fr 280px;

                gap: 40px;
            }

        }


        @media (max-width: 900px) {

            .topbar {

                height: auto;

                min-height: 78px;

                grid-template-columns:
                    1fr auto;

                padding:
                    14px 22px;
            }


            .main-nav {

                grid-column:
                    1 / -1;

                order: 3;

                height: 46px;

                justify-content:
                    flex-start;

                overflow-x: auto;
            }


            .main-nav a {

                height: 46px;
            }


            .main-nav a.active::after {

                bottom: 3px;
            }


            .admin-name,
            .admin-arrow {
                display: none;
            }


            .hero {

                grid-template-columns: 1fr;
            }


            .hero-side {
                display: none;
            }


            .create-video {

                grid-template-columns: 1fr;
            }


            .create-side {

                min-height: 205px;
            }


            .create-side h2 {

                margin-top: 35px;
            }


            .video-grid {

                grid-template-columns:
                    1fr;
            }

        }


        @media (max-width: 650px) {

            .page {

                width:
                    calc(100% - 24px);

                padding-top: 45px;
            }


            .brand {
                font-size: 22px;
            }


            .hero h1 {

                font-size: 52px;

                letter-spacing:
                    -2.5px;
            }


            .video-form {

                padding:
                    28px 20px;
            }


            .form-grid {

                grid-template-columns: 1fr;
            }


            .form-group.full {

                grid-column: auto;
            }


            .button-row {

                flex-direction: column;

                align-items:
                    stretch;
            }


            .btn {

                width: 100%;
            }


            .videos-header {

                align-items:
                    flex-start;

                flex-direction: column;

                gap: 7px;
            }


            .videos-header h2 {

                font-size: 32px;
            }


            .video-content {

                padding: 21px;
            }


            .video-actions {

                grid-template-columns: 1fr;
            }


            .action-btn {

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
         TOP NAV
    ========================================================= -->

    <header class="topbar">


        <!-- BRAND -->

        <a
            href="AdminDashboard.aspx"
            class="brand">

            STUDYVAULT<span>.</span>

        </a>


        <!-- NAV -->

        <nav class="main-nav">

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

            <a
                href="AdminVideoTutorials.aspx"
                class="active">

                Videos

            </a>

            <a href="AdminProfile.aspx">
                Profile
            </a>

            <a href="AdminSettings.aspx">
                Settings
            </a>

        </nav>


        <!-- ADMIN -->

        <div class="admin-area">

            <div class="admin-avatar">
                A
            </div>

            <span class="admin-name">
                Admin
            </span>

            <span class="admin-arrow">
                ▾
            </span>

        </div>

    </header>



    <!-- =========================================================
         PAGE
    ========================================================= -->

    <main class="page">


        <!-- =====================================================
             HERO
        ===================================================== -->

        <section class="hero">


            <div>

                <div class="hero-eyebrow">
                    StudyVault Administration
                </div>


                <h1>
                    Video<br />
                    Tutorials
                </h1>


                <p class="hero-description">

                    Build a focused collection of useful
                    educational videos for your students.
                    Add tutorials, organize them by level,
                    and highlight the best ones.

                </p>

            </div>


            <div class="hero-side">

                <div class="hero-side-number">
                    02
                </div>

                <div class="hero-side-label">
                    Learning Library
                </div>

                <p class="hero-side-text">

                    Keep your video collection clean,
                    useful and easy for students to explore.

                </p>

            </div>

        </section>



        <!-- =====================================================
             SUCCESS
        ===================================================== -->

        <asp:Panel
            ID="pnlConfirmation"
            runat="server"
            Visible="false"
            CssClass="message success">

            <asp:Label
                ID="lblConfirmationText"
                runat="server" />

        </asp:Panel>



        <!-- =====================================================
             ERROR
        ===================================================== -->

        <asp:Panel
            ID="pnlError"
            runat="server"
            Visible="false"
            CssClass="message error">

            <asp:Label
                ID="lblError"
                runat="server" />

        </asp:Panel>



        <!-- =====================================================
             CREATE VIDEO
        ===================================================== -->

        <section class="create-video">


            <!-- LEFT SIDE -->

            <aside class="create-side">

                <div class="create-number">
                    01 / VIDEO LIBRARY
                </div>


                <h2>
                    Add a video worth watching.
                </h2>


                <p>

                    Turn a useful tutorial into a resource
                    your students can come back to.

                </p>

            </aside>



            <!-- FORM -->

            <div class="video-form">


                <h2 class="form-title">

                    <asp:Label
                        ID="lblFormTitle"
                        runat="server"
                        Text="Add Video" />

                </h2>


                <!-- HIDDEN ID -->

                <asp:HiddenField
                    ID="hfVideoId"
                    runat="server" />


                <div class="form-grid">


                    <!-- TITLE -->

                    <div class="form-group">

                        <label for="txtTitle">
                            Video Title
                        </label>

                        <asp:TextBox
                            ID="txtTitle"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter video title" />

                    </div>



                    <!-- CATEGORY -->

                    <div class="form-group">

                        <label for="ddlCategory">
                            Category
                        </label>

                        <asp:DropDownList
                            ID="ddlCategory"
                            runat="server"
                            CssClass="form-control">

                            <asp:ListItem
                                Value="Programming"
                                Text="Programming" />

                            <asp:ListItem
                                Value="Mathematics"
                                Text="Mathematics" />

                            <asp:ListItem
                                Value="Science"
                                Text="Science" />

                            <asp:ListItem
                                Value="Database"
                                Text="Database" />

                            <asp:ListItem
                                Value="Web Development"
                                Text="Web Development" />

                            <asp:ListItem
                                Value="Computer Science"
                                Text="Computer Science" />

                        </asp:DropDownList>

                    </div>



                    <!-- LEVEL -->

                    <div class="form-group">

                        <label for="ddlLevel">
                            Level
                        </label>

                        <asp:DropDownList
                            ID="ddlLevel"
                            runat="server"
                            CssClass="form-control">

                            <asp:ListItem
                                Value="Beginner"
                                Text="Beginner" />

                            <asp:ListItem
                                Value="Intermediate"
                                Text="Intermediate" />

                            <asp:ListItem
                                Value="Advanced"
                                Text="Advanced" />

                        </asp:DropDownList>

                    </div>



                    <!-- DURATION -->

                    <div class="form-group">

                        <label for="txtDuration">
                            Duration
                        </label>

                        <asp:TextBox
                            ID="txtDuration"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Example: 25 minutes" />

                    </div>



                    <!-- INSTRUCTOR -->

                    <div class="form-group">

                        <label for="txtInstructor">
                            Instructor
                        </label>

                        <asp:TextBox
                            ID="txtInstructor"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Example: John Smith" />

                    </div>



                    <!-- YOUTUBE -->

                    <div class="form-group">

                        <label for="txtYouTubeUrl">
                            YouTube Video Link
                        </label>

                        <asp:TextBox
                            ID="txtYouTubeUrl"
                            runat="server"
                            CssClass="form-control"
                            placeholder="https://www.youtube.com/watch?v=..." />

                        <span class="help-text">

                            Paste the YouTube video URL here.

                        </span>

                    </div>



                    <!-- TOPICS -->

                    <div class="form-group full">

                        <label for="txtTopics">
                            Topics
                        </label>

                        <asp:TextBox
                            ID="txtTopics"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Example: Variables, Loops, Functions" />

                        <span class="help-text">

                            Separate topics with commas.

                        </span>

                    </div>



                    <!-- DESCRIPTION -->

                    <div class="form-group full">

                        <label for="txtDescription">
                            Description
                        </label>

                        <asp:TextBox
                            ID="txtDescription"
                            runat="server"
                            CssClass="form-control"
                            TextMode="MultiLine"
                            placeholder="Enter a description for the tutorial." />

                    </div>



                    <!-- FEATURED -->

                    <div class="form-group full">

                        <div class="featured-row">

                            <asp:CheckBox
                                ID="chkFeatured"
                                runat="server" />

                            <label for="chkFeatured">

                                Mark this video as Featured

                            </label>

                        </div>

                    </div>


                </div>



                <!-- BUTTONS -->

                <div class="button-row">


                    <asp:Button
                        ID="btnAdd"
                        runat="server"
                        Text="Publish Video"
                        CssClass="btn btn-primary"
                        OnClick="btnAdd_Click" />


                    <asp:Button
                        ID="btnUpdate"
                        runat="server"
                        Text="Save Changes"
                        CssClass="btn btn-success"
                        Visible="false"
                        OnClick="btnUpdate_Click" />


                    <asp:Button
                        ID="btnCancelEdit"
                        runat="server"
                        Text="Cancel"
                        CssClass="btn btn-secondary"
                        Visible="false"
                        OnClick="btnCancelEdit_Click" />

                </div>

            </div>

        </section>



        <!-- =====================================================
             VIDEO LIST HEADER
        ===================================================== -->

        <div class="videos-header">


            <div class="videos-header-left">

                <div class="videos-kicker">
                    Your Collection
                </div>

                <h2>
                    Uploaded Videos
                </h2>

                <p>
                    Manage, feature or remove your tutorials.
                </p>

            </div>

        </div>



        <!-- =====================================================
             NO VIDEOS
        ===================================================== -->

        <asp:Panel
            ID="pnlNoVideos"
            runat="server"
            Visible="false"
            CssClass="no-videos">

            <h3>
                No Videos Available
            </h3>

            <p>
                No video tutorials have been added yet.
            </p>

        </asp:Panel>



        <!-- =====================================================
             VIDEO REPEATER
        ===================================================== -->

        <asp:Repeater
            ID="rptVideos"
            runat="server"
            OnItemCommand="rptVideos_ItemCommand">


            <HeaderTemplate>

                <div class="video-grid">

            </HeaderTemplate>


            <ItemTemplate>

                <article class="video-card">


                    <!-- =================================================
                         VIDEO / YOUTUBE
                         ================================================= -->

                    <div class="youtube-box">

                        <a
                            href='<%# Eval("YouTubeUrl") %>'
                            target="_blank"
                            rel="noopener noreferrer"
                            class="youtube-btn">

                            Watch Video

                        </a>

                    </div>



                    <!-- =================================================
                         CONTENT
                         ================================================= -->

                    <div class="video-content">


                        <!-- TITLE -->

                        <div class="video-title">

                            <%# Eval("Title") %>

                        </div>



                        <!-- META -->

                        <div class="video-meta">


                            <span class="badge">

                                <%# Eval("CategoryLabel") %>

                            </span>


                            <span class="badge">

                                <%# Eval("Level") %>

                            </span>


                            <span class="badge">

                                <%# Eval("Duration") %>

                            </span>


                            <asp:Label
                                ID="lblFeatured"
                                runat="server"
                                CssClass="badge featured-badge"
                                Visible='<%# Convert.ToBoolean(Eval("IsFeatured")) %>'
                                Text="Featured" />

                        </div>



                        <!-- DESCRIPTION -->

                        <div class="video-description">

                            <%# Eval("Description") %>

                        </div>



                        <!-- INFO -->

                        <div class="video-info">

                            <strong>
                                Instructor:
                            </strong>

                            <%# Eval("Instructor") %>

                            <br />

                            <strong>
                                Uploaded:
                            </strong>

                            <%# Eval(
                                "UploadDate",
                                "{0:MMM dd, yyyy}"
                            ) %>

                        </div>



                        <!-- TOPICS -->

                        <div class="topics">

                            <asp:Repeater
                                ID="rptTopics"
                                runat="server"
                                DataSource='<%# Eval("Topics") %>'>

                                <ItemTemplate>

                                    <span class="topic">

                                        <%# Container.DataItem %>

                                    </span>

                                </ItemTemplate>

                            </asp:Repeater>

                        </div>



                        <!-- =================================================
                             ACTIONS
                             ================================================= -->

                        <div class="video-actions">


                            <!-- EDIT -->

                            <asp:Button
                                ID="btnEdit"
                                runat="server"
                                Text="Edit"
                                CssClass="action-btn edit-btn"
                                CommandName="Edit"
                                CommandArgument='<%# Eval("Id") %>' />


                            <!-- FEATURE -->

                            <asp:Button
                                ID="btnFeatured"
                                runat="server"
                                Text='<%# Convert.ToBoolean(Eval("IsFeatured")) ? "Unfeature" : "Feature" %>'
                                CssClass="action-btn feature-btn"
                                CommandName="ToggleFeatured"
                                CommandArgument='<%# Eval("Id") %>' />


                            <!-- DELETE -->

                            <asp:Button
                                ID="btnDelete"
                                runat="server"
                                Text="Delete"
                                CssClass="action-btn delete-btn"
                                CommandName="Delete"
                                CommandArgument='<%# Eval("Id") %>'
                                OnClientClick="return confirm('Are you sure you want to delete this video?');" />

                        </div>


                    </div>

                </article>

            </ItemTemplate>


            <FooterTemplate>

                </div>

            </FooterTemplate>


        </asp:Repeater>


    </main>


</form>

</body>

</html>