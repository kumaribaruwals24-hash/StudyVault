<%@ Page Title="Resources - StudyVault"
    Language="C#"
    AutoEventWireup="true"
    CodeBehind="Resources.aspx.cs"
    Inherits="STUDYVAULT.Resources" %>

<!DOCTYPE html>
<html lang="en">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
          content="width=device-width, initial-scale=1" />

    <title>Resources - StudyVault</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            background: #f5f6fa;
            color: #111827;
        }

        a {
            text-decoration: none;
        }

        /* =====================================================
           CATEGORY COLORS
        ===================================================== */

        :root {
            --ai-accent: #8b5cf6;
            --ai-tint: #f5f3ff;
            --ai-text: #6d28d9;

            --webdev-accent: #3b82f6;
            --webdev-tint: #eff6ff;
            --webdev-text: #1d4ed8;

            --databases-accent: #06b6d4;
            --databases-tint: #ecfeff;
            --databases-text: #0e7490;

            --security-accent: #ef4444;
            --security-tint: #fef2f2;
            --security-text: #b91c1c;

            --networking-accent: #10b981;
            --networking-tint: #ecfdf5;
            --networking-text: #047857;

            --design-accent: #f59e0b;
            --design-tint: #fffbeb;
            --design-text: #b45309;
        }


        /* =====================================================
           HEADER
        ===================================================== */

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

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;

            font-size: 22px;
            font-weight: 800;

            color: #4f46e5;

            white-space: nowrap;
        }

        .header nav {
            display: flex;
            gap: 25px;
        }

        .header nav a {
            color: #6b7280;

            font-weight: 600;
            font-size: 14px;

            padding-bottom: 4px;

            border-bottom: 2px solid transparent;

            transition: .2s;
        }

        .header nav a:hover {
            color: #111827;
        }

        .header nav .active {
            color: #4f46e5;
            border-bottom-color: #4f46e5;
        }


        /* =====================================================
           HEADER RIGHT
        ===================================================== */

        .header-right {
            display: flex;
            align-items: center;
            gap: 18px;

            flex-shrink: 0;
        }

        .notification {
            position: relative;
            font-size: 20px;
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

            font-weight: 700;
            font-size: 13px;

            display: flex;
            align-items: center;
            justify-content: center;
        }

        .logout-btn {
            background: #f3f4f6;
            color: #374151;

            border: none;

            padding: 9px 18px;

            border-radius: 20px;

            cursor: pointer;

            font-weight: 600;
            font-size: 14px;

            transition: .2s;
        }

        .logout-btn:hover {
            background: #fee2e2;
            color: #dc2626;
        }


        /* =====================================================
           MAIN
        ===================================================== */

        .main {
            padding: 50px 80px;
            min-height: 650px;
        }

        .eyebrow {
            text-transform: uppercase;

            letter-spacing: 1.5px;

            font-size: 12px;

            font-weight: 700;

            color: #4f46e5;

            margin-bottom: 8px;
        }

        .main h1 {
            font-size: 34px;

            font-weight: 800;

            margin: 0 0 10px;
        }

        .subtitle {
            color: #6b7280;

            margin-bottom: 10px;

            font-size: 15px;
        }

        .hero-rule {
            height: 4px;

            width: 64px;

            border-radius: 4px;

            background:
                linear-gradient(
                    90deg,
                    #4f46e5,
                    #3b82f6,
                    #06b6d4
                );

            margin-bottom: 30px;
        }


        /* =====================================================
           SEARCH
        ===================================================== */

        .search-bar {
            display: flex;
            align-items: center;

            background: white;

            padding: 8px 10px 8px 25px;

            border-radius: 30px;

            box-shadow:
                0 10px 25px rgba(0,0,0,.08);

            margin-bottom: 25px;
        }

        .search-bar input {
            flex: 1;

            border: none;

            outline: none;

            font-size: 16px;

            color: #374151;

            background: transparent;
        }

        .search-bar button {
            background: #3b82f6;

            color: white;

            border: none;

            border-radius: 20px;

            padding: 10px 20px;

            cursor: pointer;

            font-weight: 600;
        }

        .search-bar button:hover {
            background: #2563eb;
        }

        #btnClearSearch {
            background: #e5e7eb;
            color: #374151;
            margin-right: 6px;
            display: none;
        }


        /* =====================================================
           FILTERS
        ===================================================== */

        .filters {
            display: flex;

            gap: 10px;

            flex-wrap: wrap;

            margin-bottom: 20px;
        }

        .filter-btn {
            padding: 10px 18px;

            border-radius: 20px;

            border: none;

            background: #eef2ff;

            color: #374151;

            cursor: pointer;

            font-weight: 600;

            font-size: 14px;

            transition: .2s;
        }

        .filter-btn:hover {
            background: #e0e7ff;
        }

        .filter-btn.active {
            background: #4f46e5;

            color: white;
        }

        .result-count {
            color: #6b7280;

            font-size: 14px;

            margin-bottom: 18px;
        }


        /* =====================================================
           RESOURCE GRID
        ===================================================== */

        .resource-grid {
            display: grid;

            grid-template-columns:
                repeat(
                    auto-fit,
                    minmax(270px, 1fr)
                );

            gap: 22px;
        }


        /* =====================================================
           RESOURCE CARD
        ===================================================== */

        .resource-card {
            background: white;

            padding: 22px;

            border-radius: 16px;

            box-shadow:
                0 10px 25px rgba(0,0,0,.06);

            transition:
                transform .25s,
                box-shadow .25s;

            display: flex;

            flex-direction: column;

            border-top: 4px solid #d1d5db;
        }

        .resource-card:hover {
            transform: translateY(-5px);

            box-shadow:
                0 16px 30px rgba(0,0,0,.12);
        }

        .card-top {
            display: flex;

            align-items: center;

            justify-content: space-between;

            margin-bottom: 14px;
        }

        .icon-badge {
            width: 44px;
            height: 44px;

            border-radius: 12px;

            display: flex;

            align-items: center;
            justify-content: center;

            font-size: 20px;

            background: #f3f4f6;
        }

        .card-top-right {
            display: flex;

            align-items: center;

            gap: 8px;
        }

        .format-chip {
            font-size: 11px;

            font-weight: 700;

            text-transform: uppercase;

            letter-spacing: .5px;

            color: #6b7280;

            background: #f3f4f6;

            padding: 4px 10px;

            border-radius: 10px;
        }


        /* =====================================================
           FAVORITE
        ===================================================== */

        .favorite-btn {
            width: 32px;
            height: 32px;

            border-radius: 50%;

            border: none;

            background: #f3f4f6;

            color: #9ca3af;

            font-size: 15px;

            cursor: pointer;

            display: flex;

            align-items: center;
            justify-content: center;

            transition: .2s;
        }

        .favorite-btn::before {
            content: '♡';
        }

        .favorite-btn:hover {
            background: #fee2e2;
            color: #ef4444;
        }

        .favorite-btn.active {
            background: #fee2e2;
            color: #ef4444;
        }

        .favorite-btn.active::before {
            content: '♥';
        }


        /* =====================================================
           TITLE / DESCRIPTION
        ===================================================== */

        .resource-card h3 {
            font-size: 17px;

            font-weight: 700;

            margin: 0 0 10px;

            color: #111827;

            line-height: 1.35;
        }

        .description {
            color: #6b7280;

            font-size: 13px;

            line-height: 1.6;

            margin-bottom: 16px;

            display: -webkit-box;

            -webkit-line-clamp: 3;

            -webkit-box-orient: vertical;

            overflow: hidden;
        }

        .tag-row {
            display: flex;

            align-items: center;

            gap: 8px;

            margin-bottom: 18px;

            flex-grow: 1;
        }

        .category-tag {
            font-size: 12px;

            font-weight: 700;

            padding: 4px 10px;

            border-radius: 10px;

            background: #eef2ff;

            color: #4f46e5;
        }

        .meta-text {
            font-size: 13px;

            color: #9ca3af;
        }


        /* =====================================================
           DOWNLOAD
        ===================================================== */

        .download-btn {
            display: block;

            width: 100%;

            text-align: center;

            background: #3b82f6;

            color: white;

            border: none;

            border-radius: 12px;

            padding: 10px;

            font-weight: 600;

            cursor: pointer;

            transition: .2s;
        }

        .download-btn:hover {
            background: #2563eb;

            color: white;
        }


        /* =====================================================
           CATEGORY COLORS
        ===================================================== */

        .resource-card[data-category="1"] {
            border-top-color: var(--webdev-accent);
        }

        .resource-card[data-category="1"] .icon-badge {
            background: var(--webdev-tint);
        }

        .resource-card[data-category="1"] .category-tag {
            background: var(--webdev-tint);
            color: var(--webdev-text);
        }


        .resource-card[data-category="2"] {
            border-top-color: var(--databases-accent);
        }

        .resource-card[data-category="2"] .icon-badge {
            background: var(--databases-tint);
        }

        .resource-card[data-category="2"] .category-tag {
            background: var(--databases-tint);
            color: var(--databases-text);
        }


        .resource-card[data-category="3"] {
            border-top-color: var(--networking-accent);
        }

        .resource-card[data-category="3"] .icon-badge {
            background: var(--networking-tint);
        }

        .resource-card[data-category="3"] .category-tag {
            background: var(--networking-tint);
            color: var(--networking-text);
        }


        .resource-card[data-category="4"] {
            border-top-color: var(--ai-accent);
        }

        .resource-card[data-category="4"] .icon-badge {
            background: var(--ai-tint);
        }

        .resource-card[data-category="4"] .category-tag {
            background: var(--ai-tint);
            color: var(--ai-text);
        }


        .resource-card[data-category="5"] {
            border-top-color: var(--security-accent);
        }

        .resource-card[data-category="5"] .icon-badge {
            background: var(--security-tint);
        }

        .resource-card[data-category="5"] .category-tag {
            background: var(--security-tint);
            color: var(--security-text);
        }


        .resource-card[data-category="6"] {
            border-top-color: var(--design-accent);
        }

        .resource-card[data-category="6"] .icon-badge {
            background: var(--design-tint);
        }

        .resource-card[data-category="6"] .category-tag {
            background: var(--design-tint);
            color: var(--design-text);
        }


        /* =====================================================
           EMPTY STATE
        ===================================================== */

        .empty-state {
            display: none;

            text-align: center;

            padding: 60px 20px;

            color: #6b7280;
        }

        .empty-state.visible {
            display: block;
        }

        .empty-state .icon {
            font-size: 40px;

            margin-bottom: 10px;
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

            color: #fff;

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

        .brand h2 {
            font-size: 32px;

            margin-bottom: 18px;

            color: #38bdf8;
        }

        .brand p {
            color: #cbd5e1;

            line-height: 1.8;

            margin-bottom: 30px;

            max-width: 420px;
        }

        .footer-section h3 {
            font-size: 20px;

            margin-bottom: 22px;
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
        }

        .social-icons a:hover {
            background: #38bdf8;

            transform: translateY(-4px);
        }

        .footer-bottom {
            border-top:
                1px solid rgba(255,255,255,.12);

            max-width: 1200px;

            margin: auto;

            padding: 22px 40px;

            display: flex;

            justify-content: space-between;

            align-items: center;

            color: #94a3b8;

            font-size: 15px;
        }


        /* =====================================================
           RESPONSIVE
        ===================================================== */

        @media (max-width: 1100px) {

            .header {
                padding: 18px 25px;
            }

            .header nav {
                gap: 12px;
            }

            .main {
                padding: 40px 30px;
            }
        }

        @media (max-width: 850px) {

            .header {
                flex-wrap: wrap;

                gap: 15px;
            }

            .header nav {
                order: 3;

                width: 100%;

                justify-content: center;

                flex-wrap: wrap;
            }

            .footer-container {
                grid-template-columns: 1fr 1fr;
            }
        }

        @media (max-width: 650px) {

            .main {
                padding: 30px 20px;
            }

            .header {
                padding: 15px 20px;
            }

            .header nav {
                gap: 12px;
            }

            .footer-container {
                grid-template-columns: 1fr;

                text-align: center;

                padding: 50px 25px;
            }

            .brand p {
                max-width: 100%;
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

    </style>

</head>


<body>

<form id="form1" runat="server">


    <!-- =====================================================
         HEADER
    ====================================================== -->

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


    <!-- =====================================================
         MAIN
    ====================================================== -->

    <main class="main">


        <div class="eyebrow">
            Your library
        </div>


        <h1>
            Resources
        </h1>


        <p class="subtitle">
            Browse and download your study library.
        </p>


        <div class="hero-rule"></div>


        <!-- =================================================
             SEARCH
        ================================================== -->

        <div class="search-bar"
             role="search">

            <label for="txtSearch"
                   style="position:absolute;left:-9999px;">

                Search resources

            </label>


            <input type="text"
                   id="txtSearch"
                   placeholder="Search resources..."
                   autocomplete="off" />


            <button type="button"
                    id="btnClearSearch">

                ✕

            </button>


            <button type="button"
                    id="btnSearchGo">

                Search

            </button>

        </div>


        <!-- =================================================
             FILTERS

             IMPORTANT:
             CategoryID values used here:

             1 = Web Development
             2 = Databases
             3 = Networking
             4 = AI
             5 = Security
             6 = Design

             If your Categories table uses different IDs,
             change these values.
        ================================================== -->

        <div class="filters"
             id="filterGroup">

            <button type="button"
                    class="filter-btn active"
                    data-category="all">

                All

            </button>


            <button type="button"
                    class="filter-btn"
                    data-category="1">

                Web Dev

            </button>


            <button type="button"
                    class="filter-btn"
                    data-category="2">

                Databases

            </button>


            <button type="button"
                    class="filter-btn"
                    data-category="3">

                Networking

            </button>


            <button type="button"
                    class="filter-btn"
                    data-category="4">

                AI

            </button>


            <button type="button"
                    class="filter-btn"
                    data-category="5">

                Security

            </button>


            <button type="button"
                    class="filter-btn"
                    data-category="6">

                Design

            </button>

        </div>


        <!-- =================================================
             RESULT COUNT
        ================================================== -->

        <p class="result-count"
           id="resultCount"
           aria-live="polite">

            Loading resources...

        </p>


        <!-- =================================================
             RESOURCE CARDS

             These fields MUST match your database:

             ResourceID
             Title
             Description
             FilePath
             CategoryID
             UploadDate
        ================================================== -->

        <div class="resource-grid"
             id="resourceGrid">


            <asp:Repeater ID="rptResources"
                          runat="server">


                <ItemTemplate>


                    <div class="resource-card"

                         data-title='<%# Eval("Title") %>'

                         data-description='<%# Eval("Description") %>'

                         data-category='<%# Eval("CategoryID") %>'>


                        <!-- CARD TOP -->

                        <div class="card-top">


                            <div class="icon-badge">

                                📄

                            </div>


                            <div class="card-top-right">


                                <span class="format-chip">

                                    Resource

                                </span>


                                <button type="button"

                                        class="favorite-btn"

                                        data-id='<%# Eval("ResourceID") %>'

                                        aria-label="Save to favorites">

                                </button>

                            </div>

                        </div>


                        <!-- TITLE -->

                        <h3>

                            <%# Eval("Title") %>

                        </h3>


                        <!-- DESCRIPTION -->

                        <div class="description">

                            <%# Eval("Description") %>

                        </div>


                        <!-- CATEGORY / DATE -->

                        <div class="tag-row">


                            <span class="category-tag">

                                <%# GetCategoryName(Eval("CategoryID")) %>

                            </span>


                            <span class="meta-text">

                                <%# FormatDate(Eval("UploadDate")) %>

                            </span>

                        </div>


                        <!-- DOWNLOAD -->

                       <a class="download-btn"
   href='<%# GetDownloadUrl(Eval("ResourceID")) %>'>
    Download
</a>


                    </div>


                </ItemTemplate>


            </asp:Repeater>


        </div>


        <!-- =================================================
             EMPTY STATE
        ================================================== -->

        <div class="empty-state"
             id="emptyState">

            <div class="icon">

                🔍

            </div>

            <p>

                No resources match your search.

                Try another keyword or category.

            </p>

        </div>


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


<!-- =========================================================
     SEARCH + CATEGORY FILTER
========================================================== -->

<script>

    (function () {

        var searchInput =
            document.getElementById("txtSearch");

        var clearBtn =
            document.getElementById("btnClearSearch");

        var searchBtn =
            document.getElementById("btnSearchGo");

        var filterBtns =
            document.querySelectorAll(".filter-btn");

        var cards =
            document.querySelectorAll(".resource-card");

        var emptyState =
            document.getElementById("emptyState");

        var resultCount =
            document.getElementById("resultCount");

        var activeCategory = "all";


        function applyFilters() {

            var query =
                searchInput.value
                    .trim()
                    .toLowerCase();


            var visibleCount = 0;


            cards.forEach(function (card) {


                var title =
                    (
                        card.getAttribute("data-title")
                        || ""
                    ).toLowerCase();


                var description =
                    (
                        card.getAttribute("data-description")
                        || ""
                    ).toLowerCase();


                var category =
                    card.getAttribute("data-category")
                    || "";


                var matchesSearch =
                    query === ""
                    ||
                    title.indexOf(query) !== -1
                    ||
                    description.indexOf(query) !== -1;


                var matchesCategory =
                    activeCategory === "all"
                    ||
                    category === activeCategory;


                var show =
                    matchesSearch
                    &&
                    matchesCategory;


                card.style.display =
                    show ? "" : "none";


                if (show) {

                    visibleCount++;

                }

            });


            if (visibleCount === 0) {

                emptyState.classList.add("visible");

            }
            else {

                emptyState.classList.remove("visible");

            }


            if (query.length > 0) {

                clearBtn.style.display =
                    "inline-block";

            }
            else {

                clearBtn.style.display =
                    "none";

            }


            resultCount.textContent =
                "Showing "
                + visibleCount
                + " resource"
                + (visibleCount === 1 ? "" : "s");

        }


        searchInput.addEventListener(
            "input",
            applyFilters
        );


        searchInput.addEventListener(
            "keydown",
            function (e) {

                if (e.key === "Enter") {

                    e.preventDefault();

                    applyFilters();

                }

            }
        );


        searchBtn.addEventListener(
            "click",
            applyFilters
        );


        clearBtn.addEventListener(
            "click",
            function () {

                searchInput.value = "";

                applyFilters();

                searchInput.focus();

            }
        );


        filterBtns.forEach(
            function (btn) {

                btn.addEventListener(
                    "click",
                    function () {


                        filterBtns.forEach(
                            function (b) {

                                b.classList.remove(
                                    "active"
                                );

                            }
                        );


                        btn.classList.add(
                            "active"
                        );


                        activeCategory =
                            btn.getAttribute(
                                "data-category"
                            );


                        applyFilters();

                    }
                );

            }
        );


        /*
         * Initial count
         */

        applyFilters();

    })();

</script>


<!-- =========================================================
     FAVORITES
========================================================== -->

<script>

    (function () {


        var STORAGE_KEY =
            "studyvault:favorites";


        function getFavorites() {

            try {

                return JSON.parse(
                    localStorage.getItem(
                        STORAGE_KEY
                    )
                ) || [];

            }
            catch (e) {

                return [];

            }

        }


        function saveFavorites(list) {

            localStorage.setItem(
                STORAGE_KEY,
                JSON.stringify(list)
            );

        }


        var favorites =
            getFavorites();


        document
            .querySelectorAll(".favorite-btn")
            .forEach(
                function (btn) {


                    var id =
                        btn.getAttribute(
                            "data-id"
                        );


                    if (
                        favorites.indexOf(id)
                        !== -1
                    ) {

                        btn.classList.add(
                            "active"
                        );

                    }


                    btn.addEventListener(
                        "click",
                        function () {


                            var current =
                                getFavorites();


                            var index =
                                current.indexOf(id);


                            if (index === -1) {


                                current.push(id);


                                btn.classList.add(
                                    "active"
                                );

                            }
                            else {


                                current.splice(
                                    index,
                                    1
                                );


                                btn.classList.remove(
                                    "active"
                                );

                            }


                            saveFavorites(
                                current
                            );

                        }
                    );

                }
            );

    })();

</script>


</body>

</html>