<%@ Page Title="Assignment Clinic"
    Language="C#"
    AutoEventWireup="true"
    CodeBehind="ASSIGNMENTCLINIC.aspx.cs"
    Inherits="STUDYVAULT.ASSIGNMENTCLINIC" %>
<%@ Import Namespace="System.Web" %>


<!DOCTYPE html>
<html lang="en">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
        content="width=device-width, initial-scale=1" />

    <title>Assignment Clinic - StudyVault</title>

    <link rel="preconnect"
        href="https://fonts.googleapis.com" />

    <link rel="preconnect"
        href="https://fonts.gstatic.com"
        crossorigin="anonymous" />

    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,600;0,700;1,600&display=swap"
        rel="stylesheet" />

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        :root {
            --primary: #5B50E8;
            --primary-dark: #493FD0;
            --purple: #8C82FF;
            --blue: #5AC8FA;
            --background: #F5F6FF;
            --white: #FFFFFF;
            --text: #15152B;
            --muted: #6B7280;
            --border: rgba(21, 21, 43, 0.09);
        }

        body {
            font-family: "Segoe UI", system-ui, -apple-system, sans-serif;
            background:
                radial-gradient(
                    1100px 500px at 50% -150px,
                    rgba(91, 80, 232, 0.08),
                    transparent 60%
                ),
                var(--background);
            color: var(--text);
        }

        a {
            text-decoration: none;
        }

        button,
        input,
        select,
        textarea {
            font-family: inherit;
        }

        /* ================= HEADER ================= */

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
                0 4px 20px rgba(21, 21, 43, 0.06);
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;

            font-size: 22px;
            font-weight: 800;

            color: var(--primary);

            white-space: nowrap;
        }

        .header nav {
            display: flex;
            gap: 22px;
        }

        .header nav a {
            color: var(--muted);

            font-size: 14px;
            font-weight: 600;

            padding-bottom: 4px;

            border-bottom: 2px solid transparent;

            transition: 0.2s;
        }

        .header nav a:hover {
            color: var(--text);
        }

        .header nav a.active {
            color: var(--primary);
            border-bottom-color: var(--primary);
        }

        .header-right {
            display: flex;
            align-items: center;
            gap: 18px;
        }

        .notification {
            position: relative;
            font-size: 20px;
        }

        .notification span {
            position: absolute;

            top: -7px;
            right: -9px;

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

        .user {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .avatar-circle {
            width: 36px;
            height: 36px;

            border-radius: 50%;

            display: flex;
            align-items: center;
            justify-content: center;

            background:
                linear-gradient(
                    135deg,
                    var(--primary),
                    var(--purple)
                );

            color: white;

            font-size: 13px;
            font-weight: 700;
        }

        .logout-btn {
            border: none;
            border-radius: 20px;

            padding: 9px 18px;

            background: #f3f4f6;
            color: #374151;

            cursor: pointer;

            font-size: 14px;
            font-weight: 600;

            transition: 0.2s;
        }

        .logout-btn:hover {
            background: #fee2e2;
            color: #dc2626;
        }

        /* ================= MAIN ================= */

        .main {
            max-width: 1200px;
            margin: 0 auto;

            padding: 50px 60px 90px;
        }

        .intro-row {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;

            gap: 20px;
            flex-wrap: wrap;

            margin-bottom: 10px;
        }

        .eyebrow {
            margin-bottom: 8px;

            color: var(--primary);

            font-size: 12px;
            font-weight: 700;

            text-transform: uppercase;
            letter-spacing: 1.5px;
        }

        .main h1 {
            max-width: 750px;

            font-family:
                "Playfair Display",
                Georgia,
                serif;

            font-size: 34px;
            line-height: 1.2;
        }

        .hero-rule {
            width: 64px;
            height: 4px;

            margin-bottom: 40px;

            border-radius: 4px;

            background:
                linear-gradient(
                    90deg,
                    var(--primary),
                    var(--purple),
                    var(--blue)
                );
        }

        .upload-cta-btn {
            border: none;
            border-radius: 24px;

            padding: 13px 26px;

            background: var(--primary);
            color: white;

            cursor: pointer;

            font-size: 14px;
            font-weight: 700;

            box-shadow:
                0 10px 22px rgba(91, 80, 232, 0.22);

            transition: 0.2s;
        }

        .upload-cta-btn:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
        }

        /* ================= SECTION ================= */

        .section {
            margin-top: 60px;
        }

        .section-head h2 {
            margin-bottom: 6px;

            font-family:
                "Playfair Display",
                Georgia,
                serif;

            font-size: 26px;
        }

        .section-head p {
            margin-bottom: 26px;

            color: var(--muted);
            font-size: 14.5px;
        }

        /* ================= FILTERS ================= */

        .filter-bar {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;

            margin-bottom: 26px;
        }

        .filter-bar input,
        .filter-bar select {
            border: 1px solid var(--border);
            border-radius: 24px;

            padding: 12px 16px;

            background: white;
            color: #374151;

            font-size: 14px;

            outline: none;
        }

        .filter-bar input:focus,
        .filter-bar select:focus {
            border-color: var(--primary);
        }

        .filter-bar input {
            flex: 1;
            min-width: 220px;
        }

        .result-count {
            margin-bottom: 18px;

            color: var(--muted);
            font-size: 13.5px;
        }

        /* ================= ASSIGNMENT GRID ================= */

        .assignment-grid {
            display: grid;

            grid-template-columns:
                repeat(
                    auto-fit,
                    minmax(300px, 1fr)
                );

            gap: 20px;
        }

        .assignment-card {
            padding: 24px;

            background: white;

            border: 1px solid var(--border);
            border-radius: 20px;

            transition: 0.25s;
        }

        .assignment-card:hover {
            transform: translateY(-4px);

            box-shadow:
                0 16px 30px rgba(21, 21, 43, 0.08);
        }

        .card-top-row {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;

            gap: 12px;

            margin-bottom: 14px;
        }

        .card-title-group {
            display: flex;
            align-items: flex-start;
            gap: 12px;
        }

        .doc-icon {
            width: 42px;
            height: 42px;

            flex-shrink: 0;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 12px;

            background: #eeecff;

            font-size: 19px;
        }

        .assignment-card h3 {
            font-size: 15.5px;
            line-height: 1.35;
        }

        .status-badge {
            padding: 4px 11px;

            border-radius: 12px;

            font-size: 11px;
            font-weight: 700;

            white-space: nowrap;
        }

        .status-badge.active {
            background: #eeecff;
            color: #493FD0;
        }

        .status-badge.submitted {
            background: #ecfdf5;
            color: #047857;
        }

        .status-badge.overdue {
            background: #fef2f2;
            color: #b91c1c;
        }

        .meta-list {
            margin-bottom: 18px;
        }

        .meta-list div {
            display: flex;
            justify-content: space-between;

            gap: 15px;

            padding: 6px 0;

            border-bottom: 1px dashed var(--border);

            font-size: 13px;
        }

        .meta-list div:last-child {
            border-bottom: none;
        }

        .meta-list .label {
            color: #9ca3af;
        }

        .meta-list .value {
            color: #374151;
            font-weight: 600;

            text-align: right;
        }

        .card-description {
            margin-bottom: 16px;
            padding: 12px 14px;

            border-radius: 12px;

            background: #f9fafb;

            color: var(--muted);

            font-size: 13px;
            line-height: 1.6;
        }

        .uploaded-file-box {
            display: flex;
            align-items: center;

            gap: 12px;

            margin-top: 18px;
            margin-bottom: 18px;

            padding: 12px;

            border: 1px solid #e5e7eb;
            border-radius: 14px;

            background: #fafafa;
        }

        .uploaded-file-icon {
            width: 38px;
            height: 38px;

            display: flex;
            align-items: center;
            justify-content: center;

            flex-shrink: 0;

            border-radius: 10px;

            background: #eeecff;
        }

        .uploaded-file-info {
            flex: 1;
            min-width: 0;
        }

        .uploaded-file-label {
            margin-bottom: 3px;

            color: #6b7280;

            font-size: 11px;
            font-weight: 700;

            text-transform: uppercase;
        }

        .uploaded-file-name {
            overflow: hidden;

            color: #374151;

            font-size: 12px;
            font-weight: 600;

            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .download-btn {
            display: inline-flex;
            align-items: center;
            justify-content: center;

            padding: 8px 12px;

            border-radius: 10px;

            background: var(--primary);
            color: white;

            font-size: 12px;
            font-weight: 700;

            white-space: nowrap;
        }

        .download-btn:hover {
            background: var(--primary-dark);
        }

        /* ================= EMPTY ================= */

        .empty-state {
            display: none;

            grid-column: 1 / -1;

            padding: 60px 20px;

            text-align: center;

            color: var(--muted);
        }

        .empty-state.visible {
            display: block;
        }

        .empty-state .icon {
            margin-bottom: 12px;
            font-size: 40px;
        }

        /* ================= ALERTS ================= */

        .confirmation {
            display: flex;
            align-items: flex-start;

            gap: 14px;

            margin-bottom: 26px;
            padding: 18px 20px;

            border: 1px solid #a7f3d0;
            border-radius: 16px;

            background: #ecfdf5;
        }

        .confirmation .check {
            width: 36px;
            height: 36px;

            flex-shrink: 0;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 50%;

            background: #10b981;
            color: white;

            font-size: 18px;
        }

        .confirmation h3 {
            margin-bottom: 3px;

            color: #047857;
            font-size: 15px;
        }

        .confirmation p {
            color: #065f46;
            font-size: 13.5px;
        }

        .error-box {
            margin-bottom: 22px;
            padding: 14px 18px;

            border: 1px solid #fecaca;
            border-radius: 14px;

            background: #fef2f2;
            color: #b91c1c;

            font-size: 13.5px;
            font-weight: 600;
        }

        /* ================= UPLOAD ================= */

        .upload-panel {
            padding: 34px;

            background: white;

            border: 1px solid var(--border);
            border-radius: 22px;

            box-shadow:
                0 10px 30px rgba(21, 21, 43, 0.04);
        }

        .form-grid {
            display: grid;

            grid-template-columns: 1fr 1fr;

            gap: 20px;

            margin-bottom: 20px;
        }

        .field {
            margin-bottom: 20px;
        }

        .field label {
            display: block;

            margin-bottom: 8px;

            font-size: 13.5px;
            font-weight: 700;
        }

        .required {
            color: #ef4444;
        }

        .field input,
        .field textarea,
        .field select {
            width: 100%;

            padding: 11px 15px;

            border: 1px solid var(--border);
            border-radius: 12px;

            background: #fbfbfe;
            color: var(--text);

            font-size: 14px;

            outline: none;
        }

        .field input:focus,
        .field textarea:focus,
        .field select:focus {
            border-color: var(--primary);
            background: white;
        }

        .field textarea {
            min-height: 100px;
            resize: vertical;
        }

        .field input[type="file"] {
            padding: 10px;
            background: white;
        }

        .submit-row {
            display: flex;
            justify-content: center;
        }

        .submit-btn {
            border: none;
            border-radius: 24px;

            padding: 13px 34px;

            background: var(--primary);
            color: white;

            cursor: pointer;

            font-size: 14.5px;
            font-weight: 700;

            box-shadow:
                0 10px 22px rgba(91, 80, 232, 0.22);

            transition: 0.2s;
        }

        .submit-btn:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
        }

        /* ================= IMPORTANT ================= */

        .important-box {
            display: flex;
            gap: 16px;

            padding: 24px 26px;

            border: 1px solid #fde68a;
            border-radius: 18px;

            background: #fffbeb;
        }

        .important-box .icon {
            font-size: 24px;
        }

        .important-box h3 {
            margin-bottom: 6px;

            color: #92400e;
            font-size: 15px;
        }

        .important-box p {
            color: #78350f;

            font-size: 13.5px;
            line-height: 1.6;
        }

        /* ================= FOOTER ================= */

        .footer {
            margin-top: 80px;

            background:
                linear-gradient(
                    135deg,
                    #15152B,
                    #25254A
                );

            color: white;
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

        .brand h2 {
            margin-bottom: 18px;

            color: var(--blue);

            font-size: 32px;
        }

        .brand p {
            max-width: 420px;

            margin-bottom: 30px;

            color: #cbd5e1;

            line-height: 1.8;
        }

        .footer-section h3 {
            margin-bottom: 22px;
            font-size: 20px;
        }

        .footer-section ul {
            list-style: none;
        }

        .footer-section li {
            margin-bottom: 14px;
        }

        .footer-section a {
            color: #cbd5e1;
            transition: 0.3s;
        }

        .footer-section a:hover {
            color: var(--blue);
            padding-left: 6px;
        }

        .social-icons {
            display: flex;
            gap: 12px;
        }

        .social-icons a {
            width: 40px;
            height: 40px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 50%;

            background: rgba(255, 255, 255, 0.08);

            color: white;

            transition: 0.3s;
        }

        .social-icons a:hover {
            background: var(--blue);
            transform: translateY(-4px);
        }

        .footer-bottom {
            max-width: 1200px;
            margin: auto;

            padding: 22px 40px;

            display: flex;
            justify-content: space-between;

            border-top: 1px solid rgba(255, 255, 255, 0.12);

            color: #94a3b8;

            font-size: 14px;
        }

        /* ================= RESPONSIVE ================= */

        @media (max-width: 1100px) {

            .header {
                padding: 18px 30px;
            }

            .header nav {
                gap: 14px;
            }

            .main {
                padding: 40px 30px 70px;
            }
        }

        @media (max-width: 850px) {

            .header {
                flex-direction: column;
                gap: 15px;
            }

            .header nav {
                flex-wrap: wrap;
                justify-content: center;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .footer-container {
                grid-template-columns: 1fr;
                gap: 40px;
            }

            .footer-bottom {
                flex-direction: column;
                gap: 10px;
                text-align: center;
            }
        }

        @media (max-width: 600px) {

            .main {
                padding: 30px 20px 60px;
            }

            .main h1 {
                font-size: 28px;
            }

            .upload-panel {
                padding: 22px;
            }

            .header-right {
                width: 100%;
                justify-content: center;
            }

            .assignment-grid {
                grid-template-columns: 1fr;
            }

            .card-top-row {
                flex-direction: column;
            }

            .uploaded-file-box {
                align-items: flex-start;
                flex-wrap: wrap;
            }

            .footer-container {
                padding: 50px 25px;
                text-align: center;
            }

            .social-icons {
                justify-content: center;
            }

            .footer-bottom {
                padding: 20px;
            }
        }

    </style>

</head>

<body>

<form id="form1"
    runat="server"
    enctype="multipart/form-data">

    <!-- ================= HEADER ================= -->

    <header class="header">
    <div class="logo">STUDYVAULT.</div>
    <nav>
        <a href="Dashboard.aspx">Home</a>
        <a href="About.aspx">About</a>
        <a href="Resources.aspx">Resources</a>
        <a href="Categories.aspx">Categories</a>
        <a href="Favorites.aspx">Favorites</a>
        <a href="ASSIGNMENTCLINIC.aspx">Assignments</a>
        <a href="Feedback.aspx">Feedback</a>
    </nav>
    <div class="header-right">
        <div class="notification">🔔<span>3</span></div>
        <div class="user">
            <div id="avatarCircle" runat="server" class="avatar-circle"></div>
            <button type="button" class="logout-btn" onclick="window.location.href='Login.aspx'">Logout</button>
        </div>
    </div>
</header>

    <!-- ================= MAIN ================= -->

    <main class="main">

        <div class="intro-row">

            <div>

                <div class="eyebrow">
                    Assignment Clinic
                </div>

                <h1>
                    Keep your academic assignments organized in one place
                </h1>

            </div>

            <button
                type="button"
                class="upload-cta-btn"
                onclick="document.getElementById('uploadSection').scrollIntoView({behavior:'smooth'});">
                Submit Assignment
            </button>

        </div>

        <div class="hero-rule"></div>


        <!-- ================= SUCCESS ================= -->

        <asp:Panel
            ID="pnlSuccess"
            runat="server"
            CssClass="confirmation"
            Visible="false">

            <div class="check">
                ✓
            </div>

            <div>

                <h3>
                    Success
                </h3>

                <p>

                    <asp:Label
                        ID="lblSuccess"
                        runat="server">
                    </asp:Label>

                </p>

            </div>

        </asp:Panel>


        <!-- ================= ERROR ================= -->

        <asp:Panel
            ID="pnlError"
            runat="server"
            CssClass="error-box"
            Visible="false">

            <asp:Label
                ID="lblError"
                runat="server">
            </asp:Label>

        </asp:Panel>


        <!-- ================= ASSIGNMENTS ================= -->

        <section class="section">

            <div class="section-head">

                <h2>
                    Available Assignments
                </h2>

                <p>
                    View assignments provided by your teachers and download the required files.
                </p>

            </div>


            <!-- FILTERS -->

            <div class="filter-bar">

                <input
                    type="text"
                    id="txtSearch"
                    placeholder="Search assignments..."
                    autocomplete="off" />


                <asp:DropDownList
                    ID="ddlSemesterFilter"
                    runat="server">

                    <asp:ListItem
                        Text="All Semesters"
                        Value="" />

                </asp:DropDownList>


                <asp:DropDownList
                    ID="ddlSubjectFilter"
                    runat="server">

                    <asp:ListItem
                        Text="All Subjects"
                        Value="" />

                </asp:DropDownList>


                <select id="ddlStatusFilter">

                    <option value="">
                        All Statuses
                    </option>

                    <option value="active">
                        Active
                    </option>

                    <option value="submitted">
                        Submitted
                    </option>

                    <option value="overdue">
                        Overdue
                    </option>

                </select>

            </div>


            <p class="result-count">

                Showing

                <asp:Label
                    ID="lblResultCount"
                    runat="server">
                    0
                </asp:Label>

                assignments

            </p>


            <!-- ASSIGNMENT CARDS -->

            <div
                class="assignment-grid"
                id="assignmentGrid">

                <asp:Repeater
                    ID="rptAssignments"
                    runat="server"
                    OnItemCommand="rptAssignments_ItemCommand">

                    <ItemTemplate>
                            class="assignment-card"
                           data-title="<%# HttpUtility.HtmlAttributeEncode(Convert.ToString(Eval("Title"))) %>"
data-semester="<%# HttpUtility.HtmlAttributeEncode(Convert.ToString(Eval("Semester"))) %>"
data-subject="<%# HttpUtility.HtmlAttributeEncode(Convert.ToString(Eval("Subject"))) %>"
data-status="<%# HttpUtility.HtmlAttributeEncode(Convert.ToString(Eval("StatusKey"))) %>"

                            <div class="card-top-row">

                                <div class="card-title-group">

                                    <div class="doc-icon">
                                        📄
                                    </div>

                                    <h3>
                                        <%# Server.HtmlEncode(
                                            Convert.ToString(
                                                Eval("Title")
                                            )
                                        ) %>
                                    </h3>

                                </div>

                                <span class="status-badge <%# Eval("StatusKey") %>">

                                    <%# Server.HtmlEncode(
                                        Convert.ToString(
                                            Eval("Status")
                                        )
                                    ) %>

                                </span>

                            </div>


                            <div class="meta-list">

                                <div>

                                    <span class="label">
                                        Subject
                                    </span>

                                    <span class="value">

                                        <%# Server.HtmlEncode(
                                            Convert.ToString(
                                                Eval("Subject")
                                            )
                                        ) %>

                                    </span>

                                </div>


                                <div>

                                    <span class="label">
                                        Teacher
                                    </span>

                                    <span class="value">

                                        <%# Server.HtmlEncode(
                                            Convert.ToString(
                                                Eval("Teacher")
                                            )
                                        ) %>

                                    </span>

                                </div>


                                <div>

                                    <span class="label">
                                        Semester
                                    </span>

                                    <span class="value">

                                        <%# Server.HtmlEncode(
                                            Convert.ToString(
                                                Eval("Semester")
                                            )
                                        ) %>

                                    </span>

                                </div>


                                <div>

                                    <span class="label">
                                        Due
                                    </span>

                                    <span class="value">

                                        <%# Eval("DueDateDisplay") %>

                                    </span>

                                </div>

                            </div>


                            <div class="card-description">

                                <%# Server.HtmlEncode(
                                    Convert.ToString(
                                        Eval("Description")
                                    )
                                ) %>

                            </div>


                            <!-- ASSIGNMENT FILE -->

                            <div class="uploaded-file-box">

                                <div class="uploaded-file-icon">
                                    📎
                                </div>

                                <div class="uploaded-file-info">

                                    <div class="uploaded-file-label">
                                        Assignment File
                                    </div>

                                    <div class="uploaded-file-name">

                                        <%#
                                            String.IsNullOrWhiteSpace(
                                                Convert.ToString(
                                                    Eval("FileName")
                                                )
                                            )
                                            ? "❌ No file uploaded"
                                            : "✅ " +
                                              (
                                                  String.IsNullOrWhiteSpace(
                                                      Convert.ToString(
                                                          Eval("OriginalFileName")
                                                      )
                                                  )
                                                  ?
                                                  Convert.ToString(
                                                      Eval("FileName")
                                                  )
                                                  :
                                                  Convert.ToString(
                                                      Eval("OriginalFileName")
                                                  )
                                              )
                                        %>

                                    </div>

                                </div>


                                <asp:LinkButton
                                    ID="btnDownload"
                                    runat="server"
                                    CssClass="download-btn"
                                    CommandName="Download"
                                    CommandArgument='<%# Eval("Id") %>'>

                                    ↓ Download

                                </asp:LinkButton>

                            </div>

                        </div>

                    </ItemTemplate>

                </asp:Repeater>


                <div
                    class="empty-state"
                    id="emptyState">

                    <div class="icon">
                        📭
                    </div>

                    <p>
                        No assignments match your filters.
                    </p>

                </div>

            </div>

        </section>


        <!-- ================= STUDENT SUBMISSION ================= -->

        <section
            class="section"
            id="uploadSection">

            <div class="section-head">

                <h2>
                    Submit Your Assignment
                </h2>

                <p>
                    Select an assignment, upload your completed work, and submit it before the deadline.
                </p>

            </div>


            <div class="upload-panel">

                <!-- ASSIGNMENT -->

                <div class="field">

                    <label for="<%= ddlAssignment.ClientID %>">

                        Select Assignment

                        <span class="required">
                            *
                        </span>

                    </label>

                    <asp:DropDownList
                        ID="ddlAssignment"
                        runat="server">

                        <asp:ListItem
                            Text="-- Select Assignment --"
                            Value="" />

                    </asp:DropDownList>

                </div>


                <!-- SUBMISSION NOTE -->

                <div class="field">

                    <label for="<%= txtSubmissionNote.ClientID %>">

                        Submission Note

                    </label>

                    <asp:TextBox
                        ID="txtSubmissionNote"
                        runat="server"
                        TextMode="MultiLine"
                        placeholder="Add any note for your teacher...">
                    </asp:TextBox>

                </div>


                <!-- FILE -->

                <div class="field">

                    <label for="<%= fileUpload.ClientID %>">

                        Upload Your Assignment

                        <span class="required">
                            *
                        </span>

                    </label>

                    <asp:FileUpload
                        ID="fileUpload"
                        runat="server" />

                    <small style="
                        display:block;
                        margin-top:8px;
                        color:#6b7280;
                        font-size:12px;">
                        Allowed files: PDF, DOC, DOCX, XLS, XLSX, PPT, PPTX,
                        TXT, JPG, JPEG, PNG and ZIP.
                    </small>

                </div>


                <!-- BUTTON -->

                <div class="submit-row">

                    <asp:Button
                        ID="btnUpload"
                        runat="server"
                        CssClass="submit-btn"
                        Text="Submit Assignment"
                        OnClick="btnUpload_Click" />

                </div>

            </div>

        </section>
        <!-- ================= MY SUBMISSIONS ================= -->

<section class="section">

    <div class="section-head">

        <h2>
            My Submissions
        </h2>

        <p>
            Track the assignments you have submitted and view their current status.
        </p>

    </div>

    <asp:Panel
        ID="pnlNoMySubmissions"
        runat="server"
        CssClass="empty-state"
        Visible="false"
        Style="display:block;">

        <div class="icon">
            📭
        </div>

        <p>
            You have not submitted any assignments yet.
        </p>

    </asp:Panel>


    <asp:Repeater
        ID="rptMySubmissions"
        runat="server">

        <HeaderTemplate>

            <div class="assignment-grid">

        </HeaderTemplate>


        <ItemTemplate>

            <div class="assignment-card">

                <div class="card-top-row">

                    <div class="card-title-group">

                        <div class="doc-icon">
                            📤
                        </div>

                        <h3>
                            <%# Server.HtmlEncode(
                                Convert.ToString(
                                    Eval("AssignmentTitle")
                                )
                            ) %>
                        </h3>

                    </div>

                    <span class="status-badge submitted">

                        <%# Server.HtmlEncode(
                            Convert.ToString(
                                Eval("Status")
                            )
                        ) %>

                    </span>

                </div>


                <div class="meta-list">

                    <div>

                        <span class="label">
                            Submitted
                        </span>

                        <span class="value">

                            <%#
                                Convert.ToDateTime(
                                    Eval("SubmittedDate")
                                ).ToString("dd MMM yyyy, hh:mm tt")
                            %>

                        </span>

                    </div>

                    <div>

                        <span class="label">
                            Status
                        </span>

                        <span class="value">

                            <%# Server.HtmlEncode(
                                Convert.ToString(
                                    Eval("Status")
                                )
                            ) %>

                        </span>

                    </div>

                </div>


                <div class="card-description">

                    <strong>Administrator Comment:</strong>

                    <br />

                    <%#
                        String.IsNullOrWhiteSpace(
                            Convert.ToString(
                                Eval("Comment")
                            )
                        )
                        ? "No comment yet."
                        : Server.HtmlEncode(
                            Convert.ToString(
                                Eval("Comment")
                            )
                        )
                    %>

                </div>

            </div>

        </ItemTemplate>


        <FooterTemplate>

            </div>

        </FooterTemplate>

    </asp:Repeater>

</section>


        <!-- ================= IMPORTANT ================= -->

        <section class="section">

            <div class="important-box">

                <div class="icon">
                    ⚠️
                </div>

                <div>

                    <h3>
                        Important
                    </h3>

                    <p>
                        Make sure your file is correct before submitting.
                        Submissions after the deadline will not be accepted.
                        Follow your institution's academic integrity policies.
                    </p>

                </div>

            </div>

        </section>

    </main>

  <footer class="footer">


    <div class="footer-container">


        <!-- BRAND -->

        <div class="footer-brand">

            <h2>
                STUDYVAULT.
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


<script>

    document.addEventListener("DOMContentLoaded", function () {

        var searchInput =
            document.getElementById("txtSearch");

        var semesterFilter =
            document.getElementById("<%= ddlSemesterFilter.ClientID %>");

        var subjectFilter =
            document.getElementById("<%= ddlSubjectFilter.ClientID %>");

        var statusFilter =
            document.getElementById("ddlStatusFilter");

        var emptyState =
            document.getElementById("emptyState");

        var resultLabel =
            document.getElementById(
                "<%= lblResultCount.ClientID %>"
            );


        function applyFilters() {

            var query =
                searchInput
                    ? searchInput.value.trim().toLowerCase()
                    : "";

            var semester =
                semesterFilter
                    ? semesterFilter.value
                    : "";

            var subject =
                subjectFilter
                    ? subjectFilter.value
                    : "";

            var status =
                statusFilter
                    ? statusFilter.value
                    : "";


            var cards =
                document.querySelectorAll(
                    ".assignment-card"
                );


            var visible = 0;


            cards.forEach(function (card) {

                var title =
                    (
                        card.getAttribute("data-title") || ""
                    ).toLowerCase();

                var cardSemester =
                    card.getAttribute("data-semester") || "";

                var cardSubject =
                    card.getAttribute("data-subject") || "";

                var cardStatus =
                    card.getAttribute("data-status") || "";


                var matchesSearch =
                    query === "" ||
                    title.indexOf(query) !== -1;


                var matchesSemester =
                    semester === "" ||
                    cardSemester === semester;


                var matchesSubject =
                    subject === "" ||
                    cardSubject === subject;


                var matchesStatus =
                    status === "" ||
                    cardStatus === status;


                var show =
                    matchesSearch &&
                    matchesSemester &&
                    matchesSubject &&
                    matchesStatus;


                card.style.display =
                    show ? "" : "none";


                if (show) {
                    visible++;
                }

            });


            if (emptyState) {

                emptyState.classList.toggle(
                    "visible",
                    visible === 0
                );

            }


            if (resultLabel) {

                resultLabel.textContent =
                    visible;

            }

        }


        if (searchInput) {

            searchInput.addEventListener(
                "input",
                applyFilters
            );

        }


        if (semesterFilter) {

            semesterFilter.addEventListener(
                "change",
                applyFilters
            );

        }


        if (subjectFilter) {

            subjectFilter.addEventListener(
                "change",
                applyFilters
            );

        }


        if (statusFilter) {

            statusFilter.addEventListener(
                "change",
                applyFilters
            );

        }


        applyFilters();

    });

</script>


</body>
</html>