<%@ Page Title="Research Papers - StudyVault" Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Research Papers - StudyVault</title>

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect"
          href="https://fonts.gstatic.com"
          crossorigin />

    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&display=swap"
          rel="stylesheet" />

    <style>

        /* =====================================================
           RESET
           ===================================================== */

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;

            background:
                radial-gradient(
                    1100px 500px at 50% -150px,
                    rgba(139, 92, 246, .06),
                    transparent 60%
                ),
                #f6f8ff;

            color: #111827;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        button,
        input {
            font-family: inherit;
        }

        a:focus-visible,
        button:focus-visible,
        input:focus-visible {
            outline: 3px solid #4f46e5;
            outline-offset: 2px;
        }


        /* =====================================================
           COLOR SYSTEM
           ===================================================== */

        :root {

            --primary: #4f46e5;
            --primary-dark: #4338ca;

            --purple: #8b5cf6;
            --blue: #3b82f6;

            --cyan: #06b6d4;
            --green: #10b981;
            --orange: #f59e0b;

            --text: #111827;
            --muted: #6b7280;
            --light-muted: #94a3b8;

            --border: rgba(17, 24, 39, .08);

            --card: #ffffff;

            --primary-tint: #eef2ff;
            --purple-tint: #f5f3ff;
            --blue-tint: #eff6ff;
            --cyan-tint: #ecfeff;
            --green-tint: #ecfdf5;
            --orange-tint: #fffbeb;
        }


        /* =====================================================
           HEADER / NAVIGATION
           ===================================================== */

        .header {

            position: sticky;

            top: 0;

            z-index: 1000;

            display: flex;

            justify-content: space-between;

            align-items: center;

            padding: 18px 60px;

            background: rgba(255, 255, 255, .97);

            backdrop-filter: blur(12px);

            box-shadow:
                0 4px 20px rgba(17, 24, 39, .06);
        }


        /* LOGO */

        .logo {

            display: flex;

            align-items: center;

            gap: 10px;

            font-size: 22px;

            font-weight: 800;

            color: var(--primary);

            white-space: nowrap;
        }


        .logo-icon {

            width: 34px;

            height: 34px;

            border-radius: 10px;

            display: flex;

            align-items: center;

            justify-content: center;

            background:
                linear-gradient(
                    135deg,
                    #4f46e5,
                    #8b5cf6
                );

            color: white;

            font-size: 17px;

            box-shadow:
                0 6px 15px rgba(79, 70, 229, .20);
        }


        /* NAV */

        .header nav {

            display: flex;

            align-items: center;

            gap: 28px;
        }

        .header nav a {

            color: #6b7280;

            font-size: 15px;

            font-weight: 600;

            padding-bottom: 5px;

            border-bottom: 2px solid transparent;

            transition: .2s;
        }

        .header nav a:hover {

            color: #111827;

            border-bottom-color: #c7d2fe;
        }

        .header nav a.active {

            color: var(--primary);

            border-bottom-color: var(--primary);
        }


        /* HEADER RIGHT */

        .header-right {

            display: flex;

            align-items: center;

            gap: 18px;

            flex-shrink: 0;
        }


        /* NOTIFICATION */

        .notification {

            position: relative;

            width: 28px;

            height: 28px;

            display: flex;

            align-items: center;

            justify-content: center;

            font-size: 20px;
        }

        .notification span {

            position: absolute;

            top: -5px;

            right: -7px;

            width: 17px;

            height: 17px;

            border-radius: 50%;

            display: flex;

            align-items: center;

            justify-content: center;

            background: #ef4444;

            color: white;

            font-size: 10px;

            font-weight: 700;
        }


        /* USER */

        .user {

            display: flex;

            align-items: center;

            gap: 12px;
        }

        .avatar {

            width: 36px;

            height: 36px;

            border-radius: 50%;

            display: flex;

            align-items: center;

            justify-content: center;

            background:
                linear-gradient(
                    135deg,
                    #4f46e5,
                    #8b5cf6
                );

            color: white;

            font-size: 13px;

            font-weight: 700;

            box-shadow:
                0 5px 12px rgba(79, 70, 229, .20);
        }


        /* LOGOUT */

        .logout {

            border: none;

            background: #f3f4f6;

            color: #374151;

            padding: 9px 18px;

            border-radius: 20px;

            font-size: 14px;

            font-weight: 600;

            cursor: pointer;

            transition: .2s;
        }

        .logout:hover {

            background: #fee2e2;

            color: #dc2626;
        }


        /* =====================================================
           MAIN
           ===================================================== */

        .main {

            max-width: 1200px;

            margin: 0 auto;

            padding: 65px 60px 90px;
        }


        /* =====================================================
           PAGE INTRO
           ===================================================== */

        .page-intro {

            text-align: center;

            max-width: 760px;

            margin: 0 auto 42px;
        }

        .eyebrow {

            text-transform: uppercase;

            letter-spacing: 1.6px;

            font-size: 12px;

            font-weight: 700;

            color: var(--primary);

            margin-bottom: 9px;
        }

        .page-intro h1 {

            font-family:
                'Playfair Display',
                Georgia,
                serif;

            font-size: 40px;

            font-weight: 700;

            letter-spacing: -.5px;

            color: #111827;

            margin-bottom: 14px;
        }

        .page-intro p {

            color: #6b7280;

            font-size: 16px;

            line-height: 1.7;
        }


        /* DECORATIVE LINE */

        .hero-rule {

            width: 64px;

            height: 4px;

            border-radius: 4px;

            background:
                linear-gradient(
                    90deg,
                    #4f46e5,
                    #8b5cf6,
                    #3b82f6
                );

            margin: 24px auto 0;
        }


        /* =====================================================
           SEARCH
           ===================================================== */

        .search-wrapper {

            margin-bottom: 38px;

            background: white;

            border: 1px solid var(--border);

            border-radius: 20px;

            padding: 10px;

            box-shadow:
                0 8px 25px rgba(17, 24, 39, .04);
        }

        .search {

            display: flex;

            align-items: center;

            gap: 10px;
        }

        .search-icon {

            width: 46px;

            height: 46px;

            border-radius: 13px;

            background: var(--primary-tint);

            color: var(--primary);

            display: flex;

            align-items: center;

            justify-content: center;

            font-size: 19px;

            flex-shrink: 0;
        }

        .search input {

            flex: 1;

            border: none;

            outline: none;

            background: transparent;

            padding: 12px 10px;

            color: #111827;

            font-size: 14px;
        }

        .search input::placeholder {

            color: #9ca3af;
        }

        .search button {

            border: none;

            background:
                linear-gradient(
                    135deg,
                    #4f46e5,
                    #6366f1
                );

            color: white;

            padding: 12px 24px;

            border-radius: 12px;

            font-size: 14px;

            font-weight: 700;

            cursor: pointer;

            box-shadow:
                0 6px 14px rgba(79, 70, 229, .20);

            transition: .2s;
        }

        .search button:hover {

            background:
                linear-gradient(
                    135deg,
                    #4338ca,
                    #4f46e5
                );

            transform: translateY(-1px);

            box-shadow:
                0 9px 18px rgba(79, 70, 229, .25);
        }


        /* =====================================================
           SECTION HEADER
           ===================================================== */

        .section-header {

            display: flex;

            justify-content: space-between;

            align-items: end;

            margin-bottom: 18px;
        }

        .section-header h2 {

            font-family:
                'Playfair Display',
                Georgia,
                serif;

            font-size: 25px;

            color: #111827;
        }

        .section-header p {

            color: #94a3b8;

            font-size: 13px;
        }


        /* =====================================================
           RESEARCH LIST
           ===================================================== */

        .research-list {

            display: flex;

            flex-direction: column;

            gap: 17px;
        }


        /* =====================================================
           RESEARCH CARD
           ===================================================== */

        .research-card {

            position: relative;

            display: flex;

            align-items: center;

            gap: 20px;

            background: white;

            border: 1px solid var(--border);

            border-radius: 20px;

            padding: 23px;

            overflow: hidden;

            transition:
                transform .25s ease,
                box-shadow .25s ease,
                border-color .25s ease;
        }

        .research-card::before {

            content: "";

            position: absolute;

            left: 0;

            top: 0;

            bottom: 0;

            width: 4px;

            background:
                linear-gradient(
                    180deg,
                    #4f46e5,
                    #8b5cf6
                );

            opacity: 0;

            transition: .25s;
        }

        .research-card:hover {

            transform: translateY(-4px);

            border-color: #c7d2fe;

            box-shadow:
                0 16px 35px rgba(79, 70, 229, .09);
        }

        .research-card:hover::before {

            opacity: 1;
        }


        /* PAPER ICON */

        .paper-icon {

            width: 56px;

            height: 56px;

            border-radius: 15px;

            display: flex;

            align-items: center;

            justify-content: center;

            background:
                linear-gradient(
                    135deg,
                    #eef2ff,
                    #f5f3ff
                );

            border: 1px solid #e0e7ff;

            font-size: 23px;

            flex-shrink: 0;

            transition: .25s;
        }

        .research-card:hover .paper-icon {

            transform: scale(1.05);

            box-shadow:
                0 7px 15px rgba(79, 70, 229, .10);
        }


        /* INFO */

        .research-info {

            flex: 1;

            min-width: 0;
        }

        .research-info h3 {

            color: #111827;

            font-size: 17px;

            font-weight: 700;

            margin-bottom: 7px;
        }

        .research-info p {

            color: #6b7280;

            font-size: 13.5px;

            line-height: 1.6;

            margin-bottom: 9px;

            max-width: 780px;
        }


        /* META */

        .meta {

            display: flex;

            align-items: center;

            flex-wrap: wrap;

            gap: 7px;
        }

        .meta-tag {

            display: inline-flex;

            align-items: center;

            background: #f1f5f9;

            color: #64748b;

            border: 1px solid #e2e8f0;

            padding: 5px 9px;

            border-radius: 8px;

            font-size: 11px;

            font-weight: 600;
        }

        .meta-tag.subject {

            background: #eef2ff;

            color: #4338ca;

            border-color: #e0e7ff;
        }


        /* VIEW BUTTON */

        .view-btn {

            display: inline-flex;

            align-items: center;

            justify-content: center;

            gap: 7px;

            background:
                linear-gradient(
                    135deg,
                    #4f46e5,
                    #6366f1
                );

            color: white;

            padding: 11px 18px;

            border-radius: 11px;

            font-size: 13px;

            font-weight: 700;

            white-space: nowrap;

            box-shadow:
                0 5px 12px rgba(79, 70, 229, .16);

            transition: .2s;
        }

        .view-btn:hover {

            background:
                linear-gradient(
                    135deg,
                    #4338ca,
                    #4f46e5
                );

            transform: translateY(-2px);

            box-shadow:
                0 8px 17px rgba(79, 70, 229, .23);
        }


        /* =====================================================
           EMPTY / INFORMATION PANEL
           ===================================================== */

        .info-panel {

            margin-top: 35px;

            padding: 30px;

            text-align: center;

            background:
                linear-gradient(
                    135deg,
                    #eef2ff,
                    #f5f3ff
                );

            border: 1px solid #e0e7ff;

            border-radius: 20px;
        }

        .info-panel-icon {

            width: 46px;

            height: 46px;

            margin: 0 auto 13px;

            border-radius: 14px;

            display: flex;

            align-items: center;

            justify-content: center;

            background: white;

            font-size: 20px;

            box-shadow:
                0 6px 15px rgba(79, 70, 229, .08);
        }

        .info-panel h3 {

            font-family:
                'Playfair Display',
                Georgia,
                serif;

            font-size: 20px;

            margin-bottom: 7px;
        }

        .info-panel p {

            color: #64748b;

            font-size: 13.5px;

            line-height: 1.6;
        }


        /* =====================================================
           FOOTER
           ===================================================== */

        .footer {

            background:
                linear-gradient(
                    135deg,
                    #0f172a,
                    #1e293b
                );

            color: white;

            margin-top: 30px;
        }

        .footer-container {

            max-width: 1200px;

            margin: auto;

            padding: 65px 40px;

            display: grid;

            grid-template-columns: 2fr 1fr 1fr;

            gap: 65px;
        }


        /* FOOTER BRAND */

        .footer-brand h2 {

            font-size: 29px;

            margin-bottom: 17px;

            color: #38bdf8;
        }

        .footer-brand p {

            color: #cbd5e1;

            max-width: 420px;

            line-height: 1.8;

            font-size: 14px;

            margin-bottom: 25px;
        }


        /* FOOTER HEADINGS */

        .footer-section h3 {

            font-size: 18px;

            margin-bottom: 20px;
        }

        .footer-section h3::after {

            content: "";

            display: block;

            width: 42px;

            height: 3px;

            border-radius: 5px;

            background: #38bdf8;

            margin-top: 8px;
        }


        /* FOOTER LINKS */

        .footer-section ul {

            list-style: none;
        }

        .footer-section li {

            margin-bottom: 12px;
        }

        .footer-section a {

            color: #cbd5e1;

            font-size: 14px;

            transition: .25s;
        }

        .footer-section a:hover {

            color: #38bdf8;

            padding-left: 6px;
        }


        /* SOCIAL */

        .social-icons {

            display: flex;

            gap: 11px;
        }

        .social-icons a {

            width: 39px;

            height: 39px;

            border-radius: 50%;

            display: flex;

            align-items: center;

            justify-content: center;

            background: rgba(255,255,255,.08);

            color: white;

            transition: .25s;
        }

        .social-icons a:hover {

            background: #38bdf8;

            transform: translateY(-4px);
        }


        /* FOOTER BOTTOM */

        .footer-bottom {

            max-width: 1200px;

            margin: auto;

            padding: 21px 40px;

            border-top:
                1px solid rgba(255,255,255,.10);

            display: flex;

            justify-content: space-between;

            align-items: center;

            color: #94a3b8;

            font-size: 13px;
        }


        /* =====================================================
           TABLET
           ===================================================== */

        @media(max-width: 1100px) {

            .header {

                padding-left: 30px;

                padding-right: 30px;
            }

            .header nav {

                gap: 17px;
            }

            .header nav a {

                font-size: 13px;
            }

            .main {

                padding-left: 35px;

                padding-right: 35px;
            }
        }


        /* =====================================================
           MOBILE / TABLET
           ===================================================== */

        @media(max-width: 850px) {

            .header {

                flex-wrap: wrap;

                justify-content: center;

                gap: 16px;

                padding: 16px 20px;
            }

            .logo {

                width: 100%;

                justify-content: center;
            }

            .header nav {

                order: 3;

                width: 100%;

                justify-content: center;

                flex-wrap: wrap;

                gap: 15px;
            }

            .header-right {

                position: absolute;

                right: 20px;

                top: 16px;
            }

            .research-card {

                align-items: flex-start;
            }

            .footer-container {

                grid-template-columns: 1fr 1fr;

                gap: 45px;
            }

            .footer-brand {

                grid-column: 1 / 3;
            }
        }


        /* =====================================================
           SMALL MOBILE
           ===================================================== */

        @media(max-width: 600px) {

            .header {

                padding: 15px 16px;
            }

            .logo {

                justify-content: flex-start;

                width: auto;

                margin-right: auto;
            }

            .logo-icon {

                width: 30px;

                height: 30px;
            }

            .header-right {

                position: static;

                gap: 9px;
            }

            .notification {

                font-size: 18px;
            }

            .avatar {

                width: 33px;

                height: 33px;
            }

            .logout {

                padding: 8px 13px;

                font-size: 12px;
            }

            .header nav {

                display: none;
            }

            .main {

                padding: 45px 20px 65px;
            }

            .page-intro h1 {

                font-size: 31px;
            }

            .page-intro p {

                font-size: 14px;
            }

            .search {

                gap: 5px;
            }

            .search-icon {

                display: none;
            }

            .search input {

                min-width: 0;

                font-size: 13px;
            }

            .search button {

                padding: 11px 16px;

                font-size: 13px;
            }

            .section-header {

                display: block;
            }

            .section-header h2 {

                margin-bottom: 5px;
            }

            .research-card {

                flex-direction: column;

                gap: 15px;

                padding: 20px;
            }

            .paper-icon {

                width: 48px;

                height: 48px;
            }

            .view-btn {

                width: 100%;
            }

            .footer-container {

                grid-template-columns: 1fr;

                text-align: center;

                padding: 55px 25px;
            }

            .footer-brand {

                grid-column: auto;
            }

            .footer-brand p {

                max-width: 100%;
            }

            .footer-section h3::after {

                margin-left: auto;

                margin-right: auto;
            }

            .social-icons {

                justify-content: center;
            }

            .footer-bottom {

                flex-direction: column;

                text-align: center;

                gap: 8px;

                padding: 20px;
            }
        }

    </style>

</head>


<body>

<form id="form1" runat="server">


    <!-- =====================================================
         HEADER
         ===================================================== -->

    <header class="header">


        <!-- LOGO -->

        <div class="logo">

            <span class="logo-icon">📖</span>

            <span>
                StudyVault
            </span>

        </div>


        <!-- NAVIGATION -->

        <nav>

            <a href="Dashboard.aspx">
                Home
            </a>

            <a href="About.aspx">
                About
            </a>

            <a href="Resources.aspx">
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


            <a href="Notifications.aspx"
               class="notification">

                🔔

                <span>
                    3
                </span>

            </a>


            <div class="user">

                <div class="avatar">

                    S

                </div>


                <button
                    type="button"
                    class="logout"
                    onclick="window.location.href='Login.aspx'">

                    Logout

                </button>

            </div>

        </div>

    </header>



    <!-- =====================================================
         MAIN CONTENT
         ===================================================== -->

    <main class="main">


        <!-- PAGE INTRO -->

        <div class="page-intro">

            <div class="eyebrow">
                Student Research
            </div>

            <h1>
                Research Papers
            </h1>

            <p>
                Explore academic research papers and references
                that can support your coursework, projects,
                assignments and further learning.
            </p>

            <div class="hero-rule"></div>

        </div>



        <!-- =================================================
             SEARCH
             ================================================= -->

        <div class="search-wrapper">

            <div class="search">

                <div class="search-icon">
                    🔎
                </div>

                <input
                    type="text"
                    placeholder="Search research papers..." />

                <button type="button">
                    Search
                </button>

            </div>

        </div>



        <!-- =================================================
             RESEARCH SECTION
             ================================================= -->

        <div class="section-header">

            <div>

                <h2>
                    Available Research
                </h2>

            </div>

            <p>
                Explore academic materials
            </p>

        </div>



        <!-- =================================================
             RESEARCH LIST
             ================================================= -->

        <div class="research-list">


            <!-- CARD 1 -->

            <div class="research-card">


                <div class="paper-icon">
                    📄
                </div>


                <div class="research-info">

                    <h3>
                        Gamification in Digital Learning
                    </h3>

                    <p>
                        Research exploring how gamification
                        elements can improve student engagement
                        and learning experiences.
                    </p>


                    <div class="meta">

                        <span class="meta-tag subject">
                            Information Technology
                        </span>

                        <span class="meta-tag">
                            2026
                        </span>

                        <span class="meta-tag">
                            Research Paper
                        </span>

                    </div>

                </div>


                <a href="#"
                   class="view-btn">

                    View Paper →
                    
                </a>

            </div>



            <!-- CARD 2 -->

            <div class="research-card">


                <div class="paper-icon">
                    📄
                </div>


                <div class="research-info">

                    <h3>
                        Human Computer Interaction and Usability
                    </h3>

                    <p>
                        Academic research related to usability,
                        interface design and user-centred
                        system development.
                    </p>


                    <div class="meta">

                        <span class="meta-tag subject">
                            HCI
                        </span>

                        <span class="meta-tag">
                            2026
                        </span>

                        <span class="meta-tag">
                            Research Paper
                        </span>

                    </div>

                </div>


                <a href="#"
                   class="view-btn">

                    View Paper →

                </a>

            </div>



            <!-- CARD 3 -->

            <div class="research-card">


                <div class="paper-icon">
                    📄
                </div>


                <div class="research-info">

                    <h3>
                        Digital Learning Platforms
                    </h3>

                    <p>
                        Research examining digital platforms
                        and their role in supporting students
                        and academic learning.
                    </p>


                    <div class="meta">

                        <span class="meta-tag subject">
                            E-Learning
                        </span>

                        <span class="meta-tag">
                            2026
                        </span>

                        <span class="meta-tag">
                            Research Paper
                        </span>

                    </div>

                </div>


                <a href="#"
                   class="view-btn">

                    View Paper →

                </a>

            </div>



            <!-- CARD 4 -->

            <div class="research-card">


                <div class="paper-icon">
                    📄
                </div>


                <div class="research-info">

                    <h3>
                        User Experience in Educational Applications
                    </h3>

                    <p>
                        Study of user experience principles
                        used in educational applications
                        and digital services.
                    </p>


                    <div class="meta">

                        <span class="meta-tag subject">
                            UX Design
                        </span>

                        <span class="meta-tag">
                            2026
                        </span>

                        <span class="meta-tag">
                            Research Paper
                        </span>

                    </div>

                </div>


                <a href="#"
                   class="view-btn">

                    View Paper →

                </a>

            </div>


        </div>



        <!-- =================================================
             INFO PANEL
             ================================================= -->

        <div class="info-panel">

            <div class="info-panel-icon">
                🎓
            </div>

            <h3>
                Keep Exploring
            </h3>

            <p>
                Discover more academic resources, study materials
                and research content through StudyVault.
            </p>

        </div>


    </main>



    <!-- =====================================================
         FOOTER
         ===================================================== -->

    <footer class="footer">


        <div class="footer-container">


            <!-- BRAND -->

            <div class="footer-brand">

                <h2>
                    📖 StudyVault
                </h2>

                <p>
                    Your smart learning companion providing
                    quality study notes, research papers,
                    assignments, video tutorials and educational
                    resources to help students achieve academic
                    success.
                </p>


                <div class="social-icons">

                    <a href="#">
                        f
                    </a>

                    <a href="#">
                        𝕏
                    </a>

                    <a href="#">
                        ◎
                    </a>

                    <a href="#">
                        in
                    </a>

                    <a href="#">
                        ◇
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
                        <a href="ResearchPapers.aspx">
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
                        <a href="#">
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
                © 2026 StudyVault. All Rights Reserved.
            </p>

            <p>
                Made with ❤️ for Students
            </p>

        </div>


    </footer>


</form>

</body>
</html>
