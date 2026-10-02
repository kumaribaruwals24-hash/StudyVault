<%@ Page Title="Research Papers - StudyVault" Language="C#" AutoEventWireup="true"
    CodeBehind="ResearchPapers.aspx.cs" Inherits="STUDYVAULT.ResearchPapers" %>

<!DOCTYPE html>
<html lang="en">

<head runat="server">

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Research Papers - StudyVault</title>

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />

    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&display=swap"
          rel="stylesheet" />

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: "Segoe UI", Arial, sans-serif;
            background: #f7f7fb;
            color: #171827;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        .header {
            height: 110px;
            background: #ffffff;
            border-bottom: 1px solid #e6e6ef;

            display: flex;
            align-items: center;
            justify-content: space-between;

            padding: 0 9%;
        }

        .logo {
            font-family: "Playfair Display", Georgia, serif;
            font-size: 28px;
            font-weight: 700;
            color: #14213d;
        }

        .logo span {
            color: #4f46e5;
        }

        .nav {
            display: flex;
            gap: 35px;
        }

        .nav a {
            color: #596078;
            font-size: 15px;
            font-weight: 600;
            padding: 30px 0;
            border-bottom: 2px solid transparent;
        }

        .nav a:hover {
            color: #4f46e5;
        }

        .nav a.active {
            color: #4f46e5;
            border-bottom-color: #4f46e5;
        }

        .admin-profile {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .avatar {
            width: 50px;
            height: 50px;
            border-radius: 50%;

            background: #4f46e5;
            color: white;

            display: flex;
            align-items: center;
            justify-content: center;

            font-weight: 700;

            box-shadow: 0 8px 20px rgba(79, 70, 229, .2);
        }

        .admin-name {
            font-size: 15px;
            font-weight: 600;
        }

        .arrow {
            font-size: 11px;
            color: #888da0;
        }

        .main {
            max-width: 1450px;
            margin: auto;
            padding: 72px 9% 100px;
        }

        .eyebrow {
            display: flex;
            align-items: center;
            gap: 10px;

            color: #4f46e5;
            font-size: 13px;
            font-weight: 800;
            letter-spacing: 1.5px;

            margin-bottom: 14px;
        }

        .eyebrow-dot {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background: #4f46e5;
        }

        h1 {
            font-family: "Playfair Display", Georgia, serif;
            font-size: 56px;
            margin-bottom: 18px;
        }

        .intro {
            color: #788198;
            font-size: 17px;
            margin-bottom: 45px;
        }

        .divider {
            width: 290px;
            height: 1px;
            background: #dedfea;

            margin-left: auto;
            margin-top: -65px;
            margin-bottom: 60px;
        }

        .content-card {
            background: white;
            border: 1px solid #e5e6ef;
            border-radius: 20px;
            overflow: hidden;

            box-shadow: 0 15px 35px rgba(30, 30, 60, .06);
        }

        .card-header {
            padding: 24px 28px;
            border-bottom: 1px solid #ececf2;

            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .card-header h2 {
            font-size: 18px;
        }

        .add-button {
            background: #4f46e5;
            color: white;
            border: none;

            padding: 11px 20px;
            border-radius: 10px;

            font-weight: 700;
            cursor: pointer;
        }

        .paper {
            display: flex;
            align-items: center;
            gap: 20px;

            padding: 24px 28px;

            border-bottom: 1px solid #eeeeF3;
        }

        .paper:last-child {
            border-bottom: none;
        }

        .paper-icon {
            width: 48px;
            height: 48px;

            border-radius: 12px;

            background: #efedff;
            color: #4f46e5;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 21px;
            flex-shrink: 0;
        }

        .paper-info {
            flex: 1;
        }

        .paper-info h3 {
            font-size: 15px;
            margin-bottom: 6px;
        }

        .paper-info p {
            color: #7b8194;
            font-size: 13px;
        }

        .paper-meta {
            color: #858b9e;
            font-size: 12px;
            min-width: 130px;
        }

        .status {
            background: #eafaf2;
            color: #07865e;

            padding: 6px 12px;
            border-radius: 20px;

            font-size: 11px;
            font-weight: 700;
        }

        .manage {
            color: #4f46e5;
            font-size: 13px;
            font-weight: 700;
        }

        @media(max-width: 900px) {

            .header {
                height: auto;
                padding: 20px;
                flex-direction: column;
                gap: 20px;
            }

            .nav {
                flex-wrap: wrap;
                justify-content: center;
            }

            .nav a {
                padding: 5px 0;
            }

            .main {
                padding: 50px 20px;
            }

            h1 {
                font-size: 42px;
            }

            .divider {
                display: none;
            }

            .paper {
                flex-wrap: wrap;
            }

            .paper-meta {
                width: 100%;
                margin-left: 68px;
            }
        }

    </style>

</head>

<body>

<form id="form1" runat="server">

    <header class="header">

        <div class="logo">
            STUDYVAULT<span>.</span>
        </div>

        <nav class="nav">

            <a href="AdminDashboard.aspx">Overview</a>

            <a href="Users.aspx">Users</a>

            <a href="ASSIGNMENTCLINICadmin.aspx">Assignments</a>

            <a href="Announcements.aspx">Announcements</a>

            <a href="StudyNotes.aspx">Study Notes</a>

            <a href="ResearchPapers.aspx" class="active">
                Research Papers
            </a>

        </nav>

        <div class="admin-profile">

            <div class="avatar">
                A
            </div>

            <div class="admin-name">
                Admin <span class="arrow">▼</span>
            </div>

        </div>

    </header>


    <main class="main">

        <div class="eyebrow">
            <span class="eyebrow-dot"></span>
            STUDYVAULT ADMINISTRATION
        </div>

        <h1>Research Papers</h1>

        <p class="intro">
            Manage research papers and academic publications.
        </p>

        <div class="divider"></div>


        <div class="content-card">

            <div class="card-header">

                <h2>Research Paper Library</h2>

                <button type="button" class="add-button">
                    + Add Research Paper
                </button>

            </div>


            <div class="paper">

                <div class="paper-icon">
                    📄
                </div>

                <div class="paper-info">

                    <h3>
                        Gamification in Digital Learning
                    </h3>

                    <p>
                        A study on the use of gamification to improve student engagement.
                    </p>

                </div>

                <div class="paper-meta">
                    Computer Science
                </div>

                <span class="status">
                    Published
                </span>

                <a href="#" class="manage">
                    Manage
                </a>

            </div>


            <div class="paper">

                <div class="paper-icon">
                    📄
                </div>

                <div class="paper-info">

                    <h3>
                        Human Computer Interaction in Education
                    </h3>

                    <p>
                        Research material related to usability and educational systems.
                    </p>

                </div>

                <div class="paper-meta">
                    Information Technology
                </div>

                <span class="status">
                    Published
                </span>

                <a href="#" class="manage">
                    Manage
                </a>

            </div>


            <div class="paper">

                <div class="paper-icon">
                    📄
                </div>

                <div class="paper-info">

                    <h3>
                        Digital Resources for Higher Education
                    </h3>

                    <p>
                        Research on digital academic resources and student learning.
                    </p>

                </div>

                <div class="paper-meta">
                    Education
                </div>

                <span class="status">
                    Published
                </span>

                <a href="#" class="manage">
                    Manage
                </a>

            </div>

        </div>

    </main>

</form>

</body>
</html>