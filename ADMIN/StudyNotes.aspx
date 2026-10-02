<%@ Page Title="Study Notes - StudyVault" Language="C#" AutoEventWireup="true"
    CodeBehind="StudyNotes.aspx.cs" Inherits="STUDYVAULT.StudyNotes" %>

<!DOCTYPE html>
<html lang="en">

<head runat="server">

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Study Notes - StudyVault</title>

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
            background: white;
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

        .notes-table {
            width: 100%;
            border-collapse: collapse;
        }

        .notes-table th {
            text-align: left;
            padding: 18px 28px;

            font-size: 12px;
            color: #7c8296;
            letter-spacing: 1px;
            text-transform: uppercase;

            background: #fafaff;
        }

        .notes-table td {
            padding: 20px 28px;
            border-top: 1px solid #eeeeF3;

            font-size: 14px;
        }

        .note-title {
            font-weight: 700;
            color: #25283a;
        }

        .subject {
            color: #71788c;
        }

        .status {
            display: inline-block;

            padding: 6px 12px;
            border-radius: 20px;

            background: #eafaf2;
            color: #07865e;

            font-size: 12px;
            font-weight: 700;
        }

        .action {
            color: #4f46e5;
            font-weight: 700;
            font-size: 13px;
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

            .content-card {
                overflow-x: auto;
            }

            .notes-table {
                min-width: 750px;
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

            <a href="StudyNotes.aspx" class="active">Study Notes</a>

            <a href="ResearchPapers.aspx">Research Papers</a>

        </nav>

        <div class="admin-profile">

            <div class="avatar">A</div>

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

        <h1>Study Notes</h1>

        <p class="intro">
            Manage study notes and academic learning materials.
        </p>

        <div class="divider"></div>


        <div class="content-card">

            <div class="card-header">

                <h2>Study Notes Library</h2>

                <button type="button" class="add-button">
                    + Add Study Note
                </button>

            </div>


            <table class="notes-table">

                <thead>

                    <tr>
                        <th>Note Title</th>
                        <th>Subject</th>
                        <th>Semester</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>

                </thead>

                <tbody>

                    <tr>

                        <td class="note-title">
                            Human Computer Interaction
                        </td>

                        <td class="subject">
                            HCI
                        </td>

                        <td>
                            Semester 4
                        </td>

                        <td>
                            <span class="status">
                                Published
                            </span>
                        </td>

                        <td>
                            <a href="#" class="action">
                                Manage
                            </a>
                        </td>

                    </tr>


                    <tr>

                        <td class="note-title">
                            Web Application Development
                        </td>

                        <td class="subject">
                            WAPP
                        </td>

                        <td>
                            Semester 4
                        </td>

                        <td>
                            <span class="status">
                                Published
                            </span>
                        </td>

                        <td>
                            <a href="#" class="action">
                                Manage
                            </a>
                        </td>

                    </tr>


                    <tr>

                        <td class="note-title">
                            Database Management
                        </td>

                        <td class="subject">
                            Database
                        </td>

                        <td>
                            Semester 3
                        </td>

                        <td>
                            <span class="status">
                                Published
                            </span>
                        </td>

                        <td>
                            <a href="#" class="action">
                                Manage
                            </a>
                        </td>

                    </tr>

                </tbody>

            </table>

        </div>

    </main>

</form>

</body>
</html>