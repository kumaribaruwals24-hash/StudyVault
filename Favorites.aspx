<%@ Page Title="Favorites - StudyVault" Language="C#" AutoEventWireup="true"
    CodeBehind="Favorites.aspx.cs" Inherits="STUDYVAULT.Favorites" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Favorites - StudyVault</title>
    <style>
        * { box-sizing: border-box; }
        body {
            margin: 0;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            background: #f5f6fa;
            color: #111827;
        }
        a { text-decoration: none; }

        :root {
            --ai-accent: #8b5cf6;      --ai-tint: #f5f3ff;      --ai-text: #6d28d9;
            --webdev-accent: #3b82f6;  --webdev-tint: #eff6ff;  --webdev-text: #1d4ed8;
            --databases-accent: #06b6d4; --databases-tint: #ecfeff; --databases-text: #0e7490;
            --security-accent: #ef4444; --security-tint: #fef2f2; --security-text: #b91c1c;
            --networking-accent: #10b981; --networking-tint: #ecfdf5; --networking-text: #047857;
            --design-accent: #f59e0b;  --design-tint: #fffbeb; --design-text: #b45309;
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
    box-shadow: 0 4px 20px rgba(17,24,39,.06);
}
.logo { display:flex; align-items:center; gap:10px; font-size:22px; font-weight:800; color:#4f46e5; }
.header nav { display:flex; gap:30px; }
.header nav a {
    color:#6b7280; font-weight:600; font-size:15px;
    padding-bottom:4px; border-bottom:2px solid transparent; transition:.2s;
}
.header nav a:hover { color:#111827; }
.header nav .active { color:#4f46e5; border-bottom-color:#4f46e5; }

.header-right {
    display: flex;
    align-items: center;
    gap: 18px;
    flex-wrap: nowrap;
    flex-shrink: 0;
}

.notification {
    position: relative;
    font-size: 20px;
    flex-shrink: 0;
}
.notification span {
    position:absolute; top:-6px; right:-9px;
    background:#ef4444; color:white;
    width:17px; height:17px; border-radius:50%;
    display:flex; justify-content:center; align-items:center;
    font-size:10px; font-weight:700;
}

.user {
    display: flex;
    align-items: center;
    gap: 12px;
    flex-wrap: nowrap;
    flex-shrink: 0;
}

.avatar-circle {
    width: 36px; height: 36px;
    border-radius: 50%;
    background: linear-gradient(135deg, #4f46e5, #8b5cf6);
    color: white;
    font-weight: 700;
    font-size: 13px;
    display: flex; align-items: center; justify-content: center;
    flex-shrink: 0;
    line-height: 1;
}

.logout-btn {
    background:#f3f4f6; color:#374151; border:none;
    padding:9px 18px; border-radius:20px; cursor:pointer;
    font-weight:600; font-size:14px;
    white-space: nowrap;
    flex-shrink: 0;
    transition:.2s;
}
.logout-btn:hover { background:#fee2e2; color:#dc2626; }
        a:focus-visible, button:focus-visible { outline: 3px solid #4f46e5; outline-offset: 2px; }

        .main { padding: 50px 80px; }
        .eyebrow {
            text-transform: uppercase;
            letter-spacing: 1.5px;
            font-size: 12px;
            font-weight: 700;
            color: #4f46e5;
            margin-bottom: 8px;
        }
        .title-row { display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 10px; }
        .main h1 { font-size: 34px; font-weight: 800; margin: 0; letter-spacing: -0.5px; }
        .main > p.subtitle { color: #6b7280; margin-bottom: 10px; font-size: 15px; }
        .hero-rule {
            height: 4px; width: 64px; border-radius: 4px;
            background: linear-gradient(90deg, #ef4444, #f59e0b);
            margin-bottom: 30px;
        }
        .clear-btn {
            background: white;
            border: 1px solid #e5e7eb;
            color: #6b7280;
            padding: 9px 18px;
            border-radius: 20px;
            font-weight: 600;
            font-size: 13.5px;
            cursor: pointer;
            transition: .2s;
        }
        .clear-btn:hover { background: #fef2f2; color: #dc2626; border-color: #fecaca; }

        .resource-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(270px, 1fr));
            gap: 22px;
        }
        .resource-card {
            background: white;
            padding: 22px;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0,0,0,.06);
            transition: transform .25s, box-shadow .25s, opacity .2s;
            display: flex;
            flex-direction: column;
            border-top: 4px solid #d1d5db;
        }
        .resource-card:hover { transform: translateY(-5px); box-shadow: 0 16px 30px rgba(0,0,0,.12); }
        .resource-card.removing { opacity: 0; transform: scale(.95); }

        .card-top { display: flex; align-items: center; justify-content: space-between; margin-bottom: 14px; }
        .icon-badge {
            width: 44px; height: 44px; border-radius: 12px;
            display: flex; align-items: center; justify-content: center;
            font-size: 20px; background: #f3f4f6;
        }
        .card-top-right { display: flex; align-items: center; gap: 8px; }
        .format-chip {
            font-size: 11px; font-weight: 700; text-transform: uppercase; letter-spacing: .5px;
            color: #6b7280; background: #f3f4f6; padding: 4px 10px; border-radius: 10px;
        }
        .favorite-btn {
            width: 32px; height: 32px; border-radius: 50%; border: none;
            background: #fee2e2; color: #ef4444; font-size: 15px; cursor: pointer;
            display: flex; align-items: center; justify-content: center; transition: .2s;
            flex-shrink: 0;
        }
        .favorite-btn::before { content: '♥'; }
        .favorite-btn:hover { background: #fecaca; }

        .resource-card h3 { font-size: 16.5px; font-weight: 700; margin: 0 0 10px; color: #111827; line-height: 1.35; }
        .tag-row { display: flex; align-items: center; gap: 8px; margin-bottom: 18px; flex-grow: 1; }
        .category-tag { font-size: 12px; font-weight: 700; padding: 4px 10px; border-radius: 10px; }
        .meta-text { font-size: 13px; color: #9ca3af; }

        .download-btn {
            display: block; width: 100%; text-align: center;
            background: #3b82f6; color: white; border: none; border-radius: 12px;
            padding: 10px; font-weight: 600; cursor: pointer; transition: .2s;
        }
        .download-btn:hover { background: #2563eb; }

        .resource-card[data-category="ai"] { border-top-color: var(--ai-accent); }
        .resource-card[data-category="ai"] .icon-badge { background: var(--ai-tint); }
        .resource-card[data-category="ai"] .category-tag { background: var(--ai-tint); color: var(--ai-text); }
        .resource-card[data-category="webdev"] { border-top-color: var(--webdev-accent); }
        .resource-card[data-category="webdev"] .icon-badge { background: var(--webdev-tint); }
        .resource-card[data-category="webdev"] .category-tag { background: var(--webdev-tint); color: var(--webdev-text); }
        .resource-card[data-category="databases"] { border-top-color: var(--databases-accent); }
        .resource-card[data-category="databases"] .icon-badge { background: var(--databases-tint); }
        .resource-card[data-category="databases"] .category-tag { background: var(--databases-tint); color: var(--databases-text); }
        .resource-card[data-category="security"] { border-top-color: var(--security-accent); }
        .resource-card[data-category="security"] .icon-badge { background: var(--security-tint); }
        .resource-card[data-category="security"] .category-tag { background: var(--security-tint); color: var(--security-text); }
        .resource-card[data-category="networking"] { border-top-color: var(--networking-accent); }
        .resource-card[data-category="networking"] .icon-badge { background: var(--networking-tint); }
        .resource-card[data-category="networking"] .category-tag { background: var(--networking-tint); color: var(--networking-text); }
        .resource-card[data-category="design"] { border-top-color: var(--design-accent); }
        .resource-card[data-category="design"] .icon-badge { background: var(--design-tint); }
        .resource-card[data-category="design"] .category-tag { background: var(--design-tint); color: var(--design-text); }

        .empty-state {
            display: none;
            text-align: center;
            padding: 80px 20px;
            color: #6b7280;
        }
        .empty-state.visible { display: block; }
        .empty-state .icon { font-size: 48px; margin-bottom: 16px; }
        .empty-state h3 { font-size: 18px; color: #111827; margin-bottom: 8px; }
        .empty-state p { font-size: 14px; max-width: 340px; margin: 0 auto 20px; line-height: 1.5; }
        .empty-state a.browse-link {
            display: inline-block;
            background: #4f46e5; color: white;
            padding: 10px 24px; border-radius: 20px;
            font-weight: 600; font-size: 14px;
        }

     /* ================= FOOTER ================= */

.footer{
    background:linear-gradient(135deg,#0f172a,#1e293b);
    color:#fff;
    margin-top:80px;
}

.footer-container{
    max-width:1200px;
    margin:auto;
    padding:70px 40px;
    display:grid;
    grid-template-columns:2fr 1fr 1fr;
    gap:70px;
}

/* Logo */

.brand h2{
    font-size:32px;
    margin-bottom:18px;
    color:#38bdf8;
}

.brand p{
    color:#cbd5e1;
    line-height:1.8;
    margin-bottom:30px;
    max-width:420px;
}

/* Headings */

.footer-section h3{
    font-size:20px;
    margin-bottom:22px;
    position:relative;
}

.footer-section h3::after{
    content:"";
    width:45px;
    height:3px;
    background:#38bdf8;
    display:block;
    margin-top:8px;
    border-radius:10px;
}

/* Links */

.footer-section ul{
    list-style:none;
    padding:0;
    margin:0;
}

.footer-section li{
    margin-bottom:14px;
}

.footer-section a{
    text-decoration:none;
    color:#cbd5e1;
    transition:.3s;
}

.footer-section a:hover{
    color:#38bdf8;
    padding-left:8px;
}

/* Social */

.social-icons{
    display:flex;
    gap:14px;
}

.social-icons a{
    width:42px;
    height:42px;
    border-radius:50%;
    background:rgba(255,255,255,.08);
    display:flex;
    justify-content:center;
    align-items:center;
    color:white;
    transition:.35s;
    font-size:17px;
}

.social-icons a:hover{
    background:#38bdf8;
    transform:translateY(-6px);
}

/* Bottom */

.footer-bottom{
    border-top:1px solid rgba(255,255,255,.12);
    max-width:1200px;
    margin:auto;
    padding:22px 40px;
    display:flex;
    justify-content:space-between;
    align-items:center;
    color:#94a3b8;
    font-size:15px;
}

/* Tablet */

@media(max-width:900px){

.footer-container{
grid-template-columns:1fr 1fr;
gap:50px;
}

.brand{
grid-column:1/3;
}

}

/* Mobile */

@media(max-width:650px){

.footer-container{
grid-template-columns:1fr;
text-align:center;
padding:60px 25px;
}

.brand{
grid-column:auto;
}

.brand p{
max-width:100%;
}

.footer-section h3::after{
margin:8px auto 0;
}

.social-icons{
justify-content:center;
}

.footer-bottom{
flex-direction:column;
text-align:center;
gap:10px;
padding:20px;
}

}
        @media (max-width: 700px) {
            header { flex-direction: column; gap: 15px; padding: 18px 20px; }
            .main { padding: 30px 20px; }
            .title-row { flex-direction: column; align-items: flex-start; gap: 14px; }
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

        <div class="main">
            <div class="eyebrow">Saved for later</div>
            <div class="title-row">
                <div>
                    <h1>Favorites</h1>
                </div>
                <button type="button" class="clear-btn" id="btnClearAll">Clear all</button>
            </div>
            <p class="subtitle">Resources you've saved for quick access.</p>
            <div class="hero-rule"></div>

            <div class="resource-grid" id="favoritesGrid"></div>

            <div class="empty-state" id="emptyState">
                <div class="icon" aria-hidden="true">🤍</div>
                <h3>No favorites yet</h3>
                <p>Browse the resource library and tap the heart on anything you want to find quickly later.</p>
                <a class="browse-link" href="Resources.aspx">Browse Resources</a>
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

    <script>
        (function () {
            var STORAGE_KEY = 'studyvault:favorites';

            // Same 18 resources as Resources.aspx — keep this list in sync if you add/remove there.
            var RESOURCE_DATA = [
                { id: '1',  title: 'Intro to Graph Algorithms',            icon: '📄', category: 'ai',         categoryLabel: 'AI',          format: 'PDF',    meta: '2.4 MB' },
                { id: '2',  title: 'Neural Networks from Scratch',         icon: '🎥', category: 'ai',         categoryLabel: 'AI',          format: 'Video',  meta: '55 min' },
                { id: '3',  title: 'Prompt Engineering Basics',            icon: '🎓', category: 'ai',         categoryLabel: 'AI',          format: 'Course', meta: '6 lessons' },
                { id: '4',  title: 'React Server Components Deep Dive',    icon: '🎥', category: 'webdev',     categoryLabel: 'Web Dev',     format: 'Video',  meta: '48 min' },
                { id: '5',  title: 'Modern CSS Layouts',                   icon: '📄', category: 'webdev',     categoryLabel: 'Web Dev',     format: 'PDF',    meta: '1.8 MB' },
                { id: '6',  title: 'Building REST APIs with Node.js',      icon: '🎓', category: 'webdev',     categoryLabel: 'Web Dev',     format: 'Course', meta: '10 lessons' },
                { id: '7',  title: 'Normalization Cheatsheet',             icon: '📘', category: 'databases',  categoryLabel: 'Databases',   format: 'PDF',    meta: '820 KB' },
                { id: '8',  title: 'SQL Query Optimization',               icon: '🎥', category: 'databases',  categoryLabel: 'Databases',   format: 'Video',  meta: '32 min' },
                { id: '9',  title: 'NoSQL vs SQL Guide',                   icon: '📄', category: 'databases',  categoryLabel: 'Databases',   format: 'PDF',    meta: '1.2 MB' },
                { id: '10', title: 'OWASP Top 10 — 2025',                  icon: '🔐', category: 'security',   categoryLabel: 'Security',    format: 'Course', meta: '12 lessons' },
                { id: '11', title: 'Ethical Hacking Fundamentals',         icon: '🎥', category: 'security',   categoryLabel: 'Security',    format: 'Video',  meta: '1 hr 10 min' },
                { id: '12', title: 'Password Hashing Explained',           icon: '📄', category: 'security',   categoryLabel: 'Security',    format: 'PDF',    meta: '640 KB' },
                { id: '13', title: 'TCP/IP Full Guide',                    icon: '🔗', category: 'networking', categoryLabel: 'Networking',  format: 'PDF',    meta: '4.1 MB' },
                { id: '14', title: 'DNS Deep Dive',                        icon: '🎥', category: 'networking', categoryLabel: 'Networking',  format: 'Video',  meta: '27 min' },
                { id: '15', title: 'Subnetting Made Simple',               icon: '📄', category: 'networking', categoryLabel: 'Networking',  format: 'PDF',    meta: '950 KB' },
                { id: '16', title: 'Design Systems Handbook',              icon: '🎨', category: 'design',     categoryLabel: 'Design',      format: 'Course', meta: '8 lessons' },
                { id: '17', title: 'Typography Fundamentals',              icon: '📄', category: 'design',     categoryLabel: 'Design',      format: 'PDF',    meta: '2.1 MB' },
                { id: '18', title: 'Figma Prototyping Crash Course',       icon: '🎥', category: 'design',     categoryLabel: 'Design',      format: 'Video',  meta: '40 min' }
            ];

            var grid = document.getElementById('favoritesGrid');
            var emptyState = document.getElementById('emptyState');
            var clearAllBtn = document.getElementById('btnClearAll');

            function getFavorites() {
                try { return JSON.parse(localStorage.getItem(STORAGE_KEY)) || []; }
                catch (e) { return []; }
            }
            function saveFavorites(list) {
                localStorage.setItem(STORAGE_KEY, JSON.stringify(list));
            }

            function buildCard(item) {
                var card = document.createElement('div');
                card.className = 'resource-card';
                card.setAttribute('data-category', item.category);
                card.setAttribute('data-id', item.id);
                card.innerHTML =
                    '<div class="card-top">' +
                        '<div class="icon-badge">' + item.icon + '</div>' +
                        '<div class="card-top-right">' +
                            '<span class="format-chip">' + item.format + '</span>' +
                            '<button type="button" class="favorite-btn" aria-label="Remove from favorites"></button>' +
                        '</div>' +
                    '</div>' +
                    '<h3>' + item.title + '</h3>' +
                    '<div class="tag-row">' +
                        '<span class="category-tag">' + item.categoryLabel + '</span>' +
                        '<span class="meta-text">' + item.meta + '</span>' +
                    '</div>' +
                    '<button type="button" class="download-btn">Download</button>';

                card.querySelector('.favorite-btn').addEventListener('click', function () {
                    var current = getFavorites();
                    var idx = current.indexOf(item.id);
                    if (idx !== -1) current.splice(idx, 1);
                    saveFavorites(current);

                    card.classList.add('removing');
                    setTimeout(function () {
                        card.remove();
                        renderEmptyStateIfNeeded();
                    }, 200);
                });

                return card;
            }

            function renderEmptyStateIfNeeded() {
                var hasCards = grid.children.length > 0;
                emptyState.classList.toggle('visible', !hasCards);
                clearAllBtn.style.display = hasCards ? 'inline-block' : 'none';
            }

            function render() {
                var favIds = getFavorites();
                grid.innerHTML = '';

                var items = RESOURCE_DATA.filter(function (r) { return favIds.indexOf(r.id) !== -1; });
                items.forEach(function (item) { grid.appendChild(buildCard(item)); });

                renderEmptyStateIfNeeded();
            }

            clearAllBtn.addEventListener('click', function () {
                saveFavorites([]);
                render();
            });

            render();
        })();
    </script>
</body>
</html>