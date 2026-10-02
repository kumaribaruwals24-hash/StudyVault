<%@ Page Title="Assignment Clinic - Admin"
    Language="C#"
    AutoEventWireup="true"
    CodeBehind="ASSIGNMENTCLINICadmin.aspx.cs"
    Inherits="STUDYVAULT.ASSIGNMENTCLINICadmin" %>

<!DOCTYPE html>

<html lang="en">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
        content="width=device-width, initial-scale=1" />

    <title>Assignment Clinic - Admin</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        a,
        button,
        input,
        textarea,
        select {
            outline: none;
        }

        a:focus-visible,
        button:focus-visible,
        input:focus-visible,
        textarea:focus-visible,
        select:focus-visible {
            outline: 2px solid #4f46e5;
            outline-offset: 2px;
            border-radius: 6px;
        }

        :root {
            --navy: #f4f5fb;
            --navy-2: #ffffff;
            --navy-3: #eceefa;

            --cyan: #4f46e5;
            --cyan-2: #6366f1;
            --cyan-dark: #4338ca;

            --white: #ffffff;
            --text: #16202b;
            --muted: #667085;
            --muted-2: #8a94a3;

            --line: rgba(15,23,42,.08);
            --line-light: rgba(15,23,42,.12);

            --panel: rgba(255,255,255,.92);
            --panel-2: rgba(247,249,251,.85);

            --green: #34d399;
            --red: #fb7185;

            --shadow:
                0 20px 50px rgba(31,41,55,.08);

            --accent-blue: #3b82f6;
            --accent-teal: #06b6d4;
            --accent-green: #10b981;
            --accent-purple: #7c3aed;
        }


        /* =====================================================
           BASE
        ===================================================== */

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family:
                "Segoe UI",
                system-ui,
                -apple-system,
                BlinkMacSystemFont,
                Arial,
                sans-serif;

            background:
                radial-gradient(
                    circle at 80% 10%,
                    rgba(79,70,229,.10),
                    transparent 30%
                ),
                radial-gradient(
                    circle at 20% 70%,
                    rgba(67,56,202,.08),
                    transparent 35%
                ),
                var(--navy);

            color: var(--text);

            min-height: 100vh;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        button,
        input,
        textarea,
        select {
            font-family: inherit;
        }


        /* =====================================================
           DASHBOARD STYLE TOP NAVIGATION
        ===================================================== */

        .top-header {
            height: 80px;

            width: 100%;

            display: flex;
            align-items: center;

            padding:
                0 5.5%;

            position: relative;
            z-index: 100;

            background: #ffffff;

            border-bottom:
                1px solid
                rgba(15,23,42,.06);
        }


        /* LOGO */

        .top-logo {
            font-size: 21px;

            font-weight: 800;

            letter-spacing: -.5px;

            color: #161a35;

            white-space: nowrap;

            font-family:
                Georgia,
                "Times New Roman",
                serif;
        }

        .top-logo span {
            color: #4f46e5;
        }


        /* NAV */

        .top-nav {
            display: flex;

            align-items: center;

            justify-content: center;

            gap: 32px;

            flex: 1;

            margin-left: 80px;
        }

        .top-nav a {
            position: relative;

            padding: 8px 0;

            font-size: 14px;

            font-weight: 600;

            color: #6b7280;

            transition: color .2s;
        }

        .top-nav a::after {
            content: "";

            position: absolute;

            left: 0;
            right: 0;
            bottom: -2px;

            height: 2px;

            border-radius: 2px;

            background: #4f46e5;

            opacity: 0;

            transform: scaleX(0);

            transition:
                opacity .2s,
                transform .2s;
        }

        .top-nav a:hover {
            color: #161a35;
        }

        .top-nav a.active {
            color: #4f46e5;
        }

        .top-nav a.active::after {
            opacity: 1;
            transform: scaleX(1);
        }


        /* PROFILE */

        .top-profile {
            display: flex;

            align-items: center;

            gap: 10px;

            padding:
                4px 14px 4px 4px;

            border-radius: 28px;

            background: transparent;

            color: #161a35;

            font-size: 13px;

            font-weight: 700;

            white-space: nowrap;
        }

        .profile-circle {
            width: 38px;
            height: 38px;

            border-radius: 50%;

            display: flex;
            align-items: center;
            justify-content: center;

            background: #4f46e5;

            color: white;

            font-size: 14px;

            font-weight: 800;

            box-shadow:
                0 4px 12px
                rgba(79,70,229,.28);
        }

        .profile-arrow {
            color: #9ca3af;

            font-size: 11px;

            margin-left: 2px;
        }


        /* =====================================================
           MAIN
        ===================================================== */

        .admin-main {
            width: 100%;

            padding:
                42px 6%
                90px;

            min-height:
                calc(100vh - 92px);

            position: relative;

            background:
                radial-gradient(
                    circle at 75% 5%,
                    rgba(79,70,229,.06),
                    transparent 30%
                );
        }


        /* =====================================================
           RESPONSIVE
        ===================================================== */

        @media (max-width: 1050px) {

            .top-header {
                padding: 0 3%;
            }

            .top-nav {
                gap: 20px;
                margin-left: 35px;
            }

        }


        @media (max-width: 850px) {

            .top-header {
                height: auto;

                min-height: 80px;

                padding:
                    15px 20px;

                flex-wrap: wrap;

                gap: 15px;
            }

            .top-logo {
                order: 1;
            }

            .top-profile {
                order: 2;

                margin-left: auto;
            }

            .top-nav {
                order: 3;

                width: 100%;

                margin-left: 0;

                justify-content: flex-start;

                overflow-x: auto;

                gap: 24px;

                padding-bottom: 3px;
            }

            .admin-main {
                min-height:
                    calc(100vh - 130px);

                padding:
                    32px 20px 60px;
            }

        }


        /* =====================================================
           MAIN CONTENT
        ===================================================== */

        .admin-main {
            flex: 1;

            width: 100%;

            padding:
                48px
                55px
                90px;

            position: relative;

            overflow: hidden;
        }

        .admin-main::before {
            content: "";

            position: absolute;

            width: 500px;
            height: 500px;

            right: -250px;
            top: -250px;

            background:
                radial-gradient(
                    circle,
                    rgba(79,70,229,.09),
                    transparent 70%
                );

            pointer-events: none;
        }


        /* =====================================================
           HEADER
        ===================================================== */

        .admin-header {
            max-width: 900px;

            margin:
                0 auto 30px;

            text-align: center;
        }

        .admin-header::before {
            content: "●  STUDYVAULT ADMINISTRATION";

            display: inline-block;

            padding:
                8px 16px;

            margin-bottom: 17px;

            border-radius: 20px;

            background:
                rgba(79,70,229,.08);

            border:
                1px solid
                rgba(79,70,229,.18);

            color: #4f46e5;

            font-size: 10px;

            font-weight: 800;

            letter-spacing: 1.2px;
        }

        .admin-header h1 {
            font-family:
                Georgia,
                "Times New Roman",
                serif;

            font-size: 38px;

            color: #16202b;

            margin-bottom: 10px;
        }

        .admin-header p {
            max-width: 720px;

            margin: auto;

            color: #667085;

            font-size: 14px;

            line-height: 1.65;
        }


        /* =====================================================
           MESSAGES
        ===================================================== */

        .confirmation {
            display: flex;
            align-items: center;

            gap: 14px;

            background:
                rgba(52,211,153,.08);

            border:
                1px solid
                rgba(52,211,153,.25);

            border-radius: 15px;

            padding:
                17px 20px;

            margin-bottom: 24px;

            box-shadow:
                0 15px 40px rgba(0,0,0,.12);
        }

        .confirmation .check {
            width: 40px;
            height: 40px;

            flex-shrink: 0;

            background:
                rgba(52,211,153,.18);

            color: var(--green);

            border:
                1px solid
                rgba(52,211,153,.3);

            border-radius: 50%;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 20px;
            font-weight: 800;
        }

        .confirmation h3 {
            font-size: 14px;
            color: var(--green);
        }

        .error-box {
            background:
                rgba(251,113,133,.08);

            border:
                1px solid
                rgba(251,113,133,.25);

            border-radius: 14px;

            padding:
                14px 18px;

            margin-bottom: 22px;

            color: #fda4af;

            font-size: 13px;
            font-weight: 600;
        }


        /* =====================================================
           TABS
        ===================================================== */

        .tabs {
            display: flex;

            gap: 4px;

            margin-bottom: 25px;

            padding: 5px;

            width: fit-content;

            max-width: 100%;

            background: #ffffff;

            border:
                1px solid
                rgba(15,23,42,.07);

            border-radius: 14px;

            box-shadow:
                0 4px 14px rgba(31,41,55,.04);

            overflow-x: auto;
        }

        .tab-btn {
            border: none;

            padding: 10px 20px;

            border-radius: 10px;

            font-size: 13px;

            font-weight: 700;

            cursor: pointer;

            white-space: nowrap;

            color: #6b7280;

            background: transparent;

            transition:
                color .2s,
                background .2s;
        }

        .tab-btn:hover {
            color: #161a35;

            background: rgba(15,23,42,.04);
        }

        .tab-btn.active {
            color: #ffffff;

            background: #4f46e5;

            box-shadow:
                0 6px 16px rgba(79,70,229,.28);
        }

        .tab-panel {
            display: none;
        }

        .tab-panel.active {
            display: block;
        }


        /* =====================================================
           PANEL
        ===================================================== */

        .panel {
            background: #ffffff;

            border:
                1px solid
                rgba(15,23,42,.06);

            border-top: 4px solid #4f46e5;

            border-radius: 18px;

            padding: 32px;

            box-shadow:
                var(--shadow);

            position: relative;

            overflow: hidden;
        }

        .panel::before {
            content: "";

            position: absolute;

            width: 240px;
            height: 240px;

            right: -100px;
            top: -120px;

            background:
                radial-gradient(
                    circle,
                    rgba(79,70,229,.08),
                    transparent 70%
                );

            pointer-events: none;
        }


        /* =====================================================
           FORM
        ===================================================== */

        .form-grid {
            display: grid;

            grid-template-columns:
                1fr 1fr;

            gap: 20px;
        }

        .field {
            margin-bottom: 19px;
        }

        .field label {
            display: block;

            font-weight: 700;

            font-size: 12px;

            margin-bottom: 8px;

            color:
                rgba(15,23,42,.78);

            letter-spacing: .15px;
        }

        .required {
            color: #fb7185;
        }

        .field input,
        .field textarea,
        .field select {
            width: 100%;

            padding:
                12px 14px;

            border-radius: 12px;

            border:
                1px solid
                rgba(15,23,42,.12);

            font-size: 13.5px;

            background: #f9fafc;

            color: #16202b;

            outline: none;

            transition:
                border .2s,
                box-shadow .2s,
                background .2s;
        }

        .field input::placeholder,
        .field textarea::placeholder {
            color:
                rgba(15,23,42,.35);
        }

        .field input:focus,
        .field textarea:focus,
        .field select:focus {
            border-color: #4f46e5;

            background: #ffffff;

            box-shadow:
                0 0 0 3px
                rgba(79,70,229,.14);
        }

        .field select option {
            background: #ffffff;
            color: #16202b;
        }

        .field textarea {
            min-height: 125px;

            resize: vertical;

            line-height: 1.6;
        }

        .field input[type="file"] {
            padding: 9px;

            color: var(--muted);
        }


        /* FILE INPUT */

        .field input[type="file"]::file-selector-button {
            border: none;

            background:
                rgba(79,70,229,.12);

            color: var(--cyan);

            padding:
                8px 12px;

            border-radius: 8px;

            margin-right: 10px;

            font-weight: 700;

            cursor: pointer;
        }


        /* SUBMIT */

        .submit-row {
            display: flex;

            justify-content: flex-end;

            margin-top: 12px;
        }

        .submit-btn {
            background: #4f46e5;

            color: #ffffff;

            border: none;

            padding:
                12px 26px;

            border-radius: 24px;

            font-weight: 700;

            font-size: 13px;

            cursor: pointer;

            box-shadow:
                0 8px 20px
                rgba(79,70,229,.28);

            transition:
                transform .2s,
                box-shadow .2s,
                background .2s;
        }

        .submit-btn:hover {
            background: #4338ca;

            transform:
                translateY(-2px);

            box-shadow:
                0 12px 28px
                rgba(79,70,229,.34);
        }


        /* =====================================================
           ASSIGNMENTS
        ===================================================== */

        .assign-row {
            display: flex;

            align-items: center;

            gap: 16px;

            padding:
                17px 19px;

            border:
                1px solid
                rgba(15,23,42,.06);

            border-left: 4px solid #4f46e5;

            border-radius: 14px;

            margin-bottom: 11px;

            background: #ffffff;

            box-shadow:
                0 6px 18px rgba(31,41,55,.05);

            transition:
                transform .2s,
                box-shadow .2s;
        }

        .assign-row:hover {
            transform:
                translateY(-2px);

            box-shadow:
                0 10px 24px rgba(31,41,55,.08);
        }

        .assign-icon {
            width: 44px;
            height: 44px;

            border-radius: 12px;

            background:
                rgba(79,70,229,.10);

            border:
                1px solid
                rgba(79,70,229,.13);

            color: var(--cyan);

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 18px;

            flex-shrink: 0;
        }

        .assign-info {
            flex: 1;

            min-width: 0;
        }

        .assign-info h4 {
            font-size: 14.5px;

            font-weight: 700;

            color: #16202b;

            margin-bottom: 5px;
        }

        .assign-info span {
            font-size: 12px;

            color: var(--muted);

            line-height: 1.5;
        }

        .assign-status {
            font-size: 10px;

            font-weight: 800;

            padding:
                5px 10px;

            border-radius: 12px;

            background:
                rgba(52,211,153,.09);

            border:
                1px solid
                rgba(52,211,153,.16);

            color: var(--green);

            flex-shrink: 0;
        }


        /* SMALL BUTTON */

        .btn-small {
            padding:
                7px 14px;

            border-radius: 20px;

            border:
                1px solid
                rgba(15,23,42,.12);

            background: #f9fafc;

            color:
                rgba(15,23,42,.65);

            font-weight: 700;

            font-size: 11.5px;

            cursor: pointer;

            white-space: nowrap;

            transition: .2s;
        }

        .btn-small:hover {
            background:
                rgba(79,70,229,.08);

            color: var(--cyan);

            border-color:
                rgba(79,70,229,.20);
        }

        .btn-small.danger {
            color: #fb8b99;

            border-color:
                rgba(251,113,133,.18);
        }

        .btn-small.danger:hover {
            background:
                rgba(251,113,133,.08);

            color: #fda4af;
        }


        /* =====================================================
           SUBMISSIONS
        ===================================================== */

        .submission-toolbar {
            display: flex;

            align-items: center;

            justify-content: space-between;

            gap: 15px;

            margin-bottom: 18px;

            flex-wrap: wrap;
        }

        .submission-toolbar h2 {
            font-family:
                Georgia,
                "Times New Roman",
                serif;

            font-size: 25px;

            color: #16202b;
        }

        .submission-toolbar p {
            color: var(--muted);

            font-size: 12px;

            margin-top: 5px;
        }

        .filter-box {
            display: flex;

            align-items: center;

            gap: 8px;
        }

        .filter-box label {
            font-size: 11px;

            font-weight: 800;

            color: var(--muted);

            text-transform: uppercase;

            letter-spacing: .7px;
        }

        .filter-box select {
            min-width: 210px;

            padding:
                9px 12px;

            border:
                1px solid
                rgba(15,23,42,.12);

            border-radius: 10px;

            background:
                rgba(255,255,255,.9);

            color: #16202b;

            font-size: 12px;

            outline: none;
        }


        /* SUBMISSION CARD */

        .submission-card {
            background: #ffffff;

            border:
                1px solid
                rgba(15,23,42,.06);

            border-left: 4px solid #4f46e5;

            border-radius: 16px;

            padding: 21px;

            margin-bottom: 13px;

            box-shadow:
                0 6px 18px rgba(31,41,55,.05);
        }

        .submission-top {
            display: flex;

            align-items: flex-start;

            justify-content: space-between;

            gap: 15px;

            margin-bottom: 16px;
        }

        .student-info h3 {
            font-size: 15px;

            margin-bottom: 4px;

            color: #16202b;
        }

        .email {
            color: var(--muted);

            font-size: 11.5px;

            margin-bottom: 7px;
        }

        .assignment-name {
            display: inline-block;

            color: var(--cyan);

            background:
                rgba(79,70,229,.09);

            border:
                1px solid
                rgba(79,70,229,.13);

            border-radius: 8px;

            padding:
                4px 8px;

            font-size: 10px;

            font-weight: 800;
        }

        .submission-date {
            color: var(--muted);

            font-size: 11px;
        }


        /* NOTE */

        .note-box {
            background:
                rgba(15,23,42,.03);

            border:
                1px solid
                rgba(15,23,42,.07);

            border-radius: 11px;

            padding:
                12px 14px;

            margin-bottom: 15px;
        }

        .note-label {
            font-size: 9px;

            text-transform: uppercase;

            letter-spacing: 1px;

            color: var(--muted-2);

            font-weight: 800;

            margin-bottom: 5px;
        }

        .note-text {
            font-size: 12.5px;

            line-height: 1.6;

            color:
                rgba(15,23,42,.72);

            white-space: pre-wrap;
        }

        .attempt-meta {
            font-size: 11px;

            color: var(--muted);

            margin-bottom: 12px;
        }


        /* REVIEW */

        .review-grid {
            display: grid;

            grid-template-columns:
                180px 1fr;

            gap: 12px;

            margin-top: 15px;
        }

        .review-field label {
            display: block;

            font-size: 9px;

            font-weight: 800;

            color: var(--muted-2);

            text-transform: uppercase;

            letter-spacing: .8px;

            margin-bottom: 6px;
        }

        .review-field select,
        .review-field textarea {
            width: 100%;

            border:
                1px solid
                rgba(15,23,42,.08);

            border-radius: 10px;

            padding:
                9px 11px;

            font-size: 12px;

            background:
                rgba(15,23,42,.035);

            color: #16202b;

            outline: none;
        }

        .review-field select option {
            background: #ffffff;
        }

        .review-field textarea {
            min-height: 75px;

            resize: vertical;
        }


        /* ACTIONS */

        .submission-actions {
            display: flex;

            justify-content: flex-end;

            gap: 8px;

            margin-top: 13px;

            flex-wrap: wrap;
        }

        .download-btn {
            background:
                rgba(79,70,229,.08);

            color: var(--cyan);

            border:
                1px solid
                rgba(79,70,229,.16);

            padding:
                8px 16px;

            border-radius: 20px;

            font-size: 11px;

            font-weight: 800;

            cursor: pointer;

            transition: background .2s;
        }

        .download-btn:hover {
            background:
                rgba(79,70,229,.13);
        }

        .save-btn {
            background: #4f46e5;

            color: #ffffff;

            border: none;

            padding:
                8px 18px;

            border-radius: 12px;

            font-size: 11px;

            font-weight: 800;

            transition: background .2s;

            cursor: pointer;
        }

        .save-btn:hover {
            background: #4338ca;
        }


        /* =====================================================
           EMPTY STATE
        ===================================================== */

        .empty-state {
            text-align: center;

            padding:
                60px 20px;

            color: var(--muted);

            background:
                linear-gradient(
                    145deg,
                    rgba(255,255,255,.9),
                    rgba(247,249,251,.85)
                );

            border:
                1px solid
                rgba(255,255,255,.08);

            border-radius: 18px;
        }

        .empty-state .icon {
            font-size: 36px;

            margin-bottom: 12px;

            opacity: .7;
        }

        .empty-state p {
            font-size: 13px;
        }


        /* =====================================================
           RESPONSIVE
        ===================================================== */

        @media (max-width: 1100px) {

            .sidebar {
                width: 230px;
            }

            .admin-main {
                padding:
                    40px
                    30px
                    70px;
            }

        }


        @media (max-width: 600px) {

            .admin-header h1 {
                font-size: 32px;
            }

            .admin-header::before {
                font-size: 8px;
            }

            .tabs {
                width: 100%;
            }

            .tab-btn {
                flex: 1;
                padding-left: 10px;
                padding-right: 10px;
            }

            .assign-row {
                align-items: flex-start;

                flex-wrap: wrap;
            }

            .assign-info {
                width:
                    calc(100% - 60px);
            }

            .assign-status {
                margin-left: 58px;
            }

            .submission-top {
                flex-direction: column;
            }

            .submission-toolbar {
                align-items: flex-start;

                flex-direction: column;
            }

            .filter-box {
                width: 100%;
            }

            .filter-box select {
                flex: 1;

                min-width: 0;
            }

            .review-grid {
                grid-template-columns: 1fr;
            }

            .submission-actions {
                justify-content: flex-start;
            }

        }

    </style>

</head>


<body>

<form
    id="form1"
    runat="server"
    enctype="multipart/form-data">


    <!-- =========================================
         ACTIVE TAB
    ========================================== -->

    <asp:HiddenField
        ID="hdnActiveTab"
        runat="server"
        Value="post" />


<header class="top-header">

    <a href="AdminDashboard.aspx" class="top-logo">
        STUDYVAULT<span>.</span>
    </a>

    <nav class="top-nav">

        <a href="AdminDashboard.aspx">
            Overview
        </a>

        <a href="Users.aspx">
            Users
        </a>

        <a href="AdminResources.aspx">
            Resources
        </a>

        <a class="active" href="ASSIGNMENTCLINICadmin.aspx">
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

    </nav>

    <div class="top-profile">

        <div class="profile-circle">
            A
        </div>

        <span>
            Sushant Baruwal
        </span>

        <span class="profile-arrow">
            ▾
        </span>

    </div>

</header>
    </header>


    <!-- =========================================
         MAIN
    ========================================== -->

    <main class="admin-main">


        <!-- HEADER -->

        <div class="admin-header">

            <h1>
                Assignment Clinic
            </h1>

            <p>
                Post assignments, manage existing questions,
                review student submissions and provide
                feedback from one central workspace.
            </p>

        </div>


        <!-- =========================================
             SUCCESS MESSAGE
        ========================================== -->

        <asp:Panel
            ID="pnlConfirmation"
            runat="server"
            CssClass="confirmation"
            Visible="false">

            <div class="check">
                ✓
            </div>

            <div>

                <h3>

                    <asp:Label
                        ID="lblConfirmationText"
                        runat="server" />

                </h3>

            </div>

        </asp:Panel>


        <!-- =========================================
             ERROR MESSAGE
        ========================================== -->

        <asp:Panel
            ID="pnlError"
            runat="server"
            CssClass="error-box"
            Visible="false">

            <asp:Label
                ID="lblError"
                runat="server" />

        </asp:Panel>


        <!-- =========================================
             TABS
        ========================================== -->

        <div class="tabs">

            <button
                type="button"
                class="tab-btn active"
                data-tab="post">

                Post Assignment

            </button>


            <button
                type="button"
                class="tab-btn"
                data-tab="manage">

                Manage Assignments

            </button>


            <button
                type="button"
                class="tab-btn"
                data-tab="submissions">

                Student Submissions

            </button>

        </div>


        <!-- =========================================
             POST ASSIGNMENT
        ========================================== -->

        <div
            class="tab-panel active"
            id="tab-post">

            <div class="panel">

                <div class="form-grid">


                    <!-- TITLE -->

                    <div class="field">

                        <label
                            for="<%= txtTitle.ClientID %>">

                            Assignment Title
                            <span class="required">*</span>

                        </label>

                        <asp:TextBox
                            ID="txtTitle"
                            runat="server"
                            placeholder="e.g. Web Application Assignment" />

                    </div>


                    <!-- SUBJECT -->

                    <div class="field">

                        <label
                            for="<%= txtSubject.ClientID %>">

                            Subject
                            <span class="required">*</span>

                        </label>

                        <asp:TextBox
                            ID="txtSubject"
                            runat="server"
                            placeholder="e.g. Web Application" />

                    </div>


                    <!-- SEMESTER -->

                    <div class="field">

                        <label
                            for="<%= ddlSemester.ClientID %>">

                            Semester
                            <span class="required">*</span>

                        </label>

                        <asp:DropDownList
                            ID="ddlSemester"
                            runat="server">

                            <asp:ListItem
                                Text="Semester 1"
                                Value="Semester 1" />

                            <asp:ListItem
                                Text="Semester 2"
                                Value="Semester 2" />

                            <asp:ListItem
                                Text="Semester 3"
                                Value="Semester 3" />

                            <asp:ListItem
                                Text="Semester 4"
                                Value="Semester 4"
                                Selected="True" />

                            <asp:ListItem
                                Text="Semester 5"
                                Value="Semester 5" />

                            <asp:ListItem
                                Text="Semester 6"
                                Value="Semester 6" />

                            <asp:ListItem
                                Text="Semester 7"
                                Value="Semester 7" />

                            <asp:ListItem
                                Text="Semester 8"
                                Value="Semester 8" />

                        </asp:DropDownList>

                    </div>


                    <!-- TEACHER -->

                    <div class="field">

                        <label
                            for="<%= txtTeacher.ClientID %>">

                            Teacher / Lecturer
                            <span class="required">*</span>

                        </label>

                        <asp:TextBox
                            ID="txtTeacher"
                            runat="server"
                            placeholder="e.g. Mr. Sharma" />

                    </div>


                    <!-- TYPE -->

                    <div class="field">

                        <label
                            for="<%= ddlAssignmentType.ClientID %>">

                            Assignment Type

                        </label>

                        <asp:DropDownList
                            ID="ddlAssignmentType"
                            runat="server">

                            <asp:ListItem
                                Text="Individual Assignment"
                                Value="individual" />

                            <asp:ListItem
                                Text="Group Assignment"
                                Value="group" />

                            <asp:ListItem
                                Text="Project"
                                Value="project" />

                            <asp:ListItem
                                Text="Lab Report"
                                Value="lab" />

                            <asp:ListItem
                                Text="Case Study"
                                Value="case-study" />

                            <asp:ListItem
                                Text="Other"
                                Value="other" />

                        </asp:DropDownList>

                    </div>


                    <!-- DEADLINE -->

                    <div class="field">

                        <label
                            for="<%= txtDeadline.ClientID %>">

                            Submission Deadline
                            <span class="required">*</span>

                        </label>

                        <asp:TextBox
                            ID="txtDeadline"
                            runat="server"
                            TextMode="Date" />

                    </div>

                </div>


                <!-- DESCRIPTION -->

                <div class="field">

                    <label
                        for="<%= txtDescription.ClientID %>">

                        Description / Question Details

                    </label>

                    <asp:TextBox
                        ID="txtDescription"
                        runat="server"
                        TextMode="MultiLine"
                        placeholder="Instructions students should follow..." />

                </div>


                <!-- FILE -->

                <div class="field">

                    <label
                        for="<%= fileUpload.ClientID %>">

                        Attach Question File
                        <span class="required">*</span>

                    </label>

                    <asp:FileUpload
                        ID="fileUpload"
                        runat="server" />

                </div>


                <!-- POST BUTTON -->

                <div class="submit-row">

                    <asp:Button
                        ID="btnPost"
                        runat="server"
                        CssClass="submit-btn"
                        Text="Post Assignment"
                        OnClick="btnPost_Click" />

                </div>

            </div>

        </div>


        <!-- =========================================
             MANAGE ASSIGNMENTS
        ========================================== -->

        <div
            class="tab-panel"
            id="tab-manage">


            <asp:Repeater
                ID="rptAssignments"
                runat="server"
                OnItemCommand="rptAssignments_ItemCommand">

                <ItemTemplate>

                    <div class="assign-row">


                        <div class="assign-icon">
                            📄
                        </div>


                        <div class="assign-info">

                            <h4>
                                <%# Eval("Title") %>
                            </h4>

                            <span>

                                <%# Eval("Subject") %>
                                ·
                                <%# Eval("Teacher") %>
                                ·
                                <%# Eval("Semester") %>
                                · Due
                                <%# Eval(
                                    "DueDate",
                                    "{0:dd MMM yyyy}"
                                ) %>

                            </span>

                            <br />

                            <span
                                style="
                                color:#087ea8;
                                font-weight:600;
                                ">

                                📎
                                <%# Eval("OriginalFileName") %>

                            </span>

                        </div>


                        <span class="assign-status">

                            <%# Eval("Status") %>

                        </span>


                        <!-- DOWNLOAD -->

                        <asp:LinkButton
                            ID="btnDownloadAssignment"
                            runat="server"
                            CssClass="btn-small"
                            CommandName="Download"
                            CommandArgument='<%# Eval("Id") %>'>

                            ↓ Download

                        </asp:LinkButton>


                        <!-- DELETE -->

                        <asp:LinkButton
                            ID="btnDeleteAssignment"
                            runat="server"
                            CssClass="btn-small danger"
                            CommandName="Delete"
                            CommandArgument='<%# Eval("Id") %>'
                            OnClientClick="return confirm('Are you sure you want to delete this assignment?');">

                            Delete

                        </asp:LinkButton>

                    </div>

                </ItemTemplate>

            </asp:Repeater>


            <!-- NO ASSIGNMENTS -->

            <asp:Panel
                ID="pnlNoAssignments"
                runat="server"
                CssClass="empty-state"
                Visible="false">

                <div class="icon">
                    📭
                </div>

                <p>
                    No assignments posted yet.
                </p>

            </asp:Panel>

        </div>


        <!-- =========================================
             STUDENT SUBMISSIONS
        ========================================== -->

        <div
            class="tab-panel"
            id="tab-submissions">


            <!-- TOOLBAR -->

            <div class="submission-toolbar">

                <div>

                    <h2>
                        Student Submissions
                    </h2>

                    <p>
                        Review uploaded work and provide
                        feedback.
                    </p>

                </div>


                <div class="filter-box">

                    <label
                        for="<%= ddlSubmissionFilter.ClientID %>">

                        Filter:

                    </label>

                    <asp:DropDownList
                        ID="ddlSubmissionFilter"
                        runat="server"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="ddlSubmissionFilter_Changed">

                    </asp:DropDownList>

                </div>

            </div>


            <!-- SUBMISSIONS -->

            <asp:Repeater
                ID="rptSubmissions"
                runat="server"
                OnItemCommand="rptSubmissions_ItemCommand">

                <ItemTemplate>

                    <div class="submission-card">

                        <div class="attempt-meta">
                            Attempt <%# Eval("AttemptNumber") %> of 3 · File: <%# Eval("OriginalFileName") %>
                        </div>


                        <!-- STUDENT -->

                        <div class="submission-top">

                            <div class="student-info">

                                <h3>
                                    <%# Eval("StudentName") %>
                                </h3>

                                <div class="email">
                                    <%# Eval("StudentEmail") %>
                                </div>

                                <span class="assignment-name">

                                    <%# Eval(
                                        "AssignmentTitle"
                                    ) %>

                                </span>

                            </div>


                            <div class="submission-date">

                                Submitted:

                                <%# Eval(
                                    "SubmittedDate",
                                    "{0:dd MMM yyyy, hh:mm tt}"
                                ) %>

                            </div>

                        </div>


                        <div class="note-box">

                            <div class="note-label">
                                Student Note
                            </div>

                            <div class="note-text">
                                <%# Convert.ToString(Eval("Note")) %>
                            </div>

                        </div>


                        <!-- REVIEW -->

                        <div class="review-grid">


                            <!-- STATUS -->

                            <div class="review-field">

                                <label>
                                    Status
                                </label>

                                <asp:DropDownList
                                    ID="ddlStatus"
                                    runat="server"
                                    SelectedValue='<%# Eval("Status") %>'>

                                    <asp:ListItem
                                        Text="Pending"
                                        Value="Pending" />

                                    <asp:ListItem
                                        Text="Reviewed"
                                        Value="Reviewed" />

                                    <asp:ListItem
                                        Text="Approved"
                                        Value="Approved" />

                                    <asp:ListItem
                                        Text="Needs Revision"
                                        Value="Needs Revision" />

                                    <asp:ListItem
                                        Text="Rejected"
                                        Value="Rejected" />

                                </asp:DropDownList>

                            </div>


                            <!-- COMMENT -->

                            <div class="review-field">

                                <label>
                                    Feedback / Comment
                                </label>

                                <asp:TextBox
                                    ID="txtComment"
                                    runat="server"
                                    TextMode="MultiLine"
                                    Text='<%# Eval("Comment") %>'
                                    placeholder="Write feedback for the student..." />

                            </div>

                        </div>


                        <!-- ACTIONS -->

                        <div class="submission-actions">


                            <asp:LinkButton
                                ID="btnDownload"
                                runat="server"
                                CssClass="download-btn"
                                CommandName="Download"
                                CommandArgument='<%# Eval("Id") %>'>

                                ↓ Download Submission

                            </asp:LinkButton>


                            <asp:LinkButton
                                ID="btnSaveReview"
                                runat="server"
                                CssClass="save-btn"
                                CommandName="SaveReview"
                                CommandArgument='<%# Eval("Id") %>'>

                                Save Review

                            </asp:LinkButton>

                        </div>

                    </div>

                </ItemTemplate>

            </asp:Repeater>


            <!-- NO SUBMISSIONS -->

            <asp:Panel
                ID="pnlNoSubmissions"
                runat="server"
                CssClass="empty-state"
                Visible="false">

                <div class="icon">
                    📭
                </div>

                <p>
                    No student submissions found.
                </p>

            </asp:Panel>

        </div>

    </main>


</form>


<!-- =========================================
     TAB JAVASCRIPT
========================================== -->

<script>

    (function () {

        var tabButtons =
            document.querySelectorAll(".tab-btn");

        var panels = {
            post:
                document.getElementById("tab-post"),

            manage:
                document.getElementById("tab-manage"),

            submissions:
                document.getElementById("tab-submissions")
        };


        function activateTab(tabName) {

            tabButtons.forEach(function (button) {

                button.classList.remove("active");

                if (
                    button.getAttribute("data-tab")
                    === tabName
                ) {
                    button.classList.add("active");
                }

            });


            Object.keys(panels).forEach(function (key) {

                if (panels[key]) {

                    panels[key].classList.remove(
                        "active"
                    );

                }

            });


            if (panels[tabName]) {

                panels[tabName].classList.add(
                    "active"
                );

            }


            sessionStorage.setItem(
                "assignmentAdminTab",
                tabName
            );

        }


        // -------------------------------------------------
        // TAB CLICK
        // -------------------------------------------------

        tabButtons.forEach(function (button) {

            button.addEventListener(
                "click",
                function () {

                    activateTab(
                        button.getAttribute(
                            "data-tab"
                        )
                    );

                }
            );

        });


        // -------------------------------------------------
        // SERVER TAB
        // -------------------------------------------------

        var serverTab =
            "<%= hdnActiveTab.Value %>";


        if (
            serverTab &&
            panels[serverTab]
        ) {

            activateTab(serverTab);

        }
        else {

            var savedTab =
                sessionStorage.getItem(
                    "assignmentAdminTab"
                );


            if (
                savedTab &&
                panels[savedTab]
            ) {

                activateTab(savedTab);

            }
            else {

                activateTab("post");

            }

        }

    })();

</script>

</body>

</html>