<%@ Page Title="Announcements - StudyVault" Language="C#" AutoEventWireup="true"
    CodeBehind="Announcements.aspx.cs" Inherits="STUDYVAULT.Announcements" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Announcements - StudyVault</title>

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@600;700&display=swap" rel="stylesheet" />

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
            align-items: center;
            gap: 38px;
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
            font-size: 16px;

            box-shadow: 0 8px 20px rgba(79, 70, 229, 0.22);
        }

        .admin-name {
            font-size: 15px;
            font-weight: 600;
            color: #171827;
        }

        .arrow {
            font-size: 11px;
            color: #7b8194;
            margin-left: 4px;
        }

        .main {
            max-width: 1450px;
            margin: 0 auto;
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
            text-transform: uppercase;

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
            line-height: 1.1;
            margin-bottom: 18px;
            color: #171827;
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
            background: #ffffff;
            border: 1px solid #e5e6ef;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(30, 30, 60, 0.06);
            overflow: hidden;
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
            color: #25283a;
        }

        .add-button {
            background: #4f46e5;
            color: white;
            border: none;

            padding: 11px 20px;
            border-radius: 10px;

            font-size: 13px;
            font-weight: 700;
            cursor: pointer;
        }

        .add-button:hover {
            background: #4338ca;
        }

        .announcement {
            padding: 24px 28px;
            border-bottom: 1px solid #eeeeF3;

            display: flex;
            align-items: center;
            gap: 18px;
        }

        .announcement:last-child {
            border-bottom: none;
        }

        .announcement-icon {
            width: 45px;
            height: 45px;
            border-radius: 12px;

            background: #efedff;
            color: #4f46e5;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 20px;
            flex-shrink: 0;
        }

        .announcement-info {
            flex: 1;
        }

        .announcement-info h3 {
            font-size: 15px;
            margin-bottom: 5px;
        }

        .announcement-info p {
            color: #7b8194;
            font-size: 13px;
        }

        .date {
            color: #9096a8;
            font-size: 12px;
        }

        @media(max-width: 900px) {

            .header {
                height: auto;
                padding: 20px;
                flex-direction: column;
                gap: 20px;
            }

            .nav {
                gap: 20px;
                flex-wrap: wrap;
                justify-content: center;
            }

            .nav a {
                padding: 5px 0;
            }

            .main {
                padding: 50px 25px;
            }

            h1 {
                font-size: 42px;
            }

            .divider {
                display: none;
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

            <a href="Announcements.aspx" class="active">
                Announcements
            </a>

            <a href="StudyNotes.aspx">Study Notes</a>

            <a href="ResearchPapers.aspx">Research Papers</a>

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

        <h1>Announcements</h1>

        <p class="intro">
            Create and manage announcements for students.
        </p>

        <div class="divider"></div>


        <div class="content-card">

            <div class="card-header">

                <h2>Recent Announcements</h2>

                <button type="button" class="add-button">
                    + New Announcement
                </button>

            </div>


            <div class="announcement">

                <div class="announcement-icon">
                    📢
                </div>

                <div class="announcement-info">

                    <h3>Semester 4 Assignment Submission</h3>

                    <p>
                        Students are reminded to submit their assignments before the deadline.
                    </p>

                </div>

                <div class="date">
                    19 Sep 2026
                </div>

            </div>


            <div class="announcement">

                <div class="announcement-icon">
                    📚
                </div>

                <div class="announcement-info">

                    <h3>New Study Resources Available</h3>

                    <p>
                        New learning materials have been added to StudyVault.
                    </p>

                </div>

                <div class="date">
                    15 Sep 2026
                </div>

            </div>


            <div class="announcement">

                <div class="announcement-icon">
                    🎓
                </div>

                <div class="announcement-info">

                    <h3>Upcoming Academic Workshop</h3>

                    <p>
                        Details about the upcoming academic workshop will be shared soon.
                    </p>

                </div>

                <div class="date">
                    12 Sep 2026
                </div>

            </div>

        </div>

    </main>

</form>

</body>
</html>