<%@ Page
    Title="Categories - StudyVault"
    Language="C#"
    AutoEventWireup="true"
    CodeBehind="Categories.aspx.cs"
    Inherits="STUDYVAULT.Categories" %>

<!DOCTYPE html>

<html lang="en">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <title>Categories - StudyVault</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            background: #f6f8ff;
            color: #111827;
        }

        a {
            text-decoration: none;
        }

        button {
            font-family: inherit;
        }


        /* ================= COLORS ================= */

        :root {

            --webdev-accent: #3b82f6;
            --webdev-tint: #eff6ff;
            --webdev-text: #1d4ed8;

            --databases-accent: #06b6d4;
            --databases-tint: #ecfeff;
            --databases-text: #0e7490;

            --networking-accent: #10b981;
            --networking-tint: #ecfdf5;
            --networking-text: #047857;

            --ai-accent: #8b5cf6;
            --ai-tint: #f5f3ff;
            --ai-text: #6d28d9;

            --security-accent: #ef4444;
            --security-tint: #fef2f2;
            --security-text: #b91c1c;

            --design-accent: #f59e0b;
            --design-tint: #fffbeb;
            --design-text: #b45309;
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
                0 4px 20px rgba(17,24,39,.06);
        }


        .logo {

            display: flex;
            align-items: center;

            gap: 10px;

            font-size: 22px;
            font-weight: 800;

            color: #4f46e5;
        }


        .header nav {

            display: flex;

            gap: 30px;
        }


        .header nav a {

            color: #6b7280;

            font-weight: 600;

            font-size: 15px;

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
        }


        .logout-btn:hover {

            background: #fee2e2;

            color: #dc2626;
        }


        /* ================= MAIN ================= */

        .main {

            padding: 44px 60px;

            min-height: 600px;
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

            margin-bottom: 10px;
        }


        .subtitle {

            color: #6b7280;

            font-size: 15px;

            margin-bottom: 10px;
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


        /* ================= SEARCH ================= */

        .search-bar {

            display: flex;

            align-items: center;

            background: white;

            padding: 8px 10px 8px 25px;

            border-radius: 30px;

            box-shadow:
                0 10px 25px rgba(17,24,39,.08);

            margin-bottom: 32px;

            max-width: 480px;
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

            background: #4f46e5;

            color: white;

            border: none;

            border-radius: 20px;

            padding: 10px 20px;

            cursor: pointer;

            font-weight: 600;
        }


        .search-bar button:hover {

            background: #4338ca;
        }


        /* ================= CATEGORY GRID ================= */

        .category-grid {

            display: grid;

            grid-template-columns:
                repeat(3, 1fr);

            gap: 24px;
        }


        .category-card {

            background: white;

            padding: 28px;

            border-radius: 22px;

            box-shadow:
                0 8px 24px rgba(17,24,39,.06);

            transition: .25s;

            display: flex;

            flex-direction: column;

            border-top: 4px solid #4f46e5;
        }


        .category-card:hover {

            transform: translateY(-6px);

            box-shadow:
                0 16px 32px rgba(17,24,39,.1);
        }


        .cat-top {

            display: flex;

            align-items: center;

            justify-content: space-between;

            margin-bottom: 18px;
        }


        .cat-icon {

            width: 54px;

            height: 54px;

            display: flex;

            align-items: center;

            justify-content: center;

            font-size: 26px;

            border-radius: 16px;

            background: #eff6ff;
        }


        .cat-count {

            font-size: 12.5px;

            font-weight: 700;

            padding: 5px 12px;

            border-radius: 12px;

            background: #eff6ff;

            color: #1d4ed8;
        }


        .category-card h3 {

            font-size: 19px;

            font-weight: 800;

            margin-bottom: 8px;
        }


        .category-card p {

            color: #6b7280;

            font-size: 14px;

            line-height: 1.55;

            margin-bottom: 22px;

            flex-grow: 1;
        }


        .browse-link {

            display: inline-flex;

            align-items: center;

            gap: 6px;

            font-weight: 700;

            font-size: 14px;

            color: #4f46e5;

            transition: .2s;
        }


        .browse-link:hover {

            gap: 10px;
        }


        /* ================= CATEGORY COLORS ================= */

        .category-card.webdev {

            border-top-color:
                var(--webdev-accent);
        }


        .category-card.webdev .cat-icon {

            background:
                var(--webdev-tint);
        }


        .category-card.webdev .cat-count {

            background:
                var(--webdev-tint);

            color:
                var(--webdev-text);
        }


        .category-card.webdev .browse-link {

            color:
                var(--webdev-text);
        }


        .category-card.databases {

            border-top-color:
                var(--databases-accent);
        }


        .category-card.databases .cat-icon {

            background:
                var(--databases-tint);
        }


        .category-card.databases .cat-count {

            background:
                var(--databases-tint);

            color:
                var(--databases-text);
        }


        .category-card.databases .browse-link {

            color:
                var(--databases-text);
        }


        .category-card.networking {

            border-top-color:
                var(--networking-accent);
        }


        .category-card.networking .cat-icon {

            background:
                var(--networking-tint);
        }


        .category-card.networking .cat-count {

            background:
                var(--networking-tint);

            color:
                var(--networking-text);
        }


        .category-card.networking .browse-link {

            color:
                var(--networking-text);
        }


        .category-card.ai {

            border-top-color:
                var(--ai-accent);
        }


        .category-card.ai .cat-icon {

            background:
                var(--ai-tint);
        }


        .category-card.ai .cat-count {

            background:
                var(--ai-tint);

            color:
                var(--ai-text);
        }


        .category-card.ai .browse-link {

            color:
                var(--ai-text);
        }


        .category-card.security {

            border-top-color:
                var(--security-accent);
        }


        .category-card.security .cat-icon {

            background:
                var(--security-tint);
        }


        .category-card.security .cat-count {

            background:
                var(--security-tint);

            color:
                var(--security-text);
        }


        .category-card.security .browse-link {

            color:
                var(--security-text);
        }


        .category-card.design {

            border-top-color:
                var(--design-accent);
        }


        .category-card.design .cat-icon {

            background:
                var(--design-tint);
        }


        .category-card.design .cat-count {

            background:
                var(--design-tint);

            color:
                var(--design-text);
        }


        .category-card.design .browse-link {

            color:
                var(--design-text);
        }


        /* ================= EMPTY ================= */

        .empty-state {

            display: none;

            text-align: center;

            padding: 60px 20px;

            color: #6b7280;

            grid-column: 1 / -1;
        }


        .empty-state.visible {

            display: block;
        }


        .empty-state .icon {

            font-size: 40px;

            margin-bottom: 10px;
        }


        /* ================= FOOTER ================= */

        .footer {

            background:
                linear-gradient(
                    135deg,
                    #0f172a,
                    #1e293b
                );

            color: white;

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
        }


        .footer-section li {

            margin-bottom: 14px;
        }


        .footer-section a {

            color: #cbd5e1;

            transition: .2s;
        }


        .footer-section a:hover {

            color: #38bdf8;

            padding-left: 5px;
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

            transition: .3s;
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

            color: #94a3b8;
        }


        /* ================= RESPONSIVE ================= */

        @media(max-width:1100px) {

            .category-grid {

                grid-template-columns:
                    repeat(2, 1fr);
            }
        }


        @media(max-width:900px) {

            .header {

                flex-direction: column;

                gap: 18px;

                padding: 18px 25px;
            }

            .header nav {

                flex-wrap: wrap;

                justify-content: center;

                gap: 15px;
            }

            .header-right {

                justify-content: center;
            }
        }


        @media(max-width:700px) {

            .main {

                padding: 30px 20px;
            }

            .category-grid {

                grid-template-columns: 1fr;
            }

            .search-bar {

                max-width: 100%;
            }

            .footer-container {

                grid-template-columns: 1fr;

                padding: 50px 25px;

                text-align: center;
            }

            .brand p {

                max-width: 100%;

                margin-left: auto;

                margin-right: auto;
            }

            .social-icons {

                justify-content: center;
            }

            .footer-bottom {

                flex-direction: column;

                gap: 10px;

                text-align: center;

                padding: 20px;
            }
        }

    </style>

</head>


<body>

<form id="form1" runat="server">


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

    <div class="main">


        <div class="eyebrow">
            Explore by subject
        </div>


        <h1>
            Categories
        </h1>


        <p class="subtitle">
            Find resources organized by what you're studying.
        </p>


        <div class="hero-rule"></div>



        <!-- ================= SEARCH ================= -->

        <div class="search-bar">

            <label
                for="txtSearch"
                style="position:absolute;left:-9999px;">

                Search categories

            </label>


            <input
                type="text"
                id="txtSearch"
                placeholder="Search categories..."
                autocomplete="off" />


            <button
                type="button"
                id="btnSearchGo">

                Search

            </button>

        </div>



        <!-- ================= CATEGORY GRID ================= -->

        <div
            class="category-grid"
            id="categoryGrid">


            <asp:Repeater
                ID="rptCategories"
                runat="server">

                <ItemTemplate>


                    <!--
                        IMPORTANT:
                        No GetCategoryCssClass() here.
                        CSS class is calculated directly.
                    -->

                    <div
                        class='category-card <%#
                            Eval("Name").ToString().ToLower().Contains("web")
                            ? "webdev"
                            :
                            Eval("Name").ToString().ToLower().Contains("database")
                            ? "databases"
                            :
                            Eval("Name").ToString().ToLower().Contains("network")
                            ? "networking"
                            :
                            Eval("Name").ToString().ToLower().Contains("artificial")
                            || Eval("Name").ToString().ToLower().Contains("ai")
                            ? "ai"
                            :
                            Eval("Name").ToString().ToLower().Contains("security")
                            ? "security"
                            :
                            Eval("Name").ToString().ToLower().Contains("design")
                            ? "design"
                            :
                            ""
                        %>'

                        data-name='<%# Eval("Name") %>'>


                        <div class="cat-top">


                            <div class="cat-icon">

                                <%# Eval("Icon") %>

                            </div>


                            <span class="cat-count">

                                <%# Eval("ResourceCount") %>

                                Resources

                            </span>

                        </div>



                        <h3>

                            <%# Eval("Name") %>

                        </h3>



                        <p>

                            <%# Eval("Description") %>

                        </p>



                        <a
                            class="browse-link"
                            href='<%#
                                "Resources.aspx?cat="
                                + Eval("Slug")
                            %>'>

                            Browse resources →

                        </a>


                    </div>

                </ItemTemplate>

            </asp:Repeater>



            <!-- ================= EMPTY STATE ================= -->

            <div
                class="empty-state"
                id="emptyState">

                <div
                    class="icon"
                    aria-hidden="true">

                    🔍

                </div>


                <p>

                    No categories match your search.

                </p>

            </div>


        </div>

    </div>



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



<!-- ================= SEARCH SCRIPT ================= -->

<script>

    (function () {

        var searchInput =
            document.getElementById("txtSearch");

        var searchGoBtn =
            document.getElementById("btnSearchGo");

        var cards =
            document.querySelectorAll(".category-card");

        var emptyState =
            document.getElementById("emptyState");


        function applyFilter() {

            var query =
                searchInput.value
                    .trim()
                    .toLowerCase();


            var visibleCount = 0;


            cards.forEach(function (card) {

                var name =
                    (
                        card.getAttribute("data-name")
                        || ""
                    ).toLowerCase();


                var show =
                    query === ""
                    ||
                    name.indexOf(query) !== -1;


                card.style.display =
                    show ? "" : "none";


                if (show) {

                    visibleCount++;

                }

            });


            emptyState.classList.toggle(
                "visible",
                visibleCount === 0
            );

        }


        searchInput.addEventListener(
            "input",
            applyFilter
        );


        searchInput.addEventListener(
            "keydown",
            function (e) {

                if (e.key === "Enter") {

                    e.preventDefault();

                    applyFilter();

                }

            }
        );


        searchGoBtn.addEventListener(
            "click",
            applyFilter
        );

    })();

</script>


</body>

</html>