<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs"
    Inherits="STUDYVAULT.Dashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>StudyVault Dashboard</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,600;0,700;1,600&display=swap" rel="stylesheet" />
    <style>
        * { margin:0; padding:0; box-sizing:border-box; font-family:'Segoe UI', system-ui, -apple-system, sans-serif; }
        body {
            background:
                radial-gradient(1200px 600px at 50% -200px, rgba(139,92,246,.07), transparent 60%),
                #f6f8ff;
            color:#111827;
        }
        a { text-decoration:none; }
        button { font-family:inherit; }

        :root {
            --webdev-accent:#3b82f6;   --webdev-tint:#eff6ff;   --webdev-text:#1d4ed8;
            --databases-accent:#06b6d4; --databases-tint:#ecfeff; --databases-text:#0e7490;
            --networking-accent:#10b981; --networking-tint:#ecfdf5; --networking-text:#047857;
            --ai-accent:#8b5cf6;       --ai-tint:#f5f3ff;       --ai-text:#6d28d9;
            --design-accent:#f59e0b;   --design-tint:#fffbeb;   --design-text:#b45309;
            --mobile-accent:#ec4899;   --mobile-tint:#fdf2f8;   --mobile-text:#be185d;
            --hairline: rgba(17,24,39,.08);
        }

        a:focus-visible, button:focus-visible, input:focus-visible {
            outline: 3px solid #4f46e5;
            outline-offset: 2px;
        }

        /* ================= HEADER (transparent over hero, solid on scroll) ================= */
        .header {
            position: fixed;
            top: 0; left: 0; right: 0;
            z-index: 1000;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 22px 60px;
            background: transparent;
            border-bottom: 1px solid transparent;
            transition: background .3s ease, border-color .3s ease, box-shadow .3s ease, padding .3s ease;
        }
        .header.scrolled {
            background: rgba(255,255,255,.9);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-bottom: 1px solid var(--hairline);
            box-shadow: 0 4px 20px rgba(17,24,39,.06);
            padding: 14px 60px;
        }

        .logo {
            display:flex; align-items:center; gap:10px;
            font-size:21px; font-weight:800; letter-spacing:-0.3px;
            color: white;
            text-shadow: 0 2px 10px rgba(0,0,0,.35);
            transition: color .3s, text-shadow .3s;
        }
        .header.scrolled .logo { color:#4f46e5; text-shadow:none; }

        .header nav { display:flex; gap:30px; }
        .header nav a {
            color: rgba(255,255,255,.88);
            font-weight:600;
            font-size:15px;
            padding-bottom:4px;
            border-bottom:2px solid transparent;
            text-shadow: 0 1px 8px rgba(0,0,0,.3);
            transition: color .3s, text-shadow .3s;
        }
        .header nav a:hover { color: white; }
        .header nav a.active { color: white; border-bottom-color: white; }
        .header.scrolled nav a { color:#6b7280; text-shadow:none; }
        .header.scrolled nav a:hover { color:#111827; }
        .header.scrolled nav a.active { color:#4f46e5; border-bottom-color:#4f46e5; }

        .header-right { display:flex; align-items:center; gap:20px; }
        .notification {
            position:relative; font-size:20px;
            color: white; text-shadow: 0 1px 8px rgba(0,0,0,.3);
            transition: color .3s, text-shadow .3s;
        }
        .header.scrolled .notification { color:#111827; text-shadow:none; }
        .notification span {
            position:absolute; top:-6px; right:-9px;
            background:#ef4444; color:white;
            width:17px; height:17px; border-radius:50%;
            display:flex; justify-content:center; align-items:center;
            font-size:10px; font-weight:700;
        }
        .avatar-circle {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background: #4f46e5;
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: 700;
    font-size: 16px;
}

        .user { display:flex; align-items:center; gap:14px; }
        .username {
            font-weight:600; font-size:14px;
            color: white; text-shadow: 0 1px 8px rgba(0,0,0,.3);
            transition: color .3s, text-shadow .3s;
        }
        .header.scrolled .username { color:#111827; text-shadow:none; }
 

        .logout-btn {
            background: rgba(255,255,255,.15);
            color: white;
            border: 1px solid rgba(255,255,255,.35);
            padding:8px 17px;
            border-radius:20px;
            cursor:pointer;
            font-weight:600;
            font-size:14px;
            backdrop-filter: blur(6px);
            -webkit-backdrop-filter: blur(6px);
            transition: background .3s, color .3s, border-color .3s;
        }
        .logout-btn:hover { background: rgba(255,255,255,.28); }
        .header.scrolled .logout-btn {
            background: transparent;
            color:#374151;
            border:1px solid var(--hairline);
        }
        .header.scrolled .logout-btn:hover { background:#fef2f2; color:#dc2626; border-color:#fecaca; }

        /* ================= HERO (full-bleed photographic) ================= */
        .hero {
            position: relative;
            min-height: 560px;
            overflow: visible;
            background:
                linear-gradient(180deg, rgba(15,23,42,.35) 0%, rgba(24,20,60,.55) 55%, rgba(15,15,35,.85) 100%),
                url('https://images.unsplash.com/photo-1747515203898-2df8f083f417?fm=jpg&q=70&w=2000&auto=format&fit=crop') center / cover no-repeat;
            padding: 130px 60px 130px;
        }
        /* clean diagonal cut instead of a blurred fade */
.hero::after {
    content: '';
    position: absolute;
    left: 0; right: 0; bottom: -1px;
    height: 110px;
    background: #f6f8ff;
    clip-path: polygon(0% 25%, 100% 75%, 100% 100%, 0% 100%);
    z-index: 3;
    pointer-events: none;
}

        .hero-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            width: fit-content;
            padding: 8px 18px;
            border-radius: 30px;
            background: rgba(255,255,255,.14);
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
            border: 1px solid rgba(255,255,255,.25);
            color: #f1f5f9;
            font-size: 13px;
            font-weight: 600;
            letter-spacing: .3px;
            margin-bottom: 26px;
        }

        .hero-inner { max-width: 1400px; width: 100%; margin: 0 auto; position: relative; z-index: 2; }
        .hero-left { max-width: 640px; }

        .hero h1 {
            font-family: 'Playfair Display', Georgia, serif;
            font-size: 54px;
            line-height: 1.1;
            font-weight: 700;
            color: #ffffff;
            letter-spacing: -0.5px;
            margin-bottom: 20px;
            text-shadow: 0 4px 24px rgba(0,0,0,.4);
        }
        .hero h1 .username-hero { font-style: italic; font-weight: 600; color: #c7d2fe; }
        .hero-left > p {
            font-size: 16.5px;
            color: rgba(255,255,255,.85);
            line-height: 1.7;
            margin-bottom: 34px;
            max-width: 460px;
            text-shadow: 0 2px 12px rgba(0,0,0,.3);
        }

        .hero-buttons { display:flex; align-items:center; gap:16px; }
        .primary-btn {
            padding:14px 30px; border-radius:30px; border:none;
            font-weight:700; font-size:14.5px; cursor:pointer; transition:.2s;
            background:#ffffff; color:#4f46e5;
            box-shadow:0 14px 30px rgba(0,0,0,.25);
        }
        .primary-btn:hover { background:#eef2ff; transform:translateY(-3px); }

        .secondary-btn {
            padding:13px 26px; border-radius:30px; font-weight:700; font-size:14.5px; cursor:pointer;
            color: white;
            background: rgba(255,255,255,.12);
            backdrop-filter: blur(8px); -webkit-backdrop-filter: blur(8px);
            border: 1px solid rgba(255,255,255,.35);
            display:inline-flex; align-items:center; gap:8px; transition:.2s;
        }
        .secondary-btn:hover { background: rgba(255,255,255,.22); transform:translateY(-3px); }
        .secondary-btn::after { content:'↗'; }

        /* Floating glass panel — anchored bottom-left, overlaps the seam below the hero */
        .hero-facts {
            position: absolute;
            left: 60px;
            bottom: -42px;
            z-index: 6;
            display: flex;
            align-items: stretch;
            width: fit-content;
            max-width: calc(100% - 120px);
            background: rgba(30,27,60,.55);
            backdrop-filter: blur(16px);
            -webkit-backdrop-filter: blur(16px);
            border: 1px solid rgba(255,255,255,.22);
            border-radius: 18px;
            box-shadow: 0 24px 48px rgba(15,15,35,.35);
            overflow: hidden;
        }
        .hero-facts .rail {
            writing-mode: vertical-rl;
            transform: rotate(180deg);
            padding: 16px 10px;
            font-size: 11px; font-weight: 800; letter-spacing: 2px;
            color: rgba(255,255,255,.75);
            background: rgba(255,255,255,.08);
            border-right: 1px solid rgba(255,255,255,.15);
            white-space: nowrap;
        }
        .hero-facts .fact-list { padding: 16px 22px; display: flex; flex-direction: column; justify-content: center; gap: 7px; }
        .hero-facts .fact-list p { font-size: 13px; color: rgba(255,255,255,.85); white-space: nowrap; }
        .hero-rating {
            padding: 16px 20px;
            border-left: 1px solid rgba(255,255,255,.15);
            display: flex; flex-direction: column; justify-content: center; gap: 3px;
        }
        .hero-rating strong { color: white; font-size: 15px; }
        .hero-rating span { font-size: 12px; color: rgba(255,255,255,.7); }

        /* ================= SEARCH ================= */
        .search-area { position: relative; z-index: 2; max-width: 1400px; margin: 90px auto 44px; padding: 0 60px; }
        .search-box {
            display:flex;
            align-items:center;
            background:white;
            padding:6px;
            border-radius:30px;
            border: 1px solid var(--hairline);
        }
        .search-box input { flex:1; border:none; outline:none; padding:14px 22px; font-size:15.5px; background:transparent; }
        .search-box button { background:#4f46e5; color:white; border:none; padding:13px 26px; border-radius:24px; cursor:pointer; font-weight:600; transition:.2s; }
        .search-box button:hover { background:#4338ca; }

        .filters { display:flex; flex-wrap:wrap; gap:10px; margin-top:20px; }
        .filters button {
            padding:9px 20px;
            border:1px solid var(--hairline);
            background:white;
            border-radius:22px;
            cursor:pointer;
            font-weight:600;
            font-size:14px;
            color:#374151;
            transition:.2s;
        }
        .filters button:hover { background:#eef2ff; border-color:#c7d2fe; }
        .filters .active { background:#4f46e5; color:white; border-color:#4f46e5; }

        /* ================= LAYOUT CONTAINER ================= */
        .container { max-width: 1400px; margin:0 auto; padding: 0 60px; }

        /* ================= STATS ================= */
        .stats {
            display:flex;
            background:white;
            border-radius:24px;
            border:1px solid var(--hairline);
            overflow:hidden;
        }
        .stat-card {
            flex:1;
            padding:32px 20px;
            text-align:center;
            border-right:1px solid var(--hairline);
            transition:.2s;
        }
        .stat-card:last-child { border-right:none; }
        .stat-card:hover { background:#f8f9ff; }
        .stat-icon { font-size:21px; margin-bottom:10px; opacity:.75; }
        .stat-card h2 { font-family:'Playfair Display', Georgia, serif; font-size:36px; font-weight:700; color:#111827; }
        .stat-card p { color:#6b7280; font-size:13px; margin-top:6px; letter-spacing:.2px; }

        /* ================= SECTION HEADERS ================= */
        .section { margin-top:64px; }
        .section-title { display:flex; justify-content:space-between; align-items:flex-end; margin-bottom:24px; }
        .section-title h2 { font-family:'Playfair Display', Georgia, serif; font-size:27px; font-weight:700; letter-spacing:-0.3px; }
        .section-title p { color:#6b7280; font-size:14px; margin-top:5px; }
        .section-title a { color:#4f46e5; font-weight:700; font-size:14px; }
        .section-title a:hover { text-decoration:underline; }

        /* ================= RESOURCE CARDS ================= */
        .resource-grid { display:grid; grid-template-columns:repeat(4,1fr); gap:20px; }
        .resource-card {
            background:white;
            padding:24px;
            border-radius:20px;
            border: 1px solid var(--hairline);
            border-top:3px solid transparent;
            transition:.25s;
        }
        .resource-card:hover { transform:translateY(-5px); box-shadow:0 18px 34px rgba(17,24,39,.09); }
        .resource-icon {
            width:48px; height:48px;
            display:flex; align-items:center; justify-content:center;
            font-size:22px;
            border-radius:13px;
            margin-bottom:16px;
        }
        .resource-card h3 { font-size:16px; font-weight:700; margin-bottom:8px; }
        .resource-card p { color:#6b7280; font-size:13.5px; line-height:1.5; margin-bottom:18px; }
        .resource-card button {
            padding:9px 22px;
            border:none;
            background:#4f46e5;
            color:white;
            border-radius:18px;
            cursor:pointer;
            font-weight:600;
            font-size:13.5px;
            transition:.2s;
        }
        .resource-card button:hover { background:#4338ca; }

        .resource-card.webdev     { border-top-color:var(--webdev-accent); }
        .resource-card.webdev .resource-icon     { background:var(--webdev-tint); }
        .resource-card.databases  { border-top-color:var(--databases-accent); }
        .resource-card.databases .resource-icon  { background:var(--databases-tint); }
        .resource-card.networking { border-top-color:var(--networking-accent); }
        .resource-card.networking .resource-icon { background:var(--networking-tint); }
        .resource-card.ai         { border-top-color:var(--ai-accent); }
        .resource-card.ai .resource-icon         { background:var(--ai-tint); }

        /* ================= TWO COLUMN ================= */
        .two-column { display:grid; grid-template-columns:1fr 1fr; gap:24px; margin-top:64px; }
        .panel { background:white; padding:28px; border-radius:20px; border:1px solid var(--hairline); }
        .panel h2 { font-family:'Playfair Display', Georgia, serif; font-size:22px; font-weight:700; margin-bottom:6px; }
        .panel > p { color:#6b7280; margin-bottom:26px; font-size:14px; }

        /* Progress */
        .progress-item { margin-bottom:22px; }
        .progress-item:last-child { margin-bottom:0; }
        .progress-item span { display:block; font-weight:600; margin-bottom:9px; font-size:14.5px; }
        .progress { height:8px; background:#eef0f4; border-radius:20px; overflow:hidden; }
        .bar { height:100%; border-radius:20px; transition:width .4s ease; }
        .blue { background:#3b82f6; } .green { background:#22c55e; }
        .purple { background:#8b5cf6; } .orange { background:#f97316; }
        .progress-item b { display:block; margin-top:7px; color:#4f46e5; font-size:13.5px; }

        /* Deadlines */
        .deadline-card {
            display:flex; align-items:center; gap:14px;
            padding:15px; margin-bottom:10px;
            background:#f9fafb; border-radius:15px;
            transition:.2s;
        }
        .deadline-card:last-child { margin-bottom:0; }
        .deadline-card:hover { background:#f3f4f6; }
        .deadline-icon {
            width:42px; height:42px; flex-shrink:0;
            display:flex; align-items:center; justify-content:center;
            border-radius:50%; font-size:19px;
        }
        .deadline-icon.pink { background:#fce7f3; }
        .deadline-icon.yellow { background:#fef3c7; }
        .deadline-icon.blue { background:#dbeafe; }
        .deadline-card h3 { font-size:14.5px; font-weight:700; }
        .deadline-card span { color:#6b7280; font-size:12.5px; }
        .deadline-card label {
            margin-left:auto; flex-shrink:0;
            background:#4f46e5; color:white;
            padding:6px 12px; border-radius:20px; font-size:11.5px; font-weight:600;
        }

        /* ================= CATEGORIES ================= */
        .category-grid { display:grid; grid-template-columns:repeat(6,1fr); gap:16px; }
        .category-card {
            background:white;
            padding:22px 12px;
            text-align:center;
            border-radius:18px;
            border:1px solid var(--hairline);
            transition:.25s;
        }
        .category-card:hover { transform:translateY(-5px); box-shadow:0 16px 30px rgba(17,24,39,.09); }
        .category-card .cat-icon {
            width:48px; height:48px;
            display:flex; align-items:center; justify-content:center;
            font-size:24px;
            border-radius:14px;
            margin:0 auto 13px;
        }
        .category-card h3 { font-size:14px; font-weight:700; margin-bottom:4px; }
        .category-card p { color:#9ca3af; font-size:12.5px; }

        .category-card.webdev .cat-icon     { background:var(--webdev-tint); }
        .category-card.databases .cat-icon  { background:var(--databases-tint); }
        .category-card.networking .cat-icon { background:var(--networking-tint); }
        .category-card.ai .cat-icon         { background:var(--ai-tint); }
        .category-card.design .cat-icon     { background:var(--design-tint); }
        .category-card.mobile .cat-icon     { background:var(--mobile-tint); }

        /* ================= ACTIVITY ================= */
        .activity-grid { display:grid; grid-template-columns:1fr 1fr; gap:24px; margin-top:64px; }
        .activity-card {
            display:flex; align-items:center; gap:14px;
            background:#f9fafb; padding:15px;
            border-radius:15px; margin-bottom:10px;
            transition:.2s;
        }
        .activity-card:last-child { margin-bottom:0; }
        .activity-card:hover { background:#f3f4f6; }
        .activity-card span {
            font-size:19px;
            width:36px; height:36px;
            display:flex; align-items:center; justify-content:center;
            background:white; border-radius:11px;
            border: 1px solid var(--hairline);
            flex-shrink:0;
        }
        .activity-card h3 { font-size:14px; font-weight:700; }
        .activity-card small { color:#9ca3af; font-size:12px; }
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

        /* ================= RESPONSIVE ================= */
        @media(max-width:1200px){
            .resource-grid { grid-template-columns:repeat(2,1fr); }
            .category-grid { grid-template-columns:repeat(3,1fr); }
            .stats { flex-wrap:wrap; }
            .stat-card { flex:1 1 50%; border-bottom:1px solid var(--hairline); }
        }
        @media(max-width:900px){
            .hero h1 { font-size:38px; }
            .hero-facts {
                position: static;
                margin: 40px auto 0;
                max-width: calc(100% - 40px);
                flex-direction: column;
                box-shadow: 0 16px 34px rgba(15,15,35,.3);
            }
            .hero-facts .rail { writing-mode: horizontal-tb; transform: none; border-right: none; border-bottom: 1px solid rgba(255,255,255,.15); }
            .hero-rating { border-left: none; border-top: 1px solid rgba(255,255,255,.15); }
            .search-area { margin-top: 44px; }
        }
        @media(max-width:800px){
            .header { padding:16px 20px; }
            .header.scrolled { padding: 12px 20px; }
            .header nav { display:none; }
            .hero { padding: 100px 20px 110px; }
            .search-area, .container, .footer-content, .footer hr, .footer > p { padding-left:20px; padding-right:20px; margin-left:0; margin-right:0; }
            .two-column, .activity-grid { grid-template-columns:1fr; }
            .category-grid { grid-template-columns:repeat(2,1fr); }
            .footer-content { flex-direction:column; gap:25px; text-align:center; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
<header class="header" id="siteHeader">
    <div class="logo">STUDYVAULT.</div>
    <nav>
        <a class="active" href="Dashboard.aspx">Home</a>
        <a href="About.aspx">About</a>
        <a href="Resources.aspx">Resources</a>
        <a href="Categories.aspx">Categories</a>
        <a href="Favorites.aspx">Favorites</a>
        <a href="ASSIGNMENTCLINIC.aspx">Assignments</a>
        <a href="Feedback.aspx">Feedback</a>
    </nav>
    <div class="header-right">
        <div class="notification">
            🔔
            <span>3</span>
        </div>
        <div class="user">
            <div id="avatarCircle" runat="server" class="avatar-circle"></div>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="logout-btn" OnClick="btnLogout_Click" />
        </div>
    </div>
</header>
        <!-- ================= HERO ================= -->
        <section class="hero">
            <div class="hero-inner">
                <div class="hero-left">
                    <span class="hero-badge">🎓 Your Personal Study Hub</span>

                    <h1>
                        Welcome back,
                        <span class="username-hero"><asp:Label ID="lblNameHero" runat="server"></asp:Label></span>
                    </h1>

                    <p>
                        Access your study materials, assignments, research papers and notes from one beautiful dashboard.
                    </p>

                    <div class="hero-buttons">
                        <asp:Button ID="btnGetStarted" runat="server" CssClass="primary-btn" Text="Get Started" OnClick="btnGetStarted_Click" />
                        <asp:Button ID="btnBrowseResources" runat="server" CssClass="secondary-btn" Text="Browse Resources" OnClick="btnBrowseResources_Click" />
                    </div>
                </div>
            </div>

            <div class="hero-facts">
                <div class="rail">STUDY TIPS</div>
                <div class="fact-list">
                    <p>Review notes within 24 hours to lock in memory</p>
                    <p>Break sessions into 25-minute focused blocks</p>
                    <p>Teach a concept out loud to test real understanding</p>
                    <p>Mix subjects instead of cramming one at a time</p>
                </div>
                <div class="hero-rating">
                    <strong>⭐ 4.9 rating</strong>
                    <span>Trusted by 250+ students</span>
                </div>
            </div>
        </section>

        <!-- ================= SEARCH ================= -->
        <section class="search-area">
            <div class="search-box">
                <input type="text" placeholder="Search Notes, PDFs, Assignments..." />
                <button type="button">🔍 Search</button>
            </div>

            <div class="filters">
                <button type="button" class="active">All</button>
                <button type="button">Notes</button>
                <button type="button">Assignments</button>
                <button type="button">Research</button>
                <button type="button">Videos</button>
                <button type="button">Slides</button>
            </div>
        </section>

        <!-- ================= MAIN CONTENT ================= -->
        <div class="container">

            <!-- STATISTICS -->
            <section class="stats">
                <div class="stat-card">
                    <div class="stat-icon">📚</div>
                    <h2>120</h2>
                    <p>Total Resources</p>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">⭐</div>
                    <h2>15</h2>
                    <p>Favorites</p>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">⬇️</div>
                    <h2>42</h2>
                    <p>Downloads</p>
                </div>
                <div class="stat-card">
                    <div class="stat-icon">🎓</div>
                    <h2>8</h2>
                    <p>Courses</p>
                </div>
            </section>

            <!-- RECENT RESOURCES -->
            <section class="section">
                <div class="section-title">
                    <div>
                        <h2>Recent Resources</h2>
                        <p>Pick up where you left off</p>
                    </div>
                    <a href="Resources.aspx">View All →</a>
                </div>

                <div class="resource-grid">
                    <div class="resource-card webdev">
                        <div class="resource-icon">💻</div>
                        <h3>Web Development</h3>
                        <p>HTML, CSS, JavaScript &amp; ASP.NET notes</p>
                        <button type="button">Open</button>
                    </div>

                    <div class="resource-card databases">
                        <div class="resource-icon">🗄</div>
                        <h3>Database Systems</h3>
                        <p>SQL, ER diagrams and database concepts</p>
                        <button type="button">Open</button>
                    </div>

                    <div class="resource-card networking">
                        <div class="resource-icon">🔗</div>
                        <h3>Networking</h3>
                        <p>Computer networks and protocols</p>
                        <button type="button">Open</button>
                    </div>

                    <div class="resource-card ai">
                        <div class="resource-icon">🤖</div>
                        <h3>Artificial Intelligence</h3>
                        <p>AI, Machine Learning and research papers</p>
                        <button type="button">Open</button>
                    </div>
                </div>
            </section>

            <!-- LEARNING PROGRESS + DEADLINES -->
            <section class="two-column">
                <div class="panel">
                    <h2>Learning Progress</h2>
                    <p>Your completion across subjects</p>

                    <div class="progress-item">
                        <span>Web Development</span>
                        <div class="progress"><div class="bar blue" style="width:85%"></div></div>
                        <b>85%</b>
                    </div>

                    <div class="progress-item">
                        <span>Database Systems</span>
                        <div class="progress"><div class="bar green" style="width:70%"></div></div>
                        <b>70%</b>
                    </div>

                    <div class="progress-item">
                        <span>Networking</span>
                        <div class="progress"><div class="bar purple" style="width:55%"></div></div>
                        <b>55%</b>
                    </div>

                    <div class="progress-item">
                        <span>Artificial Intelligence</span>
                        <div class="progress"><div class="bar orange" style="width:40%"></div></div>
                        <b>40%</b>
                    </div>
                </div>

                <div class="panel deadlines">
                    <h2>Upcoming Deadlines</h2>
                    <p>Stay on top of your schedule</p>

                    <div class="deadline-card">
                        <div class="deadline-icon pink">📄</div>
                        <div>
                            <h3>HCI Assignment</h3>
                            <span>Human Computer Interaction</span>
                        </div>
                        <label>Tomorrow</label>
                    </div>

                    <div class="deadline-card">
                        <div class="deadline-icon yellow">🗄</div>
                        <div>
                            <h3>Database Project</h3>
                            <span>Database Systems</span>
                        </div>
                        <label>3 Days Left</label>
                    </div>

                    <div class="deadline-card">
                        <div class="deadline-icon blue">🔗</div>
                        <div>
                            <h3>Networking Lab</h3>
                            <span>Computer Networks</span>
                        </div>
                        <label>Next Week</label>
                    </div>
                </div>
            </section>

            <!-- POPULAR CATEGORIES -->
            <section class="section">
                <div class="section-title">
                    <div>
                        <h2>Popular Categories</h2>
                        <p>Explore what other students are studying</p>
                    </div>
                </div>

                <div class="category-grid">
                    <div class="category-card webdev">
                        <div class="cat-icon">💻</div>
                        <h3>Web Development</h3>
                        <p>34 Resources</p>
                    </div>
                    <div class="category-card databases">
                        <div class="cat-icon">🗄</div>
                        <h3>Database</h3>
                        <p>18 Resources</p>
                    </div>
                    <div class="category-card networking">
                        <div class="cat-icon">🔗</div>
                        <h3>Networking</h3>
                        <p>27 Resources</p>
                    </div>
                    <div class="category-card ai">
                        <div class="cat-icon">🤖</div>
                        <h3>Artificial Intelligence</h3>
                        <p>21 Resources</p>
                    </div>
                    <div class="category-card design">
                        <div class="cat-icon">🎨</div>
                        <h3>UI/UX Design</h3>
                        <p>15 Resources</p>
                    </div>
                    <div class="category-card mobile">
                        <div class="cat-icon">📱</div>
                        <h3>Mobile Development</h3>
                        <p>12 Resources</p>
                    </div>
                </div>
            </section>

            <!-- ANNOUNCEMENTS & ACTIVITY -->
            <section class="activity-grid">
                <div class="panel">
                    <h2>Announcements</h2>
                    <p>Latest from your instructors</p>

                    <div class="activity-card">
                        <span>📢</span>
                        <div>
                            <h3>New ASP.NET Notes Uploaded</h3>
                            <small>2 hours ago</small>
                        </div>
                    </div>

                    <div class="activity-card">
                        <span>📢</span>
                        <div>
                            <h3>Exam Schedule Published</h3>
                            <small>Yesterday</small>
                        </div>
                    </div>

                    <div class="activity-card">
                        <span>📢</span>
                        <div>
                            <h3>Networking Lab Updated</h3>
                            <small>3 days ago</small>
                        </div>
                    </div>
                </div>

                <div class="panel">
                    <h2>Recent Activity</h2>
                    <p>Your latest interactions</p>

                    <div class="activity-card">
                        <span>⬇️</span>
                        <div>
                            <h3>Downloaded Database Notes</h3>
                            <small>10 minutes ago</small>
                        </div>
                    </div>

                    <div class="activity-card">
                        <span>⬆️</span>
                        <div>
                            <h3>Uploaded Networking Assignment</h3>
                            <small>1 hour ago</small>
                        </div>
                    </div>

                    <div class="activity-card">
                        <span>⭐</span>
                        <div>
                            <h3>Added ASP.NET to Favorites</h3>
                            <small>3 hours ago</small>
                        </div>
                    </div>

                    <div class="activity-card">
                        <span>📄</span>
                        <div>
                            <h3>Completed HCI Reading</h3>
                            <small>Yesterday</small>
                        </div>
                    </div>
                </div>
            </section>

        </div>
        <!-- End Container -->
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css">

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css">

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
            var header = document.getElementById('siteHeader');
            function onScroll() {
                if (window.scrollY > 40) header.classList.add('scrolled');
                else header.classList.remove('scrolled');
            }
            window.addEventListener('scroll', onScroll, { passive: true });
            onScroll();
        })();
    </script>
</body>
</html>