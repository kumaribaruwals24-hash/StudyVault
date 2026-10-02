<%@ Page Title="Video Tutorials - StudyVault"
    Language="C#"
    AutoEventWireup="true"
    CodeBehind="VideoTutorials.aspx.cs"
    Inherits="STUDYVAULT.VideoTutorials" %>

<!DOCTYPE html>

<html lang="en">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
          content="width=device-width, initial-scale=1" />

    <title>Video Tutorials - StudyVault</title>

    <link rel="preconnect"
          href="https://fonts.googleapis.com" />

    <link rel="preconnect"
          href="https://fonts.gstatic.com"
          crossorigin />

    <link
        href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,600;0,700;1,600&display=swap"
        rel="stylesheet" />


    <style>

        /* =========================================================
           GLOBAL
           ========================================================= */

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }


        :root {

            --hairline: rgba(17,24,39,.08);

            --purple: #4f46e5;
            --purple-dark: #4338ca;
            --purple-light: #eef2ff;

            --blue: #3b82f6;
            --blue-light: #eff6ff;

            --cyan: #06b6d4;
            --cyan-light: #ecfeff;

            --green: #10b981;
            --green-light: #ecfdf5;

            --violet: #8b5cf6;
            --violet-light: #f5f3ff;

            --yellow: #f59e0b;
            --yellow-light: #fffbeb;

            --text: #111827;
            --muted: #6b7280;
            --muted-dark: #4b5563;
        }


        html {
            scroll-behavior: smooth;
        }


        body {

            font-family:
                'Segoe UI',
                system-ui,
                -apple-system,
                BlinkMacSystemFont,
                sans-serif;

            background:
                radial-gradient(
                    1100px 500px at 50% -150px,
                    rgba(139,92,246,.06),
                    transparent 60%
                ),
                #f6f8ff;

            color: var(--text);

            min-height: 100vh;
        }


        a {
            text-decoration: none;
        }


        button {
            font-family: inherit;
        }


        a:focus-visible,
        button:focus-visible {

            outline: 3px solid #4f46e5;

            outline-offset: 2px;
        }


        /* =========================================================
           HEADER
           ========================================================= */

        .header {

            position: sticky;

            top: 0;

            z-index: 1000;

            display: flex;

            justify-content: space-between;

            align-items: center;

            padding: 18px 60px;

            background: white;

            box-shadow:
                0 4px 20px rgba(17,24,39,.06);
        }


        /* =========================================================
           LOGO
           ========================================================= */

        .logo {

            display: flex;

            align-items: center;

            gap: 10px;

            font-size: 22px;

            font-weight: 800;

            color: #4f46e5;

            white-space: nowrap;
        }


        /* =========================================================
           NAVIGATION
           ========================================================= */

        .header nav {

            display: flex;

            gap: 30px;
        }


        .header nav a {

            color: #6b7280;

            font-weight: 600;

            font-size: 15px;

            padding-bottom: 4px;

            border-bottom:
                2px solid transparent;

            transition: .2s;
        }


        .header nav a:hover {

            color: #111827;
        }


        .header nav .active {

            color: #4f46e5;

            border-bottom-color:
                #4f46e5;
        }


        /* =========================================================
           HEADER RIGHT
           ========================================================= */

        .header-right {

            display: flex;

            align-items: center;

            gap: 18px;

            flex-wrap: nowrap;

            flex-shrink: 0;
        }


        /* =========================================================
           NOTIFICATION
           ========================================================= */

        .notification {

            position: relative;

            font-size: 20px;

            flex-shrink: 0;
        }


        .notification span {

            position: absolute;

            top: -6px;

            right: -9px;

            background: #ef4444;

            color: white;

            width: 17px;

            height: 17px;

            border-radius: 50%;

            display: flex;

            justify-content: center;

            align-items: center;

            font-size: 10px;

            font-weight: 700;
        }


        /* =========================================================
           USER
           ========================================================= */

        .user {

            display: flex;

            align-items: center;

            gap: 12px;

            flex-wrap: nowrap;

            flex-shrink: 0;
        }


        /* =========================================================
           AVATAR
           ========================================================= */

        .avatar-circle {

            width: 36px;

            height: 36px;

            border-radius: 50%;

            background:
                linear-gradient(
                    135deg,
                    #4f46e5,
                    #8b5cf6
                );

            color: white;

            font-weight: 700;

            font-size: 13px;

            display: flex;

            align-items: center;

            justify-content: center;

            flex-shrink: 0;

            line-height: 1;
        }


        /* =========================================================
           LOGOUT
           ========================================================= */

        .logout-btn {

            background: #f3f4f6;

            color: #374151;

            border: none;

            padding: 9px 18px;

            border-radius: 20px;

            cursor: pointer;

            font-weight: 600;

            font-size: 14px;

            white-space: nowrap;

            flex-shrink: 0;

            transition: .2s;
        }


        .logout-btn:hover {

            background: #fee2e2;

            color: #dc2626;
        }


        /* =========================================================
           MAIN
           ========================================================= */

        .main {

            max-width: 1200px;

            margin: 0 auto;

            padding: 60px 60px 0;
        }


        /* =========================================================
           PAGE INTRO
           ========================================================= */

        .intro {

            text-align: center;

            max-width: 760px;

            margin: 0 auto 20px;
        }


        .eyebrow {

            text-transform: uppercase;

            letter-spacing: 1.5px;

            font-size: 12px;

            font-weight: 700;

            color: #4f46e5;

            margin-bottom: 8px;
        }


        .intro h1 {

            font-family:
                'Playfair Display',
                Georgia,
                serif;

            font-size: 40px;

            font-weight: 700;

            letter-spacing: -.5px;

            margin-bottom: 14px;

            color: #111827;
        }


        .intro > p {

            color: #6b7280;

            font-size: 16px;

            line-height: 1.7;
        }


        /* =========================================================
           DECORATIVE LINE
           ========================================================= */

        .hero-rule {

            height: 4px;

            width: 64px;

            border-radius: 4px;

            background:
                linear-gradient(
                    90deg,
                    #4f46e5,
                    #8b5cf6,
                    #3b82f6
                );

            margin: 26px auto 0;
        }


        /* =========================================================
           VIDEO SECTION
           ========================================================= */

        .video-section {

            max-width: 1200px;

            margin: 60px auto 0;

            padding: 0 60px;
        }


        .section-header {

            display: flex;

            justify-content: space-between;

            align-items: flex-end;

            margin-bottom: 30px;
        }


        .section-header-left {

            max-width: 650px;
        }


        .section-label {

            text-transform: uppercase;

            letter-spacing: 1.3px;

            font-size: 12px;

            font-weight: 700;

            color: #4f46e5;

            margin-bottom: 8px;
        }


        .section-header h2 {

            font-family:
                'Playfair Display',
                Georgia,
                serif;

            font-size: 28px;

            font-weight: 700;

            letter-spacing: -.3px;

            margin-bottom: 8px;
        }


        .section-header p {

            color: #6b7280;

            font-size: 15px;

            line-height: 1.65;
        }


        /* =========================================================
           VIDEO GRID
           ========================================================= */

        .video-grid {

            display: grid;

            grid-template-columns:
                repeat(
                    2,
                    minmax(0, 1fr)
                );

            gap: 24px;
        }


        /* =========================================================
           VIDEO CARD
           ========================================================= */

        .video-card {

            background: white;

            border: 1px solid
                var(--hairline);

            border-radius: 22px;

            overflow: hidden;

            box-shadow:
                0 5px 20px
                rgba(17,24,39,.05);

            transition:
                transform .25s ease,
                box-shadow .25s ease,
                border-color .25s ease;
        }


        .video-card:hover {

            transform:
                translateY(-5px);

            border-color:
                rgba(79,70,229,.18);

            box-shadow:
                0 16px 30px
                rgba(17,24,39,.08);
        }


        /* =========================================================
           VIDEO PREVIEW
           ========================================================= */

        .youtube-area {

            height: 250px;

            position: relative;

            display: flex;

            align-items: center;

            justify-content: center;

            overflow: hidden;

            background:

                radial-gradient(
                    500px 220px at 20% 20%,
                    rgba(59,130,246,.13),
                    transparent 60%
                ),

                radial-gradient(
                    400px 250px at 90% 80%,
                    rgba(139,92,246,.13),
                    transparent 60%
                ),

                linear-gradient(
                    135deg,
                    #eff6ff 0%,
                    #eef2ff 50%,
                    #f5f3ff 100%
                );

            border-bottom:
                1px solid
                var(--hairline);
        }


        /* Large decorative circle */

        .youtube-area::before {

            content: "";

            position: absolute;

            width: 210px;

            height: 210px;

            border-radius: 50%;

            background:
                rgba(79,70,229,.07);

            left: 50%;

            top: 50%;

            transform:
                translate(-50%,-50%);
        }


        /* Small decorative circle */

        .youtube-area::after {

            content: "";

            position: absolute;

            width: 95px;

            height: 95px;

            border-radius: 50%;

            background:
                rgba(6,182,212,.09);

            top: -25px;

            right: 25px;
        }


        /* =========================================================
           VIDEO PLAY BUTTON
           ========================================================= */

        .youtube-watch-btn {

            position: relative;

            z-index: 2;

            width: 76px;

            height: 76px;

            display: flex;

            align-items: center;

            justify-content: center;

            background:
                linear-gradient(
                    135deg,
                    #4f46e5,
                    #6366f1
                );

            color: white;

            border-radius: 50%;

            font-size: 27px;

            padding-left: 4px;

            box-shadow:
                0 10px 25px
                rgba(79,70,229,.28);

            transition: .25s;
        }


        .youtube-watch-btn:hover {

            background:
                linear-gradient(
                    135deg,
                    #4338ca,
                    #4f46e5
                );

            transform:
                scale(1.08);

            box-shadow:
                0 14px 30px
                rgba(79,70,229,.35);
        }


        /* =========================================================
           YOUTUBE LABEL
           ========================================================= */

        .youtube-label {

            position: absolute;

            bottom: 16px;

            left: 18px;

            z-index: 3;

            padding: 7px 12px;

            background:
                rgba(255,255,255,.88);

            color: #475569;

            border:
                1px solid
                rgba(255,255,255,.7);

            border-radius: 20px;

            font-size: 12px;

            font-weight: 600;
        }


        /* =========================================================
           VIDEO CONTENT
           ========================================================= */

        .video-content {

            padding: 26px;
        }


        /* =========================================================
           VIDEO TITLE
           ========================================================= */

        .video-title {

            color: #111827;

            font-family:
                'Playfair Display',
                Georgia,
                serif;

            font-size: 21px;

            font-weight: 700;

            line-height: 1.4;

            margin-bottom: 14px;
        }


        /* =========================================================
           META
           ========================================================= */

        .video-meta {

            display: flex;

            flex-wrap: wrap;

            gap: 7px;

            margin-bottom: 17px;
        }


        .badge {

            display: inline-flex;

            align-items: center;

            background:
                #eef2ff;

            color:
                #4338ca;

            padding: 6px 11px;

            border-radius: 20px;

            font-size: 12px;

            font-weight: 600;

            border:
                1px solid #e0e7ff;
        }


        .featured-badge {

            background:
                #fffbeb;

            color:
                #b45309;

            border-color:
                #fde68a;
        }


        /* =========================================================
           DESCRIPTION
           ========================================================= */

        .description {

            color: #6b7280;

            font-size: 14px;

            line-height: 1.7;

            margin-bottom: 18px;
        }


        /* =========================================================
           VIDEO INFORMATION
           ========================================================= */

        .video-info {

            padding: 14px 15px;

            margin-bottom: 18px;

            background:
                #f8faff;

            border-left:
                3px solid #4f46e5;

            border-radius: 10px;

            color: #6b7280;

            font-size: 13px;

            line-height: 1.9;
        }


        .video-info strong {

            color: #374151;
        }


        /* =========================================================
           TOPICS
           ========================================================= */

        .topics {

            margin-bottom: 20px;
        }


        .topic {

            display: inline-block;

            padding: 6px 9px;

            margin: 2px;

            background:
                #f8fafc;

            color:
                #475569;

            border:
                1px solid #e2e8f0;

            border-radius: 7px;

            font-size: 12px;

            transition: .2s;
        }


        .topic:hover {

            color:
                #4338ca;

            background:
                #eef2ff;

            border-color:
                #c7d2fe;
        }


        /* =========================================================
           WATCH BUTTON
           ========================================================= */

        .watch-button {

            width: 100%;

            display: flex;

            align-items: center;

            justify-content: center;

            padding: 13px 18px;

            background:
                #4f46e5;

            color: white;

            border-radius: 10px;

            font-size: 14px;

            font-weight: 700;

            box-shadow:
                0 5px 12px
                rgba(79,70,229,.16);

            transition: .2s;
        }


        .watch-button:hover {

            background:
                #4338ca;

            transform:
                translateY(-1px);

            box-shadow:
                0 8px 18px
                rgba(79,70,229,.23);
        }


        /* =========================================================
           NO VIDEOS
           ========================================================= */

        .no-videos {

            background: white;

            padding: 70px 30px;

            text-align: center;

            border-radius: 22px;

            border:
                1px solid
                var(--hairline);

            box-shadow:
                0 5px 20px
                rgba(17,24,39,.05);
        }


        .no-videos-icon {

            width: 64px;

            height: 64px;

            display: flex;

            align-items: center;

            justify-content: center;

            margin:
                0 auto 18px;

            background:
                #eef2ff;

            border-radius: 18px;

            font-size: 27px;
        }


        .no-videos h2 {

            font-family:
                'Playfair Display',
                Georgia,
                serif;

            color:
                #111827;

            font-size: 25px;

            margin-bottom: 10px;
        }


        .no-videos p {

            color:
                #6b7280;

            line-height: 1.6;
        }


        /* =========================================================
           FOOTER
           ========================================================= */

        .footer {

            background:
                linear-gradient(
                    135deg,
                    #0f172a,
                    #1e293b
                );

            color: white;

            margin-top: 80px;
        }


        .footer-container {

            max-width: 1200px;

            margin: auto;

            padding: 70px 40px;

            display: grid;

            grid-template-columns:
                2fr 1fr 1fr;

            gap: 70px;
        }


        .footer-brand h2 {

            font-size: 32px;

            margin-bottom: 18px;

            color: #38bdf8;
        }


        .footer-brand p {

            color: #cbd5e1;

            line-height: 1.8;

            margin-bottom: 30px;

            max-width: 420px;
        }


        .footer-section h3 {

            font-size: 20px;

            margin-bottom: 22px;

            position: relative;
        }


        .footer-section h3::after {

            content: "";

            width: 45px;

            height: 3px;

            background: #38bdf8;

            display: block;

            margin-top: 8px;

            border-radius: 10px;
        }


        .footer-section ul {

            list-style: none;

            padding: 0;

            margin: 0;
        }


        .footer-section li {

            margin-bottom: 14px;
        }


        .footer-section a {

            color: #cbd5e1;

            transition: .3s;
        }


        .footer-section a:hover {

            color: #38bdf8;

            padding-left: 8px;
        }


        .social-icons {

            display: flex;

            gap: 14px;
        }


        .social-icons a {

            width: 42px;

            height: 42px;

            border-radius: 50%;

            background:
                rgba(255,255,255,.08);

            display: flex;

            justify-content: center;

            align-items: center;

            color: white;

            transition: .35s;

            font-size: 17px;
        }


        .social-icons a:hover {

            background:
                #38bdf8;

            transform:
                translateY(-6px);
        }


        .footer-bottom {

            border-top:
                1px solid
                rgba(255,255,255,.12);

            max-width: 1200px;

            margin: auto;

            padding: 22px 40px;

            display: flex;

            justify-content: space-between;

            align-items: center;

            color: #94a3b8;

            font-size: 15px;
        }


        /* =========================================================
           TABLET
           ========================================================= */

        @media (max-width: 1100px) {

            .header {

                padding:
                    18px 30px;
            }


            .header nav {

                gap: 18px;
            }


            .header nav a {

                font-size: 14px;
            }


            .video-grid {

                grid-template-columns: 1fr;
            }
        }


        /* =========================================================
           MOBILE
           ========================================================= */

        @media (max-width: 700px) {

            .header {

                flex-direction: column;

                gap: 15px;

                padding:
                    18px 20px;
            }


            .header nav {

                flex-wrap: wrap;

                justify-content: center;

                gap: 15px;
            }


            .header-right {

                justify-content: center;
            }


            .main {

                padding:
                    45px 20px 0;
            }


            .video-section {

                padding:
                    0 20px;

                margin-top: 45px;
            }


            .intro h1 {

                font-size: 34px;
            }


            .intro > p {

                font-size: 15px;
            }


            .section-header {

                display: block;
            }


            .youtube-area {

                height: 220px;
            }


            .video-content {

                padding: 22px;
            }


            .footer-container {

                grid-template-columns:
                    1fr;

                text-align: center;

                padding:
                    60px 25px;

                gap: 45px;
            }


            .footer-brand p {

                max-width: 100%;
            }


            .footer-section h3::after {

                margin:
                    8px auto 0;
            }


            .social-icons {

                justify-content: center;
            }


            .footer-bottom {

                flex-direction: column;

                text-align: center;

                gap: 10px;

                padding:
                    20px;
            }
        }


        /* =========================================================
           SMALL MOBILE
           ========================================================= */

        @media (max-width: 450px) {

            .logo {

                font-size: 20px;
            }


            .header nav {

                gap: 11px;
            }


            .header nav a {

                font-size: 13px;
            }


            .notification {

                font-size: 18px;
            }


            .logout-btn {

                padding:
                    8px 15px;

                font-size: 13px;
            }


            .intro h1 {

                font-size: 30px;
            }


            .youtube-area {

                height: 195px;
            }


            .youtube-watch-btn {

                width: 66px;

                height: 66px;

                font-size: 23px;
            }


            .video-title {

                font-size: 19px;
            }
        }

    </style>

</head>


<body>

<form
    id="form1"
    runat="server">


    <!-- =========================================================
         HEADER / NAVBAR
         SAME AS ABOUT PAGE
         ========================================================= -->

    <header class="header">


        <!-- LOGO -->

        <div class="logo">

            📘 StudyVault

        </div>


        <!-- NAVIGATION -->

        <nav>

            <a href="Dashboard.aspx">
                Home
            </a>

            <a href="About.aspx">
                About
            </a>

            <a href="Resources.aspx"
               class="active">
                Resources
            </a>

            <a href="Categories.aspx">
                Categories
            </a>

            <a href="Favorites.aspx">
                Favorites
            </a>

            <a href="ASSIGNMENTCLINIC.aspx">
                Assignments
            </a>

            <a href="Feedback.aspx">
                Feedback
            </a>

        </nav>


        <!-- RIGHT SIDE -->

        <div class="header-right">


            <!-- Notification -->

            <div class="notification">

                🔔

                <span>
                    3
                </span>

            </div>


            <!-- User -->

            <div class="user">


                <!-- Keep your existing server-side avatar -->

                <div
                    id="avatarCircle"
                    runat="server"
                    class="avatar-circle">
                </div>


                <!-- Logout -->

                <button
                    type="button"
                    class="logout-btn"
                    onclick="window.location.href='Login.aspx'">

                    Logout

                </button>


            </div>

        </div>

    </header>


    <!-- =========================================================
         PAGE INTRO
         ========================================================= -->

    <main>


        <div class="main">


            <div class="intro">


                <div class="eyebrow">

                    Learning Resources

                </div>


                <h1>

                    Video Tutorials

                </h1>


                <p>

                    Learn through our collection of educational
                    video tutorials and strengthen your understanding
                    of important concepts.

                </p>


            </div>


            <div class="hero-rule"></div>


        </div>


        <!-- =====================================================
             VIDEO SECTION
             ===================================================== -->

        <section class="video-section">


            <div class="section-header">


                <div class="section-header-left">


                    <div class="section-label">

                        Study &amp; Learn

                    </div>


                    <h2>

                        Explore Video Tutorials

                    </h2>


                    <p>

                        Browse tutorials by subject, level,
                        duration, and topic.

                    </p>


                </div>


            </div>


            <!-- =================================================
                 NO VIDEOS
                 ================================================= -->

            <asp:Panel
                ID="pnlNoVideos"
                runat="server"
                Visible="false"
                CssClass="no-videos">


                <div class="no-videos-icon">

                    🎥

                </div>


                <h2>

                    No Video Tutorials Available

                </h2>


                <p>

                    Video tutorials will appear here once they
                    are added by the administrator.

                </p>


            </asp:Panel>


            <!-- =================================================
                 VIDEO REPEATER
                 ================================================= -->

            <asp:Repeater
                ID="rptVideos"
                runat="server">


                <HeaderTemplate>

                    <div class="video-grid">

                </HeaderTemplate>


                <ItemTemplate>


                    <!-- VIDEO CARD -->

                    <article class="video-card">


                        <!-- =====================================
                             VIDEO PREVIEW
                             ===================================== -->

                        <div class="youtube-area">


                            <a
                                href='<%# Eval("YouTubeUrl") %>'
                                target="_blank"
                                rel="noopener noreferrer"
                                class="youtube-watch-btn"
                                aria-label="Watch <%# Eval("Title") %>">


                                ▶


                            </a>


                            <div class="youtube-label">

                                ▶&nbsp; YouTube Tutorial

                            </div>


                        </div>


                        <!-- =====================================
                             CONTENT
                             ===================================== -->

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


                                <!-- FEATURED -->

                                <asp:Label
                                    ID="lblFeatured"
                                    runat="server"
                                    Visible='<%# Convert.ToBoolean(Eval("IsFeatured")) %>'
                                    CssClass="badge featured-badge"
                                    Text="Featured" />


                            </div>


                            <!-- DESCRIPTION -->

                            <div class="description">

                                <%# Eval("Description") %>

                            </div>


                            <!-- VIDEO INFORMATION -->

                            <div class="video-info">


                                <strong>
                                    Instructor:
                                </strong>

                                <%# Eval("Instructor") %>


                                <br />


                                <strong>
                                    Added:
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


                            <!-- WATCH BUTTON -->

                            <a
                                href='<%# Eval("YouTubeUrl") %>'
                                target="_blank"
                                rel="noopener noreferrer"
                                class="watch-button">


                                ▶&nbsp;&nbsp;
                                Watch Video on YouTube


                            </a>


                        </div>


                    </article>


                </ItemTemplate>


                <FooterTemplate>

                    </div>

                </FooterTemplate>


            </asp:Repeater>


        </section>


    </main>


    <!-- =========================================================
         FOOTER
         ========================================================= -->

    <footer class="footer">


        <div class="footer-container">


            <!-- BRAND -->

            <div class="footer-brand">


                <h2>

                    📘 StudyVault

                </h2>


                <p>

                    Your smart learning companion providing
                    quality study notes, research papers,
                    assignments, and educational resources
                    to help students achieve academic success.

                </p>


                <div class="social-icons">


                    <a href="#"
                       aria-label="Facebook">

                        f

                    </a>


                    <a href="#"
                       aria-label="Twitter">

                        𝕏

                    </a>


                    <a href="#"
                       aria-label="Instagram">

                        ◎

                    </a>


                    <a href="#"
                       aria-label="LinkedIn">

                        in

                    </a>


                    <a href="#"
                       aria-label="GitHub">

                        ◉

                    </a>


                </div>


            </div>


            <!-- QUICK LINKS -->

            <div class="footer-section">


                <h3>

                    Quick Links

                </h3>


                <ul>

                    <li>
                        <a href="Dashboard.aspx">
                            Home
                        </a>
                    </li>

                    <li>
                        <a href="StudentNotes.aspx">
                            Study Notes
                        </a>
                    </li>

                    <li>
                        <a href="Resources.aspx">
                            Research Papers
                        </a>
                    </li>

                    <li>
                        <a href="ASSIGNMENTCLINIC.aspx">
                            Assignment Clinic
                        </a>
                    </li>

                    <li>
                        <a href="VideoTutorials.aspx">
                            Video Tutorials
                        </a>
                    </li>

                </ul>

            </div>


            <!-- SUPPORT -->

            <div class="footer-section">


                <h3>

                    Support

                </h3>


                <ul>

                    <li>
                        <a href="Feedback.aspx">
                            Help Center
                        </a>
                    </li>

                    <li>
                        <a href="#">
                            Privacy Policy
                        </a>
                    </li>

                    <li>
                        <a href="#">
                            Terms &amp; Conditions
                        </a>
                    </li>

                    <li>
                        <a href="Feedback.aspx">
                            Contact Us
                        </a>
                    </li>

                    <li>
                        <a href="#">
                            FAQs
                        </a>
                    </li>

                </ul>

            </div>


        </div>


        <!-- FOOTER BOTTOM -->

        <div class="footer-bottom">


            <p>

                © 2026 StudyVault.
                All Rights Reserved.

            </p>


            <p>

                Made with ❤️ for Students

            </p>


        </div>


    </footer>


</form>

</body>

</html>
