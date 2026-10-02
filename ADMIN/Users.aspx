<%@ Page Title="Students - Admin"
    Language="C#"
    AutoEventWireup="true"
    CodeBehind="Users.aspx.cs"
    Inherits="STUDYVAULT.Users" %>

<!DOCTYPE html>

<html lang="en">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
          content="width=device-width, initial-scale=1" />

    <title>Students - Admin</title>


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
           ROOT
        ========================================================= */

        :root {

            --purple: #5146e5;
            --purple-dark: #4037c8;
            --purple-soft: #efedff;

            --ink: #171827;
            --body-text: #3f4354;
            --muted: #7b8194;

            --page: #f7f7fb;

            --white: #ffffff;

            --line: #e7e8ef;
            --line-dark: #dfe1ea;

            --green: #087f5b;
            --green-bg: #e9f9f2;

            --red: #d92d20;
            --red-bg: #fff0ef;

            --orange: #a85d00;
            --orange-border: #f2c36b;
            --orange-bg: #fffaf0;
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

            color: var(--body-text);

            background: var(--page);
        }


        a {
            color: inherit;
            text-decoration: none;
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

            grid-template-columns: 1fr auto 1fr;

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
           CENTER NAV
        ========================================================= */

        .nav-links {

            justify-self: center;

            display: flex;

            align-items: center;

            justify-content: center;

            gap: 30px;

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
                0 5px 14px rgba(81,70,229,.22);
        }


        .user-arrow {

            color: #969aaa;

            font-size: 10px;

            margin-left: 2px;
        }


        /* =========================================================
           PAGE
        ========================================================= */

        .page {

            width: 100%;

            max-width: 1320px;

            margin: 0 auto;

            padding:
                62px 40px
                100px;
        }


        /* =========================================================
           HEADER
        ========================================================= */

        .page-header {

            display: flex;

            align-items: flex-end;

            justify-content: space-between;

            gap: 40px;

            margin-bottom: 38px;
        }


        .header-left {
            max-width: 720px;
        }


        .eyebrow {

            display: flex;

            align-items: center;

            gap: 9px;

            margin-bottom: 14px;

            color: var(--purple);

            font-size: 11px;

            font-weight: 800;

            text-transform: uppercase;

            letter-spacing: 1.5px;
        }


        .eyebrow-dot {

            width: 7px;

            height: 7px;

            border-radius: 50%;

            background: var(--purple);
        }


        .page-header h1 {

            font-family:
                Georgia,
                "Times New Roman",
                serif;

            font-size: 58px;

            line-height: 1;

            letter-spacing: -2.7px;

            color: var(--ink);

            font-weight: 700;

            margin-bottom: 15px;
        }


        .page-header p {

            font-size: 15px;

            line-height: 1.7;

            color: var(--muted);

            max-width: 650px;
        }


        /* =========================================================
           HEADER LINE
        ========================================================= */

        .header-line {

            flex: 1;

            height: 1px;

            background: var(--line);

            margin-bottom: 14px;

            max-width: 250px;
        }


        /* =========================================================
           SEARCH AREA
        ========================================================= */

        .search-area {

            background: white;

            border: 1px solid var(--line);

            border-radius: 16px;

            padding: 7px;

            display: grid;

            grid-template-columns: 1fr 130px;

            gap: 7px;

            margin-bottom: 22px;

            box-shadow:
                0 8px 24px rgba(22, 27, 45, .045);
        }


        .search-input {

            height: 50px;

            width: 100%;

            border: none;

            outline: none;

            background: transparent;

            padding: 0 17px;

            color: var(--ink);

            font-size: 14px;
        }


        .search-input::placeholder {
            color: #a1a6b5;
        }


        .search-button {

            height: 50px;

            border: none;

            border-radius: 11px;

            background: var(--purple);

            color: white;

            font-size: 13px;

            font-weight: 700;

            cursor: pointer;

            transition:
                background .2s ease,
                transform .2s ease;
        }


        .search-button:hover {

            background: var(--purple-dark);

            transform: translateY(-1px);
        }


        /* =========================================================
           MESSAGE
        ========================================================= */

        .confirmation {

            display: flex;

            align-items: center;

            gap: 12px;

            padding: 14px 17px;

            margin-bottom: 20px;

            background: var(--green-bg);

            border: 1px solid #c5efdf;

            border-radius: 13px;

            color: var(--green);
        }


        .confirmation .check {

            width: 30px;

            height: 30px;

            flex-shrink: 0;

            border-radius: 50%;

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


        .error-box {

            padding: 14px 17px;

            margin-bottom: 20px;

            border-radius: 13px;

            border: 1px solid #fecaca;

            background: var(--red-bg);

            color: var(--red);

            font-size: 13px;

            font-weight: 600;
        }


        /* =========================================================
           STUDENT TABLE CARD
        ========================================================= */

        .student-card {

            position: relative;

            background: white;

            border: 1px solid var(--line);

            border-radius: 18px;

            overflow: hidden;

            box-shadow:
                0 12px 32px rgba(22,27,45,.055);
        }


        .student-card::before {

            content: "";

            display: block;

            height: 3px;

            background:
                linear-gradient(
                    90deg,
                    #5146e5,
                    #7068ee
                );
        }


        /* =========================================================
           TABLE
        ========================================================= */

        table.user-table {

            width: 100%;

            border-collapse: collapse;
        }


        table.user-table th {

            height: 58px;

            padding:
                0 24px;

            text-align: left;

            background: #fafafd;

            border-bottom: 1px solid var(--line);

            color: #858a9a;

            font-size: 10px;

            font-weight: 800;

            letter-spacing: 1.2px;

            text-transform: uppercase;
        }


        table.user-table td {

            padding:
                18px 24px;

            height: 86px;

            border-bottom: 1px solid #eeeeF3;

            color: var(--body-text);

            font-size: 13.5px;

            vertical-align: middle;

            transition:
                background .18s ease;
        }


        table.user-table tbody tr:last-child td {
            border-bottom: none;
        }


        table.user-table tbody tr:hover td {
            background: #fcfcff;
        }


        /* =========================================================
           EDIT INPUTS
        ========================================================= */

        .edit-field input {

            width: 100%;

            height: 43px;

            padding:
                0 13px;

            border: 1px solid var(--line-dark);

            border-radius: 9px;

            background: white;

            color: #25293a;

            font-size: 13px;

            transition:
                border-color .2s ease,
                box-shadow .2s ease;
        }


        .edit-field input:hover {
            border-color: #cfd2df;
        }


        .edit-field input:focus {

            outline: none;

            border-color: #9a93f2;

            box-shadow:
                0 0 0 3px
                rgba(81,70,229,.08);
        }


        /* =========================================================
           STATUS
        ========================================================= */

        .status-pill {

            display: inline-flex;

            align-items: center;

            gap: 8px;

            padding:
                7px 12px;

            border-radius: 30px;

            font-size: 11px;

            font-weight: 750;
        }


        .status-pill::before {

            content: "";

            width: 6px;

            height: 6px;

            border-radius: 50%;
        }


        .status-pill.Active {

            background: var(--green-bg);

            color: var(--green);
        }


        .status-pill.Active::before {
            background: #10b981;
        }


        .status-pill.Inactive {

            background: var(--red-bg);

            color: var(--red);
        }


        .status-pill.Inactive::before {
            background: #ef4444;
        }


        /* =========================================================
           ACTIONS
        ========================================================= */

        .actions {

            text-align: right;

            white-space: nowrap;
        }


        .btn-small {

            display: inline-flex;

            align-items: center;

            justify-content: center;

            min-width: 78px;

            height: 37px;

            padding:
                0 13px;

            margin-left: 5px;

            border-radius: 9px;

            font-size: 11.5px;

            font-weight: 700;

            cursor: pointer;

            transition:
                transform .18s ease,
                box-shadow .18s ease,
                background .18s ease;
        }


        .btn-small:hover {
            transform: translateY(-1px);
        }


        /* SAVE */

        .btn-small.save {

            color: white;

            background: var(--purple);

            border: 1px solid var(--purple);

            box-shadow:
                0 5px 13px
                rgba(81,70,229,.17);
        }


        .btn-small.save:hover {

            background: var(--purple-dark);

            box-shadow:
                0 7px 17px
                rgba(81,70,229,.23);
        }


        /* DEACTIVATE */

        .btn-small.status {

            color: var(--orange);

            background: var(--orange-bg);

            border: 1px solid var(--orange-border);
        }


        .btn-small.status:hover {
            background: #fff7df;
        }


        /* DELETE */

        .btn-small.danger {

            color: var(--red);

            background: white;

            border: 1px solid #f3b9b5;
        }


        .btn-small.danger:hover {
            background: var(--red-bg);
        }


        /* =========================================================
           EMPTY
        ========================================================= */

        .empty-state {

            padding: 60px 20px;

            text-align: center;

            color: var(--muted);

            font-size: 14px;
        }


        /* =========================================================
           MOBILE / TABLET
        ========================================================= */

        @media (max-width: 1100px) {

            .nav-inner {

                padding:
                    0 28px;
            }


            .nav-links {

                gap: 22px;
            }


            .page {

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

                scrollbar-width: none;
            }


            .nav-links::-webkit-scrollbar {
                display: none;
            }


            .nav-links a {

                height: 38px;

                flex-shrink: 0;
            }


            .nav-links a.active::after {
                bottom: 0;
            }


            .page {

                padding-top: 45px;

                padding-left: 20px;

                padding-right: 20px;
            }


            .page-header {

                display: block;

                margin-bottom: 30px;
            }


            .header-line {
                display: none;
            }


            .page-header h1 {

                font-size: 48px;

                letter-spacing: -2px;
            }


            .search-area {

                grid-template-columns: 1fr;
            }


            .search-button {
                width: 100%;
            }


            .student-card {

                overflow-x: auto;
            }


            table.user-table {

                min-width: 900px;
            }
        }


        @media (max-width: 500px) {

            .page {

                padding-left: 15px;

                padding-right: 15px;
            }


            .page-header h1 {

                font-size: 40px;

                letter-spacing: -1.5px;
            }


            .page-header p {

                font-size: 14px;
            }


            .eyebrow {

                font-size: 10px;

                letter-spacing: 1.2px;
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


            <!-- CENTER NAVIGATION -->

            <nav class="nav-links">

                <a href="AdminDashboard.aspx">
                    Overview
                </a>

                <a
                    href="Users.aspx"
                    class="active">

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

                <a href="AdminFeedback.aspx">
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
         PAGE
    ========================================================== -->

    <main class="page">


        <!-- =====================================================
             HEADER
        ====================================================== -->

        <section class="page-header">


            <div class="header-left">

                <div class="eyebrow">

                    <span class="eyebrow-dot"></span>

                    STUDYVAULT ADMINISTRATION

                </div>


                <h1>
                    Students
                </h1>


                <p>
                    View, search, edit, activate, deactivate,
                    or delete student accounts.
                </p>

            </div>


            <div class="header-line"></div>


        </section>


        <!-- =====================================================
             SUCCESS MESSAGE
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
             ERROR MESSAGE
        ====================================================== -->

        <asp:Panel
            ID="pnlError"
            runat="server"
            CssClass="error-box"
            Visible="false">


            <asp:Label
                ID="lblError"
                runat="server" />


        </asp:Panel>


        <!-- =====================================================
             SEARCH
        ====================================================== -->

        <div class="search-area">


            <asp:TextBox
                ID="txtSearch"
                runat="server"
                CssClass="search-input"
                placeholder="Search students by name or email..." />


            <asp:Button
                ID="btnSearch"
                runat="server"
                CssClass="search-button"
                Text="Search"
                OnClick="btnSearch_Click" />


        </div>


        <!-- =====================================================
             STUDENT TABLE
        ====================================================== -->

        <div class="student-card">


            <table class="user-table">


                <thead>

                    <tr>

                        <th>
                            Name
                        </th>

                        <th>
                            Email
                        </th>

                        <th>
                            Status
                        </th>

                        <th style="text-align:right;">
                            Actions
                        </th>

                    </tr>

                </thead>


                <tbody>


                    <asp:Repeater
                        ID="rptUsers"
                        runat="server"
                        OnItemCommand="rptUsers_ItemCommand">


                        <ItemTemplate>


                            <tr>


                                <!-- NAME -->

                                <td class="edit-field">

                                    <asp:TextBox
                                        runat="server"
                                        ID="txtEditName"
                                        Text='<%# Eval("FullName") %>' />

                                </td>


                                <!-- EMAIL -->

                                <td class="edit-field">

                                    <asp:TextBox
                                        runat="server"
                                        ID="txtEditEmail"
                                        Text='<%# Eval("Email") %>' />

                                </td>


                                <!-- STATUS -->

                                <td>

                                    <span
                                        class='status-pill <%# Eval("Status") %>'>

                                        <%# Eval("Status") %>

                                    </span>

                                </td>


                                <!-- ACTIONS -->

                                <td class="actions">


                                    <!-- SAVE -->

                                    <asp:LinkButton
                                        runat="server"
                                        CssClass="btn-small save"
                                        CommandName="Save"
                                        CommandArgument='<%# Eval("UserID") %>'>

                                        Save

                                    </asp:LinkButton>


                                    <!-- TOGGLE STATUS -->

                                    <asp:LinkButton
                                        runat="server"
                                        CssClass="btn-small status"
                                        CommandName="ToggleStatus"
                                        CommandArgument='<%# Eval("UserID") %>'
                                        OnClientClick='return confirm("Change status for this student?");'>


                                        <%# Convert.ToString(Eval("Status")) == "Active"
                                            ? "Deactivate"
                                            : "Activate" %>


                                    </asp:LinkButton>


                                    <!-- DELETE -->

                                    <asp:LinkButton
                                        runat="server"
                                        CssClass="btn-small danger"
                                        CommandName="DeleteStudent"
                                        CommandArgument='<%# Eval("UserID") %>'
                                        OnClientClick='return confirm("Are you sure you want to permanently delete this student? This cannot be undone.");'>

                                        Delete

                                    </asp:LinkButton>


                                </td>


                            </tr>


                        </ItemTemplate>


                    </asp:Repeater>


                </tbody>


            </table>


            <!-- =================================================
                 EMPTY STATE
            ================================================== -->

            <asp:Panel
                ID="pnlNoUsers"
                runat="server"
                CssClass="empty-state"
                Visible="false">

                <p>
                    No students found.
                </p>

            </asp:Panel>


        </div>


    </main>


</form>

</body>

</html>