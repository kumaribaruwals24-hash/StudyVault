<%@ Page Title="About Us - StudyVault" Language="C#" AutoEventWireup="true"
    CodeBehind="About.aspx.cs" Inherits="STUDYVAULT.About" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>About Us - StudyVault</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,600;0,700;1,600&display=swap" rel="stylesheet" />
    <style>
        * { box-sizing: border-box; margin:0; padding:0; }
        body {
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            background:
                radial-gradient(1100px 500px at 50% -150px, rgba(139,92,246,.06), transparent 60%),
                #f6f8ff;
            color: #111827;
        }
        a { text-decoration: none; }
        button { font-family: inherit; }

        :root {
            --hairline: rgba(17,24,39,.08);
            --c1-accent:#4f46e5; --c1-tint:#eef2ff; --c1-text:#4338ca;
            --c2-accent:#3b82f6; --c2-tint:#eff6ff; --c2-text:#1d4ed8;
            --c3-accent:#06b6d4; --c3-tint:#ecfeff; --c3-text:#0e7490;
            --c4-accent:#10b981; --c4-tint:#ecfdf5; --c4-text:#047857;
            --c5-accent:#8b5cf6; --c5-tint:#f5f3ff; --c5-text:#6d28d9;
            --c6-accent:#f59e0b; --c6-tint:#fffbeb; --c6-text:#b45309;
        }

        a:focus-visible, button:focus-visible { outline: 3px solid #4f46e5; outline-offset: 2px; }
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
        /* ================= PAGE INTRO ================= */
        .main { max-width: 1200px; margin: 0 auto; padding: 60px 60px 0; }
        .eyebrow {
            text-transform: uppercase; letter-spacing: 1.5px; font-size: 12px;
            font-weight: 700; color: #4f46e5; margin-bottom: 8px; text-align:center;
        }
        .intro { text-align: center; max-width: 700px; margin: 0 auto 20px; }
        .intro h1 {
            font-family: 'Playfair Display', Georgia, serif;
            font-size: 40px; font-weight: 700; letter-spacing: -0.5px; margin-bottom: 14px;
        }
        .intro > p { color:#6b7280; font-size:16px; line-height:1.7; }
        .hero-rule {
            height: 4px; width: 64px; border-radius: 4px;
            background: linear-gradient(90deg, #4f46e5, #8b5cf6, #3b82f6);
            margin: 26px auto 0;
        }

        /* ================= SECTIONS ================= */
        .section { max-width: 1200px; margin: 80px auto 0; padding: 0 60px; }
        .section-head { max-width: 640px; margin-bottom: 34px; }
        .section-head.centered { max-width: 700px; margin-left:auto; margin-right:auto; text-align:center; }
        .section-head h2 {
            font-family: 'Playfair Display', Georgia, serif;
            font-size: 28px; font-weight: 700; letter-spacing:-0.3px; margin-bottom: 10px;
        }
        .section-head p { color:#6b7280; font-size: 15px; line-height:1.65; }

        .panel { background: white; border: 1px solid var(--hairline); border-radius: 22px; padding: 34px; }
        .panel p { color:#4b5563; font-size:15px; line-height:1.75; margin-bottom: 14px; }
        .panel p:last-child { margin-bottom: 0; }

        /* Feature / value grids */
        .feature-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 20px;
        }
        .feature-card {
            background: white;
            border: 1px solid var(--hairline);
            border-top: 3px solid transparent;
            border-radius: 18px;
            padding: 26px;
            transition: .25s;
        }
        .feature-card:hover { transform: translateY(-5px); box-shadow: 0 16px 30px rgba(17,24,39,.08); }
        .feature-icon {
            width: 46px; height: 46px; border-radius: 13px;
            display:flex; align-items:center; justify-content:center;
            font-size: 21px; margin-bottom: 14px;
        }
        .feature-card h3 { font-size: 15.5px; font-weight: 700; margin-bottom: 8px; }
        .feature-card p { color:#6b7280; font-size: 13.5px; line-height: 1.55; }

        .feature-card.c1 { border-top-color: var(--c1-accent); } .feature-card.c1 .feature-icon { background: var(--c1-tint); }
        .feature-card.c2 { border-top-color: var(--c2-accent); } .feature-card.c2 .feature-icon { background: var(--c2-tint); }
        .feature-card.c3 { border-top-color: var(--c3-accent); } .feature-card.c3 .feature-icon { background: var(--c3-tint); }
        .feature-card.c4 { border-top-color: var(--c4-accent); } .feature-card.c4 .feature-icon { background: var(--c4-tint); }
        .feature-card.c5 { border-top-color: var(--c5-accent); } .feature-card.c5 .feature-icon { background: var(--c5-tint); }
        .feature-card.c6 { border-top-color: var(--c6-accent); } .feature-card.c6 .feature-icon { background: var(--c6-tint); }

        /* Mission / Vision two-column */
        .two-col { display: grid; grid-template-columns: 1fr 1fr; gap: 22px; }
        .quote-panel {
            background: linear-gradient(160deg, #eef2ff, #ffffff);
            border: 1px solid var(--hairline);
            border-radius: 22px;
            padding: 32px;
        }
        .quote-panel .label { font-size: 12px; font-weight:700; text-transform:uppercase; letter-spacing:1.2px; color:#4f46e5; margin-bottom: 12px; }
        .quote-panel h3 { font-family:'Playfair Display', Georgia, serif; font-size: 22px; font-weight:700; margin-bottom: 14px; line-height:1.3; }
        .quote-panel p { color:#4b5563; font-size: 14.5px; line-height:1.7; }

        /* How it works stepper */
        .steps-row {
            display: grid;
            grid-template-columns: repeat(5, 1fr);
            gap: 16px;
        }
        .step-card { text-align: center; position: relative; }
        .step-card .num {
            width: 44px; height: 44px; border-radius: 50%;
            background: #4f46e5; color: white;
            display:flex; align-items:center; justify-content:center;
            font-weight: 700; font-size: 16px;
            margin: 0 auto 14px;
            box-shadow: 0 8px 18px rgba(79,70,229,.28);
        }
        .step-card h4 { font-size: 14.5px; font-weight: 700; margin-bottom: 6px; }
        .step-card p { color: #6b7280; font-size: 12.5px; line-height:1.5; }
        .step-connector {
            position: absolute;
            top: 22px; left: calc(50% + 30px); right: calc(-50% + 30px);
            height: 2px;
            background: var(--hairline);
        }
        .step-card:last-child .step-connector { display: none; }

        /* CTA */
        .cta-panel {
            background: #111827;
            border-radius: 26px;
            padding: 56px 40px;
            text-align: center;
            margin: 90px auto 0;
            position: relative;
            overflow: hidden;
        }
        .cta-panel::before {
            content: '';
            position: absolute; top:0; left:0; right:0; height:3px;
            background: linear-gradient(90deg, #4f46e5, #8b5cf6, #3b82f6);
        }
        .cta-panel h2 { font-family:'Playfair Display', Georgia, serif; color:white; font-size: 30px; font-weight:700; margin-bottom: 10px; }
        .cta-panel p { color: #cbd5e1; font-size: 15px; margin-bottom: 30px; max-width: 480px; margin-left:auto; margin-right:auto; }
        .cta-buttons { display:flex; justify-content:center; gap:16px; flex-wrap: wrap; }
        .cta-primary {
            background: white; color:#4f46e5; border:none; padding:13px 28px;
            border-radius:26px; font-weight:700; font-size:14.5px; cursor:pointer; transition:.2s;
        }
        .cta-primary:hover { background:#eef2ff; transform:translateY(-3px); }
        .cta-secondary {
            background: rgba(255,255,255,.1); color:white; border:1px solid rgba(255,255,255,.3);
            padding:13px 28px; border-radius:26px; font-weight:700; font-size:14.5px; cursor:pointer; transition:.2s;
        }
        .cta-secondary:hover { background: rgba(255,255,255,.2); transform:translateY(-3px); }

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

        @media (max-width: 1000px) {
            .two-col { grid-template-columns: 1fr; }
            .steps-row { grid-template-columns: repeat(3, 1fr); row-gap: 30px; }
            .step-connector { display: none; }
        }
        @media (max-width: 700px) {
            .header { flex-direction:column; gap:15px; padding:18px 20px; }
            .header nav { flex-wrap: wrap; justify-content:center; }
            .main, .section { padding-left: 20px; padding-right: 20px; }
            .steps-row { grid-template-columns: repeat(2, 1fr); }
            .footer-content, .footer hr, .footer > p { padding-left:20px; padding-right:20px; margin-left:0; margin-right:0; }
            .footer-content { flex-direction:column; gap:25px; text-align:center; }
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
        <!-- ================= INTRO ================= -->
        <div class="main">
            <div class="intro">
                <div class="eyebrow">About StudyVault</div>
                <h1>Your Smart Learning Companion</h1>
                <p>
                    StudyVault is a student-focused digital learning platform designed to make academic resources
                    easier to find, access, and manage. We bring study notes, research papers, assignment resources,
                    and educational materials together in one convenient platform.
                </p>
            </div>
            <div class="hero-rule"></div>
        </div>

        <!-- ================= WHO WE ARE ================= -->
        <section class="section">
            <div class="section-head">
                <h2>Who We Are</h2>
                <p>Making learning resources easier to access.</p>
            </div>
            <div class="panel">
                <p>
                    StudyVault was created with a simple goal: to make learning resources accessible, organized,
                    and convenient for students.
                </p>
                <p>
                    Students often spend a significant amount of time searching through different websites, files,
                    and platforms for useful academic materials. StudyVault provides a centralized platform where
                    students can discover and manage relevant resources more efficiently.
                </p>
                <p>
                    Our platform is designed around the needs of students, providing a simple and user-friendly
                    environment for academic learning and resource sharing.
                </p>
            </div>
        </section>

        <!-- ================= WHAT WE PROVIDE ================= -->
        <section class="section">
            <div class="section-head">
                <h2>What We Provide</h2>
                <p>Everything you need to study, organized in one place.</p>
            </div>
            <div class="feature-grid">
                <div class="feature-card c1">
                    <div class="feature-icon">📚</div>
                    <h3>Study Notes</h3>
                    <p>Access organized study notes covering different subjects, topics, and academic areas to support your learning and revision.</p>
                </div>
                <div class="feature-card c2">
                    <div class="feature-icon">📄</div>
                    <h3>Research Papers</h3>
                    <p>Explore academic research papers and supporting materials that can help students with research, assignments, and academic projects.</p>
                </div>
                <div class="feature-card c3">
                    <div class="feature-icon">📝</div>
                    <h3>Assignment Resources</h3>
                    <p>Find useful assignment materials, templates, examples, and academic guidance to help you better understand and structure your work.</p>
                </div>
                <div class="feature-card c4">
                    <div class="feature-icon">🎥</div>
                    <h3>Learning Resources</h3>
                    <p>Discover educational materials and video tutorials that provide additional explanations and learning support.</p>
                </div>
                <div class="feature-card c5">
                    <div class="feature-icon">⭐</div>
                    <h3>Favorites</h3>
                    <p>Registered users can save useful resources to their Favorites so they can easily access them later.</p>
                </div>
            </div>
        </section>

        <!-- ================= MISSION & VISION ================= -->
        <section class="section">
            <div class="two-col">
                <div class="quote-panel">
                    <div class="label">Our Mission</div>
                    <h3>"Making Learning Simpler, Smarter, and More Accessible."</h3>
                    <p>
                        Our mission is to create a centralized learning environment where students can easily
                        discover, access, organize, and share academic resources. We aim to reduce the time students
                        spend searching for study materials and help them focus more on learning, understanding, and
                        achieving their academic goals.
                    </p>
                </div>
                <div class="quote-panel">
                    <div class="label">Our Vision</div>
                    <h3>A Better Digital Learning Experience for Every Student</h3>
                    <p>
                        Our vision is to develop StudyVault into a reliable digital learning platform where students
                        can access quality educational resources anytime and from anywhere. We want to build a
                        collaborative learning environment that encourages students to learn, share, and grow together.
                    </p>
                </div>
            </div>
        </section>

        <!-- ================= WHY STUDYVAULT ================= -->
        <section class="section">
            <div class="section-head centered" style="margin-left:auto;margin-right:auto;">
                <h2>Why StudyVault?</h2>
            </div>
            <div class="feature-grid">
                <div class="feature-card c1">
                    <div class="feature-icon">🎯</div>
                    <h3>Simple</h3>
                    <p>A clean and easy-to-use interface designed with students in mind.</p>
                </div>
                <div class="feature-card c2">
                    <div class="feature-icon">🔎</div>
                    <h3>Organized</h3>
                    <p>Resources are categorized so students can find relevant materials more easily.</p>
                </div>
                <div class="feature-card c3">
                    <div class="feature-icon">⚡</div>
                    <h3>Convenient</h3>
                    <p>Access important academic resources from one centralized platform.</p>
                </div>
                <div class="feature-card c4">
                    <div class="feature-icon">🤝</div>
                    <h3>Collaborative</h3>
                    <p>Encourages students to share useful learning resources with others.</p>
                </div>
                <div class="feature-card c5">
                    <div class="feature-icon">📱</div>
                    <h3>Accessible</h3>
                    <p>Designed to provide a convenient learning experience across different devices.</p>
                </div>
            </div>
        </section>

        <!-- ================= OUR VALUES ================= -->
        <section class="section">
            <div class="section-head centered" style="margin-left:auto;margin-right:auto;">
                <h2>Our Values</h2>
            </div>
            <div class="feature-grid">
                <div class="feature-card c5">
                    <div class="feature-icon">📖</div>
                    <h3>Learning</h3>
                    <p>We believe continuous learning helps students develop knowledge, confidence, and skills.</p>
                </div>
                <div class="feature-card c4">
                    <div class="feature-icon">🤝</div>
                    <h3>Collaboration</h3>
                    <p>Sharing knowledge can help create a stronger and more supportive learning community.</p>
                </div>
                <div class="feature-card c2">
                    <div class="feature-icon">💡</div>
                    <h3>Innovation</h3>
                    <p>We aim to use technology to make traditional learning and resource management more convenient.</p>
                </div>
                <div class="feature-card c6">
                    <div class="feature-icon">🔐</div>
                    <h3>Trust</h3>
                    <p>We value responsible resource sharing, user privacy, and a safe learning environment.</p>
                </div>
                <div class="feature-card c1">
                    <div class="feature-icon">🎓</div>
                    <h3>Student First</h3>
                    <p>The platform is designed around the needs, challenges, and experiences of students.</p>
                </div>
            </div>
        </section>

        <!-- ================= HOW IT WORKS ================= -->
        <section class="section">
            <div class="section-head centered" style="margin-left:auto;margin-right:auto;">
                <h2>How StudyVault Works</h2>
            </div>
            <div class="steps-row">
                <div class="step-card">
                    <div class="step-connector"></div>
                    <div class="num">1</div>
                    <h4>Discover</h4>
                    <p>Explore available academic resources.</p>
                </div>
                <div class="step-card">
                    <div class="step-connector"></div>
                    <div class="num">2</div>
                    <h4>Search</h4>
                    <p>Use search and categories to find relevant materials.</p>
                </div>
                <div class="step-card">
                    <div class="step-connector"></div>
                    <div class="num">3</div>
                    <h4>Explore</h4>
                    <p>View resource details before accessing them.</p>
                </div>
                <div class="step-card">
                    <div class="step-connector"></div>
                    <div class="num">4</div>
                    <h4>Save &amp; Download</h4>
                    <p>Registered users can save useful resources and download available materials.</p>
                </div>
                <div class="step-card">
                    <div class="num">5</div>
                    <h4>Learn &amp; Grow</h4>
                    <p>Use the resources to support your academic journey.</p>
                </div>
            </div>
        </section>

        <!-- ================= FOR STUDENTS BY STUDENTS ================= -->
        <section class="section">
            <div class="panel" style="text-align:center;">
                <h2 style="font-family:'Playfair Display', Georgia, serif; font-size:22px; margin-bottom:16px;">For Students, By Students</h2>
                <p>StudyVault is designed around the real academic needs of students.</p>
                <p>
                    We understand that students need more than just information. They need organized resources,
                    easy access, useful study materials, and a simple platform that helps them manage their learning.
                </p>
                <p>That's why StudyVault focuses on creating a practical and student-friendly digital learning experience.</p>
            </div>
        </section>

        <!-- ================= CTA ================= -->
        <section class="section">
            <div class="cta-panel">
                <h2>Join the StudyVault Community</h2>
                <p>Your learning journey starts here. Explore resources, discover new learning materials, and make your academic journey easier with StudyVault.</p>
                <div class="cta-buttons">
                    <a href="Resources.aspx"><button type="button" class="cta-primary">Explore Resources</button></a>
                    <a href="Register.aspx"><button type="button" class="cta-secondary">Create an Account</button></a>
                </div>
            </div>
        </section>

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

</body>
</html>