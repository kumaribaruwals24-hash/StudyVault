<%@ Page Title="Feedback - Admin" Language="C#" AutoEventWireup="true"
    CodeBehind="AdminFeedback.aspx.cs" Inherits="STUDYVAULT.AdminFeedback" %>

<!DOCTYPE html>

<html lang="en">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
          content="width=device-width, initial-scale=1" />

    <title>Feedback - Admin</title>

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
           COLORS
        ========================================================= */

        :root {

            --purple: #5146e5;
            --purple-dark: #4037c8;
            --purple-light: #efedff;

            --ink: #171827;
            --text: #3f4354;
            --muted: #7b8194;

            --page: #f7f7fb;

            --white: #ffffff;

            --line: #e7e8ef;

            --green: #087f5b;
            --green-bg: #e9f9f2;

            --red: #d92d20;
            --red-bg: #fff0ef;

            --amber: #b45309;
            --amber-bg: #fffbeb;

            --orange: #ea580c;
            --orange-bg: #fff7ed;
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

            color: var(--text);
        }


        a {
            text-decoration: none;
            color: inherit;
        }


        button,
        input,
        select {
            font-family: inherit;
        }


        /* =========================================================
           NAVIGATION
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
           LOGO
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

        .admin-main {

            width: 100%;

            max-width: 1180px;

            margin: 0 auto;

            padding:
                55px 40px
                90px;
        }


        /* =========================================================
           PAGE HEADER
        ========================================================= */

        .admin-header {

            display: flex;

            justify-content: space-between;

            align-items: flex-end;

            gap: 30px;

            margin-bottom: 30px;
        }


        .admin-header h1 {

            font-family:
                Georgia,
                "Times New Roman",
                serif;

            font-size: 48px;

            line-height: 1;

            letter-spacing: -2px;

            color: var(--ink);

            margin-bottom: 12px;
        }


        .admin-header p {

            color: var(--muted);

            font-size: 14px;

            line-height: 1.7;
        }


        /* =========================================================
           CONFIRMATION
        ========================================================= */

        .confirmation {

            display: flex;

            align-items: center;

            gap: 12px;

            padding: 14px 17px;

            margin-bottom: 22px;

            background: var(--green-bg);

            border: 1px solid #c5efdf;

            border-radius: 13px;

            color: var(--green);
        }


        .confirmation .check {

            width: 30px;

            height: 30px;

            border-radius: 50%;

            flex-shrink: 0;

            display: flex;

            align-items: center;

            justify-content: center;

            background: #10a976;

            color: white;

            font-size: 13px;

            font-weight: 800;
        }


        .confirmation h3 {
            font-size: 13px;
        }


        /* =========================================================
           STATISTICS
        ========================================================= */

        .stats-row {

            display: grid;

            grid-template-columns:
                repeat(3, 1fr);

            gap: 16px;

            margin-bottom: 25px;
        }


        .stat-chip {

            background: white;

            border: 1px solid var(--line);

            border-radius: 16px;

            padding: 19px 21px;

            box-shadow:
                0 8px 25px
                rgba(22,27,45,.035);

            transition:
                transform .2s ease,
                box-shadow .2s ease;
        }


        .stat-chip:hover {

            transform: translateY(-2px);

            box-shadow:
                0 12px 30px
                rgba(22,27,45,.055);
        }


        .stat-chip .num {

            font-family:
                Georgia,
                "Times New Roman",
                serif;

            font-size: 27px;

            font-weight: 700;

            color: var(--ink);

            margin-bottom: 3px;
        }


        .stat-chip .lbl {

            color: var(--muted);

            font-size: 12px;
        }


        /* =========================================================
           FILTER
        ========================================================= */

        .filter-box {

            background: white;

            border: 1px solid var(--line);

            border-radius: 15px;

            padding: 15px 17px;

            margin-bottom: 20px;

            display: flex;

            align-items: center;

            gap: 12px;

            box-shadow:
                0 8px 25px
                rgba(22,27,45,.025);
        }


        .filter-label {

            font-size: 12px;

            font-weight: 700;

            color: #343747;
        }


        .filter-box select {

            min-width: 220px;

            height: 39px;

            padding:
                0 12px;

            border: 1px solid #dfe1ea;

            border-radius: 9px;

            background: #fafbfc;

            color: var(--text);

            font-size: 12.5px;

            cursor: pointer;

            transition:
                border-color .2s ease,
                box-shadow .2s ease,
                background .2s ease;
        }


        .filter-box select:hover {

            background: white;

            border-color: #cfd2df;
        }


        .filter-box select:focus,
        .admin-status-dropdown:focus {

            outline: none;

            background: white;

            border-color: #9a93f2;

            box-shadow:
                0 0 0 3px
                rgba(81,70,229,.08);
        }


        /* =========================================================
           FEEDBACK CARD
        ========================================================= */

        .feedback-card {

            background: white;

            border: 1px solid var(--line);

            border-radius: 18px;

            padding: 22px;

            margin-bottom: 16px;

            box-shadow:
                0 10px 30px
                rgba(22,27,45,.035);

            transition:
                box-shadow .2s ease,
                transform .2s ease;
        }


        .feedback-card:hover {

            box-shadow:
                0 14px 35px
                rgba(22,27,45,.065);

            transform: translateY(-1px);
        }


        /* =========================================================
           FEEDBACK TOP
        ========================================================= */

        .feedback-top {

            display: flex;

            justify-content: space-between;

            align-items: flex-start;

            gap: 15px;

            margin-bottom: 16px;

            flex-wrap: wrap;
        }


        .student-info h3 {

            color: var(--ink);

            font-family:
                Georgia,
                "Times New Roman",
                serif;

            font-size: 18px;

            margin-bottom: 5px;
        }


        .email {

            color: var(--muted);

            font-size: 12px;

            margin-bottom: 9px;
        }


        .category-tag {

            display: inline-block;

            background: var(--purple-light);

            color: var(--purple);

            border-radius: 8px;

            padding:
                5px 10px;

            font-size: 11px;

            font-weight: 700;
        }


        .stars {

            color: #f59e0b;

            font-size: 15px;

            letter-spacing: 2px;
        }


        .submitted-date {

            color: var(--muted);

            font-size: 11.5px;

            margin-top: 5px;
        }


        /* =========================================================
           MESSAGE
        ========================================================= */

        .message-box {

            background: #fafbfc;

            border: 1px solid var(--line);

            border-radius: 11px;

            padding:
                13px 15px;

            margin-bottom: 17px;

            font-size: 13.5px;

            line-height: 1.65;

            color: var(--text);

            white-space: pre-wrap;
        }


        /* =========================================================
           ACTION AREA
        ========================================================= */

        .feedback-actions {

            display: flex;

            justify-content: flex-end;

            align-items: center;

            gap: 8px;

            flex-wrap: wrap;

            padding-top: 15px;

            border-top: 1px solid var(--line);
        }


        /* =========================================================
           STATUS PILL
        ========================================================= */

        .status-pill {

            font-size: 11px;

            font-weight: 700;

            padding:
                6px 12px;

            border-radius: 20px;

            margin-right: auto;
        }


        .status-pill.New {

            background: var(--amber-bg);

            color: var(--amber);
        }


        .status-pill.Important {

            background: var(--red-bg);

            color: var(--red);
        }


        .status-pill.Reviewing {

            background: var(--orange-bg);

            color: var(--orange);
        }


        .status-pill.Resolved {

            background: var(--green-bg);

            color: var(--green);
        }


        /* =========================================================
           STATUS DROPDOWN
        ========================================================= */

        .admin-status-dropdown {

            height: 37px;

            padding:
                0 11px;

            border-radius: 9px;

            border: 1px solid #dfe1ea;

            background: #fafbfc;

            color: var(--text);

            font-size: 12px;

            font-weight: 600;

            cursor: pointer;

            min-width: 125px;

            transition:
                border-color .2s ease,
                box-shadow .2s ease,
                background .2s ease;
        }


        .admin-status-dropdown:hover {

            background: white;

            border-color: #cfd2df;
        }


        /* =========================================================
           UPDATE BUTTON
        ========================================================= */

        .admin-update-btn {

            height: 37px;

            padding:
                0 15px;

            border: none;

            border-radius: 9px;

            background: var(--purple);

            color: white;

            font-size: 12px;

            font-weight: 700;

            cursor: pointer;

            box-shadow:
                0 5px 14px
                rgba(81,70,229,.16);

            transition:
                background .2s ease,
                transform .2s ease;
        }


        .admin-update-btn:hover {

            background: var(--purple-dark);

            transform: translateY(-1px);
        }


        /* =========================================================
           DELETE BUTTON
        ========================================================= */

        .btn-small {

            height: 37px;

            padding:
                0 15px;

            border-radius: 9px;

            border: 1px solid var(--line);

            background: white;

            font-weight: 600;

            font-size: 12px;

            cursor: pointer;

            white-space: nowrap;

            transition:
                background .2s ease,
                border-color .2s ease;
        }


        .btn-small.danger {

            color: var(--red);

            border-color: #f0c5c2;
        }


        .btn-small.danger:hover {

            background: var(--red-bg);

            border-color: #efaaa5;
        }


        /* =========================================================
           EMPTY STATE
        ========================================================= */

        .empty-state {

            text-align: center;

            padding:
                60px 20px;

            color: var(--muted);

            background: white;

            border: 1px solid var(--line);

            border-radius: 18px;

            box-shadow:
                0 10px 30px
                rgba(22,27,45,.035);
        }


        .empty-state p {

            font-size: 14px;
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


            .admin-main {

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


            .admin-main {

                padding:
                    42px 20px
                    70px;
            }


            .admin-header {

                display: block;
            }


            .stats-row {

                grid-template-columns:
                    repeat(3, 1fr);
            }
        }


        @media (max-width: 650px) {

            .admin-main {

                padding-left: 15px;

                padding-right: 15px;
            }


            .admin-header h1 {

                font-size: 39px;

                letter-spacing: -1.5px;
            }


            .stats-row {

                grid-template-columns: 1fr;
            }


            .stat-chip {

                padding:
                    16px 18px;
            }


            .filter-box {

                align-items: flex-start;

                flex-direction: column;
            }


            .filter-box select {

                width: 100%;

                min-width: 0;
            }


            .feedback-card {

                padding: 18px;
            }


            .feedback-top {

                display: block;
            }


            .feedback-top > div:last-child {

                text-align: left !important;

                margin-top: 13px;
            }


            .feedback-actions {

                justify-content: stretch;
            }


            .status-pill {

                width: 100%;

                margin-right: 0;

                text-align: center;

                margin-bottom: 3px;
            }


            .admin-status-dropdown {

                flex: 1;

                min-width: 0;
            }


            .admin-update-btn,
            .btn-small {

                flex: 1;
            }
        }


        @media (max-width: 430px) {

            .admin-status-dropdown,
            .admin-update-btn,
            .btn-small {

                width: 100%;

                flex: none;
            }
        }

    </style>

</head>

<body>

<form id="form1" runat="server">


    <!-- =========================================================
         NAVIGATION
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

                <a href="AdminResources.aspx">
                    Resources
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

                <a
                    href="AdminFeedback.aspx"
                    class="active">

                    Feedback

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
         MAIN CONTENT
    ========================================================== -->

    <main class="admin-main">


        <!-- =====================================================
             PAGE HEADER
        ====================================================== -->

        <div class="admin-header">

            <div>

                <h1>
                    Feedback
                </h1>

                <p>
                    Review student feedback and update its status.
                </p>

            </div>

        </div>


        <!-- =====================================================
             CONFIRMATION
        ====================================================== -->

        <asp:Panel
            ID="pnlConfirmation"
            runat="server"
            CssClass="confirmation"
            Visible="false">

            <div class="check">
                ✓
            </div>

            <h3>
                <asp:Label
                    ID="lblConfirmationText"
                    runat="server" />
            </h3>

        </asp:Panel>


        <!-- =====================================================
             STATISTICS
        ====================================================== -->

        <div class="stats-row">

            <div class="stat-chip">

                <div class="num">

                    <asp:Literal
                        ID="litTotal"
                        runat="server" />

                </div>

                <div class="lbl">
                    Total Feedback
                </div>

            </div>


            <div class="stat-chip">

                <div class="num">

                    <asp:Literal
                        ID="litNew"
                        runat="server" />

                </div>

                <div class="lbl">
                    New / Unreviewed
                </div>

            </div>


            <div class="stat-chip">

                <div class="num">

                    <asp:Literal
                        ID="litAvgRating"
                        runat="server" />

                </div>

                <div class="lbl">
                    Average Rating
                </div>

            </div>

        </div>


        <!-- =====================================================
             FILTER
        ====================================================== -->

        <div class="filter-box">

            <span class="filter-label">
                Filter:
            </span>

            <asp:DropDownList
                ID="ddlFilter"
                runat="server"
                AutoPostBack="true"
                OnSelectedIndexChanged="ddlFilter_Changed">

                <asp:ListItem
                    Text="All Feedback"
                    Value="all" />

                <asp:ListItem
                    Text="New Only"
                    Value="New" />

                <asp:ListItem
                    Text="Important Only"
                    Value="Important" />

                <asp:ListItem
                    Text="Reviewing Only"
                    Value="Reviewing" />

                <asp:ListItem
                    Text="Resolved Only"
                    Value="Resolved" />

            </asp:DropDownList>

        </div>


        <!-- =====================================================
             FEEDBACK LIST
        ====================================================== -->

        <asp:Repeater
            ID="rptFeedback"
            runat="server"
            OnItemCommand="rptFeedback_ItemCommand"
            OnItemDataBound="rptFeedback_ItemDataBound">

            <ItemTemplate>

                <div class="feedback-card">


                    <!-- TOP -->

                    <div class="feedback-top">

                        <div class="student-info">

                            <h3>
                                <%# Eval("UserName") %>
                            </h3>

                            <div class="email">
                                <%# Eval("Email") %>
                            </div>

                            <span class="category-tag">
                                <%# Eval("Category") %>
                            </span>

                        </div>


                        <div style="text-align:right;">

                            <div class="stars">

                                <%# new string(
                                        '★',
                                        (int)Eval("Rating")
                                    )
                                    +
                                    new string(
                                        '☆',
                                        5 - (int)Eval("Rating")
                                    )
                                %>

                            </div>

                            <div class="submitted-date">

                                <%# Eval(
                                    "SubmittedOn",
                                    "{0:dd MMM yyyy, hh:mm tt}"
                                ) %>

                            </div>

                        </div>

                    </div>


                    <!-- MESSAGE -->

                    <div class="message-box">

                        <%#
                            string.IsNullOrWhiteSpace(
                                Eval("Message").ToString()
                            )
                            ?
                            "(no message provided)"
                            :
                            Eval("Message")
                        %>

                    </div>


                    <!-- ACTIONS -->

                    <div class="feedback-actions">


                        <!-- CURRENT STATUS -->

                        <span class='status-pill <%# Eval("Status") %>'>

                            <%# Eval("Status") %>

                        </span>


                        <!-- STATUS DROPDOWN -->

                        <asp:DropDownList
                            ID="ddlStatus"
                            runat="server"
                            CssClass="admin-status-dropdown">

                            <asp:ListItem
                                Text="New"
                                Value="New" />

                            <asp:ListItem
                                Text="Important"
                                Value="Important" />

                            <asp:ListItem
                                Text="Reviewing"
                                Value="Reviewing" />

                            <asp:ListItem
                                Text="Resolved"
                                Value="Resolved" />

                        </asp:DropDownList>


                        <!-- UPDATE STATUS -->

                        <asp:Button
                            ID="btnChangeStatus"
                            runat="server"
                            Text="Update Status"
                            CssClass="admin-update-btn"
                            CommandName="ChangeStatus"
                            CommandArgument='<%# Eval("Id") %>' />


                        <!-- DELETE -->

                        <asp:LinkButton
                            ID="btnDelete"
                            runat="server"
                            CssClass="btn-small danger"
                            CommandName="Delete"
                            CommandArgument='<%# Eval("Id") %>'
                            OnClientClick='return confirm("Delete this feedback?");'>

                            Delete

                        </asp:LinkButton>


                    </div>

                </div>

            </ItemTemplate>

        </asp:Repeater>


        <!-- =====================================================
             NO FEEDBACK
        ====================================================== -->

        <asp:Panel
            ID="pnlNoFeedback"
            runat="server"
            CssClass="empty-state"
            Visible="false">

            <p>
                No feedback found.
            </p>

        </asp:Panel>


    </main>

</form>

</body>

</html>