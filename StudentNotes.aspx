<%@ Page Title="Study Notes - StudyVault" Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Study Notes - StudyVault</title>

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,600;0,700;1,600&display=swap"
          rel="stylesheet" />

    <style>

        /* ==============================
           RESET
           ============================== */

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
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
        }

        button {
            font-family: inherit;
        }


        /* ==============================
           COLOUR VARIABLES
           ============================== */

        :root {

            --purple: #4f46e5;
            --purple-dark: #4338ca;
            --purple-light: #eef2ff;

            --blue: #3b82f6;
            --cyan: #06b6d4;
            --green: #10b981;
            --violet: #8b5cf6;
            --orange: #f59e0b;

            --text: #111827;
            --muted: #6b7280;
            --light-border: rgba(17, 24, 39, .08);

        }


        /* ==============================
           HEADER / NAVBAR
           ============================== */

        .header {

            position: sticky;
            top: 0;
            z-index: 1000;

            display: flex;
            justify-content: space-between;
            align-items: center;

            padding: 18px 60px;

            background: rgba(255, 255, 255, .96);

            box-shadow:
                0 4px 20px rgba(17, 24, 39, .06);

            backdrop-filter: blur(10px);

        }


        /* ==============================
           LOGO
           ============================== */

        .logo {

            display: flex;
            align-items: center;

            gap: 10px;

            font-size: 22px;
            font-weight: 800;

            color: var(--purple);

            white-space: nowrap;

        }


        /* ==============================
           NAVIGATION
           ============================== */

        .header nav {

            display: flex;

            align-items: center;

            gap: 30px;

        }

        .header nav a {

            color: #6b7280;

            font-weight: 600;

            font-size: 15px;

            padding-bottom: 5px;

            border-bottom: 2px solid transparent;

            transition: .2s;

        }

        .header nav a:hover {

            color: #111827;

        }

        .header nav a.active {

            color: var(--purple);

            border-bottom-color: var(--purple);

        }


        /* ==============================
           HEADER RIGHT
           ============================== */

        .header-right {

            display: flex;

            align-items: center;

            gap: 18px;

            flex-shrink: 0;

        }


        /* Notification */

        .notification {

            position: relative;

            font-size: 20px;

            color: #374151;

            transition: .2s;

        }

        .notification:hover {

            transform: translateY(-2px);

        }

        .notification span {

            position: absolute;

            top: -6px;
            right: -9px;

            width: 17px;
            height: 17px;

            border-radius: 50%;

            background: #ef4444;

            color: white;

            display: flex;

            justify-content: center;

            align-items: center;

            font-size: 10px;

            font-weight: 700;

        }


        /* User */

        .user {

            display: flex;

            align-items: center;

            gap: 12px;

        }

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

            display: flex;

            align-items: center;
            justify-content: center;

            font-size: 13px;

            font-weight: 700;

            box-shadow:
                0 5px 14px rgba(79, 70, 229, .22);

        }


        /* Logout */

        .logout-btn {

            border: none;

            background: #f3f4f6;

            color: #374151;

            padding: 9px 18px;

            border-radius: 20px;

            font-weight: 600;

            font-size: 14px;

            cursor: pointer;

            white-space: nowrap;

            transition: .2s;

        }

        .logout-btn:hover {

            background: #fee2e2;

            color: #dc2626;

            transform: translateY(-1px);

        }


        /* ==============================
           MAIN
           ============================== */

        .main {

            max-width: 1200px;

            margin: 0 auto;

            padding: 60px 60px 90px;

        }


        /* ==============================
           INTRO
           ============================== */

        .intro {

            max-width: 760px;

            margin-bottom: 35px;

        }

        .eyebrow {

            text-transform: uppercase;

            letter-spacing: 1.5px;

            font-size: 12px;

            font-weight: 700;

            color: var(--purple);

            margin-bottom: 9px;

        }

        .intro h1 {

            font-family:
                'Playfair Display',
                Georgia,
                serif;

            font-size: 40px;

            font-weight: 700;

            letter-spacing: -.5px;

            color: #111827;

            margin-bottom: 12px;

        }

        .intro p {

            color: #6b7280;

            font-size: 16px;

            line-height: 1.7;

            max-width: 680px;

        }


        /* Decorative line */

        .hero-rule {

            width: 64px;

            height: 4px;

            border-radius: 5px;

            background:
                linear-gradient(
                    90deg,
                    #4f46e5,
                    #8b5cf6,
                    #3b82f6
                );

            margin-top: 22px;

        }


        /* ==============================
           SEARCH AREA
           ============================== */

        .search-wrapper {

            margin-bottom: 38px;

        }

        .search-bar {

            display: flex;

            align-items: center;

            gap: 10px;

            background: white;

            border: 1px solid var(--light-border);

            border-radius: 18px;

            padding: 10px;

            box-shadow:
                0 8px 25px rgba(17, 24, 39, .04);

            transition: .2s;

        }

        .search-bar:focus-within {

            border-color: #c7d2fe;

            box-shadow:
                0 10px 28px rgba(79, 70, 229, .09);

        }

        .search-icon {

            width: 42px;
            height: 42px;

            border-radius: 12px;

            background: #eef2ff;

            display: flex;

            justify-content: center;

            align-items: center;

            font-size: 18px;

            flex-shrink: 0;

        }

        .search-bar input {

            flex: 1;

            border: none;

            outline: none;

            padding: 12px 8px;

            font-family: inherit;

            font-size: 14px;

            color: #111827;

            min-width: 0;

        }

        .search-bar input::placeholder {

            color: #9ca3af;

        }

        .search-btn {

            border: none;

            background: var(--purple);

            color: white;

            padding: 12px 25px;

            border-radius: 12px;

            font-weight: 700;

            font-size: 14px;

            cursor: pointer;

            box-shadow:
                0 5px 14px rgba(79, 70, 229, .20);

            transition: .2s;

        }

        .search-btn:hover {

            background: var(--purple-dark);

            transform: translateY(-2px);

        }


        /* ==============================
           SECTION HEADER
           ============================== */

        .section-heading {

            display: flex;

            align-items: flex-end;

            justify-content: space-between;

            margin-bottom: 20px;

        }

        .section-heading h2 {

            font-family:
                'Playfair Display',
                Georgia,
                serif;

            font-size: 25px;

            color: #111827;

        }

        .section-heading span {

            color: #9ca3af;

            font-size: 13px;

        }


        /* ==============================
           NOTES GRID
           ============================== */

        .grid {

            display: grid;

            grid-template-columns:
                repeat(3, 1fr);

            gap: 20px;

        }


        /* ==============================
           CARD
           ============================== */

        .card {

            position: relative;

            background: white;

            border: 1px solid var(--light-border);

            border-radius: 19px;

            padding: 25px;

            overflow: hidden;

            transition:
                transform .25s ease,
                box-shadow .25s ease,
                border-color .25s ease;

        }

        .card::before {

            content: "";

            position: absolute;

            top: 0;
            left: 0;
            right: 0;

            height: 3px;

            background:
                linear-gradient(
                    90deg,
                    #4f46e5,
                    #8b5cf6
                );

            opacity: .85;

        }

        .card:hover {

            transform: translateY(-5px);

            border-color: #dbe2ff;

            box-shadow:
                0 16px 32px rgba(17, 24, 39, .08);

        }


        /* Different card colours */

        .card.blue::before {

            background:
                linear-gradient(
                    90deg,
                    #3b82f6,
                    #06b6d4
                );

        }

        .card.green::before {

            background:
                linear-gradient(
                    90deg,
                    #10b981,
                    #06b6d4
                );

        }

        .card.violet::before {

            background:
                linear-gradient(
                    90deg,
                    #8b5cf6,
                    #4f46e5
                );

        }

        .card.orange::before {

            background:
                linear-gradient(
                    90deg,
                    #f59e0b,
                    #f97316
                );

        }


        /* ==============================
           ICON
           ============================== */

        .icon {

            width: 48px;
            height: 48px;

            border-radius: 14px;

            background: #eef2ff;

            display: flex;

            align-items: center;
            justify-content: center;

            font-size: 21px;

            margin-bottom: 18px;

        }

        .blue .icon {

            background: #eff6ff;

        }

        .green .icon {

            background: #ecfdf5;

        }

        .violet .icon {

            background: #f5f3ff;

        }

        .orange .icon {

            background: #fffbeb;

        }


        /* ==============================
           CARD CONTENT
           ============================== */

        .card h3 {

            font-size: 17px;

            color: #111827;

            margin-bottom: 9px;

            line-height: 1.4;

        }

        .card p {

            color: #6b7280;

            font-size: 13.5px;

            line-height: 1.65;

            margin-bottom: 17px;

        }


        /* ==============================
           META
           ============================== */

        .meta {

            display: flex;

            flex-wrap: wrap;

            gap: 7px;

            margin-bottom: 18px;

        }

        .meta span {

            background: #f8fafc;

            border: 1px solid #e2e8f0;

            color: #64748b;

            padding: 5px 9px;

            border-radius: 20px;

            font-size: 11px;

            font-weight: 600;

        }


        /* ==============================
           VIEW BUTTON
           ============================== */

        .view-btn {

            display: inline-flex;

            align-items: center;

            justify-content: center;

            width: 100%;

            background: #eef2ff;

            color: #4338ca;

            padding: 11px 16px;

            border-radius: 11px;

            font-size: 13px;

            font-weight: 700;

            transition: .2s;

        }

        .view-btn:hover {

            background: var(--purple);

            color: white;

            transform: translateY(-1px);

        }


        /* ==============================
           FOOTER
           ============================== */

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

            gap: 70px;

        }


        .footer-brand h2 {

            font-size: 30px;

            color: #38bdf8;

            margin-bottom: 17px;

        }

        .footer-brand p {

            color: #cbd5e1;

            line-height: 1.8;

            max-width: 420px;

            font-size: 14px;

            margin-bottom: 25px;

        }


        .footer-section h3 {

            font-size: 18px;

            margin-bottom: 20px;

        }

        .footer-section h3::after {

            content: "";

            width: 42px;

            height: 3px;

            display: block;

            background: #38bdf8;

            border-radius: 10px;

            margin-top: 8px;

        }

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


        /* Social */

        .social-icons {

            display: flex;

            gap: 12px;

        }

        .social-icons a {

            width: 40px;
            height: 40px;

            border-radius: 50%;

            background:
                rgba(255,255,255,.08);

            display: flex;

            align-items: center;
            justify-content: center;

            color: white;

            font-size: 16px;

            transition: .3s;

        }

        .social-icons a:hover {

            background: #38bdf8;

            transform: translateY(-5px);

        }


        /* Footer bottom */

        .footer-bottom {

            max-width: 1200px;

            margin: auto;

            padding: 21px 40px;

            border-top:
                1px solid rgba(255,255,255,.12);

            display: flex;

            justify-content: space-between;

            align-items: center;

            color: #94a3b8;

            font-size: 13px;

        }


        /* ==============================
           TABLET
           ============================== */

        @media(max-width: 1050px) {

            .header {

                padding: 18px 30px;

            }

            .header nav {

                gap: 18px;

            }

            .header nav a {

                font-size: 14px;

            }

            .main {

                padding-left: 35px;

                padding-right: 35px;

            }

            .grid {

                grid-template-columns:
                    repeat(2, 1fr);

            }

            .footer-container {

                grid-template-columns:
                    1fr 1fr;

                gap: 45px;

            }

            .footer-brand {

                grid-column: 1 / 3;

            }

        }


        /* ==============================
           MOBILE
           ============================== */

        @media(max-width: 750px) {

            .header {

                flex-direction: column;

                gap: 15px;

                padding: 18px 20px;

            }

            .header nav {

                justify-content: center;

                flex-wrap: wrap;

                gap: 15px 20px;

            }

            .header-right {

                width: 100%;

                justify-content: center;

            }

            .main {

                padding:
                    40px 20px 60px;

            }

            .intro h1 {

                font-size: 34px;

            }

            .search-bar {

                padding: 8px;

            }

            .search-icon {

                display: none;

            }

            .search-btn {

                padding:
                    11px 17px;

            }

            .section-heading {

                align-items: flex-start;

                gap: 8px;

                flex-direction: column;

            }

            .grid {

                grid-template-columns: 1fr;

            }

            .footer-container {

                grid-template-columns: 1fr;

                text-align: center;

                padding:
                    55px 25px;

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

                gap: 8px;

                text-align: center;

                padding: 20px;

            }

        }


        /* ==============================
           SMALL MOBILE
           ============================== */

        @media(max-width: 450px) {

            .header-right {

                gap: 12px;

            }

            .logout-btn {

                padding:
                    8px 13px;

                font-size: 13px;

            }

            .intro h1 {

                font-size: 30px;

            }

            .intro p {

                font-size: 14px;

            }

            .search-bar input {

                font-size: 13px;

            }

            .search-btn {

                font-size: 12px;

                padding:
                    10px 14px;

            }

            .card {

                padding: 21px;

            }

        }

    </style>

</head>

<body>

<form id="form1" runat="server">


    <!-- ==============================
         HEADER
         ============================== -->

    <header class="header">

        <div class="logo">
            📘 StudyVault
        </div>


        <nav>

            <a href="Dashboard.aspx">
                Home
            </a>

            <a href="About.aspx">
                About
            </a>

            <a href="Resources.aspx" >
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


        <div class="header-right">

            <a href="Notifications.aspx"
               class="notification">

                🔔

                <span>
                    3
                </span>

            </a>


            <div class="user">

                <div
                    id="avatarCircle"
                    runat="server"
                    class="avatar-circle">

                    S

                </div>

                <button
                    type="button"
                    class="logout-btn"
                    onclick="window.location.href='Login.aspx'">

                    Logout

                </button>

            </div>

        </div>

    </header>


    <!-- ==============================
         MAIN CONTENT
         ============================== -->

    <main class="main">


        <!-- INTRO -->

        <div class="intro">

            <div class="eyebrow">
                Student Learning
            </div>

            <h1>
                Study Notes
            </h1>

            <p>
                Access organized study notes and learning materials
                designed to support your academic preparation,
                revision, and understanding.
            </p>

            <div class="hero-rule"></div>

        </div>


        <!-- SEARCH -->

        <div class="search-wrapper">

            <div class="search-bar">

                <div class="search-icon">
                    🔎
                </div>

                <input
                    type="text"
                    placeholder="Search study notes, subjects or topics..." />

                <button
                    type="button"
                    class="search-btn">

                    Search

                </button>

            </div>

        </div>


        <!-- SECTION TITLE -->

        <div class="section-heading">

            <h2>
                Available Study Notes
            </h2>

            <span>
                Explore your learning materials
            </span>

        </div>


        <!-- NOTES GRID -->

        <div class="grid">


            <!-- CARD 1 -->

            <div class="card">

                <div class="icon">
                    📘
                </div>

                <h3>
                    Web Application Development
                </h3>

                <p>
                    Notes covering ASP.NET, Web Forms, C#,
                    web development concepts and application
                    development techniques.
                </p>

                <div class="meta">

                    <span>
                        Semester 4
                    </span>

                    <span>
                        IT
                    </span>

                </div>

                <a href="#" class="view-btn">
                    📖 &nbsp; View Notes
                </a>

            </div>


            <!-- CARD 2 -->

            <div class="card blue">

                <div class="icon">
                    💻
                </div>

                <h3>
                    Human Computer Interaction
                </h3>

                <p>
                    Study materials covering usability,
                    heuristics, HTA, interface design and
                    user-centred development.
                </p>

                <div class="meta">

                    <span>
                        Semester 4
                    </span>

                    <span>
                        HCI
                    </span>

                </div>

                <a href="#" class="view-btn">
                    📖 &nbsp; View Notes
                </a>

            </div>


            <!-- CARD 3 -->

            <div class="card green">

                <div class="icon">
                    🔐
                </div>

                <h3>
                    Computer Security
                </h3>

                <p>
                    Notes covering security principles,
                    threats, authentication, access control
                    and protection mechanisms.
                </p>

                <div class="meta">

                    <span>
                        Semester 4
                    </span>

                    <span>
                        Security
                    </span>

                </div>

                <a href="#" class="view-btn">
                    📖 &nbsp; View Notes
                </a>

            </div>


            <!-- CARD 4 -->

            <div class="card violet">

                <div class="icon">
                    📊
                </div>

                <h3>
                    Research Methods
                </h3>

                <p>
                    Helpful materials covering research
                    methodology, data collection, analysis
                    and academic research techniques.
                </p>

                <div class="meta">

                    <span>
                        Semester 4
                    </span>

                    <span>
                        Research
                    </span>

                </div>

                <a href="#" class="view-btn">
                    📖 &nbsp; View Notes
                </a>

            </div>


            <!-- CARD 5 -->

            <div class="card blue">

                <div class="icon">
                    🗂️
                </div>

                <h3>
                    Database Systems
                </h3>

                <p>
                    Organized notes covering relational
                    databases, SQL, database design and
                    database management concepts.
                </p>

                <div class="meta">

                    <span>
                        Semester 4
                    </span>

                    <span>
                        Database
                    </span>

                </div>

                <a href="#" class="view-btn">
                    📖 &nbsp; View Notes
                </a>

            </div>


            <!-- CARD 6 -->

            <div class="card orange">

                <div class="icon">
                    🎨
                </div>

                <h3>
                    UI/UX Design
                </h3>

                <p>
                    Notes covering interface design principles,
                    user experience, wireframes and
                    prototyping techniques.
                </p>

                <div class="meta">

                    <span>
                        Semester 4
                    </span>

                    <span>
                        Design
                    </span>

                </div>

                <a href="#" class="view-btn">
                    📖 &nbsp; View Notes
                </a>

            </div>


        </div>

    </main>


    <!-- ==============================
         FOOTER
         ============================== -->

    <footer class="footer">

        <div class="footer-container">


            <!-- BRAND -->

            <div class="footer-brand">

                <h2>
                    . StudyVault
                </h2>

                <p>
                    Your smart learning companion providing
                    quality study notes, research papers,
                    assignments, and educational resources
                    to help students achieve academic success.
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
                        <a href="StudyNotes.aspx">
                            Study Notes
                        </a>
                    </li>

                    <li>
                        <a href="StudentResearch.aspx">
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
