<%@ Page Title="Feedback - StudyVault" Language="C#" AutoEventWireup="true"
    CodeBehind="Feedback.aspx.cs" Inherits="STUDYVAULT.Feedback" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Feedback - StudyVault</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" />
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,600;0,700;1,600&display=swap" rel="stylesheet">
    <style>
        * { box-sizing: border-box; margin:0; padding:0; }
        body {
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
            background: #f6f8ff;
            color: #111827;
        }
        a { text-decoration: none; }
        button { font-family: inherit; }

        :root {
            --hairline: rgba(17,24,39,.08);
            --webdev-accent:#3b82f6;   --webdev-tint:#eff6ff;   --webdev-text:#1d4ed8;
            --databases-accent:#06b6d4; --databases-tint:#ecfeff; --databases-text:#0e7490;
            --networking-accent:#10b981; --networking-tint:#ecfdf5; --networking-text:#047857;
            --ai-accent:#8b5cf6;       --ai-tint:#f5f3ff;       --ai-text:#6d28d9;
        }

        a:focus-visible, button:focus-visible, input:focus-visible, textarea:focus-visible, select:focus-visible {
            outline: 3px solid #4f46e5;
            outline-offset: 2px;
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

        /* ================= PAGE INTRO ================= */
        .main { max-width: 1200px; margin: 0 auto; padding: 50px 60px 90px; }
        .eyebrow {
            text-transform: uppercase;
            letter-spacing: 1.5px;
            font-size: 12px;
            font-weight: 700;
            color: #4f46e5;
            margin-bottom: 8px;
        }
        .main h1 {
            font-family: 'Playfair Display', Georgia, serif;
            font-size: 36px;
            font-weight: 700;
            letter-spacing: -0.5px;
            margin-bottom: 10px;
        }
        .main > p.subtitle { color:#6b7280; font-size:15px; margin-bottom: 40px; max-width: 520px; }

        /* ================= LAYOUT ================= */
        .feedback-layout {
            display: grid;
            grid-template-columns: 1.3fr 0.9fr;
            gap: 26px;
            align-items: start;
        }

        .panel {
            background: white;
            border-radius: 22px;
            border: 1px solid var(--hairline);
            padding: 34px;
        }

        /* ================= FORM ================= */
        .field { margin-bottom: 22px; }
        .field:last-child { margin-bottom: 0; }
        .field label {
            display: block;
            font-weight: 700;
            font-size: 14px;
            margin-bottom: 8px;
            color: #111827;
        }
        .field .hint { font-weight: 400; color: #9ca3af; font-size: 12.5px; margin-left: 6px; }

        .field input[type="text"],
        .field input[type="email"],
        .field textarea,
        .field select {
            width: 100%;
            padding: 12px 16px;
            border-radius: 12px;
            border: 1px solid var(--hairline);
            font-size: 14.5px;
            color: #111827;
            font-family: inherit;
            background: #fbfbfe;
            transition: .2s;
        }
        .field input:focus,
        .field textarea:focus,
        .field select:focus {
            border-color: #4f46e5;
            background: white;
        }
        .field input[disabled] {
            background: #f3f4f6;
            color: #6b7280;
            cursor: not-allowed;
        }
        .field textarea { resize: vertical; min-height: 120px; line-height: 1.6; }

        .two-col { display: grid; grid-template-columns: 1fr 1fr; gap: 18px; }

        /* Star rating (pure CSS, no JS needed) */
        .star-rating {
            display: flex;
            flex-direction: row-reverse;
            justify-content: flex-end;
            gap: 4px;
        }
        .star-rating input { display: none; }
        .star-rating label {
            font-size: 30px;
            color: #e5e7eb;
            cursor: pointer;
            transition: color .15s;
            margin: 0;
        }
        .star-rating input:checked ~ label,
        .star-rating label:hover,
        .star-rating label:hover ~ label {
            color: #f59e0b;
        }

        .submit-btn {
            background: #4f46e5;
            color: white;
            border: none;
            padding: 13px 30px;
            border-radius: 24px;
            font-weight: 700;
            font-size: 14.5px;
            cursor: pointer;
            transition: .2s;
            box-shadow: 0 10px 22px rgba(79,70,229,.22);
        }
        .submit-btn:hover { background: #4338ca; transform: translateY(-2px); }

        /* Confirmation */
        .confirmation {
            display: flex;
            align-items: flex-start;
            gap: 14px;
            background: #ecfdf5;
            border: 1px solid #a7f3d0;
            border-radius: 16px;
            padding: 18px 20px;
            margin-bottom: 26px;
        }
        .confirmation .check {
            width: 36px; height: 36px; flex-shrink: 0;
            background: #10b981; color: white;
            border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            font-size: 18px;
        }
        .confirmation h3 { font-size: 15px; margin-bottom: 3px; color: #047857; }
        .confirmation p { font-size: 13.5px; color: #065f46; }

        /* ================= SIDE PANEL ================= */
        .side-panel h2 {
            font-family: 'Playfair Display', Georgia, serif;
            font-size: 21px;
            font-weight: 700;
            margin-bottom: 6px;
        }
        .side-panel > p.lead { color: #6b7280; font-size: 13.5px; margin-bottom: 24px; }

        .rating-summary {
            display: flex;
            align-items: baseline;
            gap: 10px;
            margin-bottom: 22px;
            padding-bottom: 22px;
            border-bottom: 1px solid var(--hairline);
        }
        .rating-summary .big-num {
            font-family: 'Playfair Display', Georgia, serif;
            font-size: 42px;
            font-weight: 700;
            color: #111827;
        }
        .rating-summary .stars { color: #f59e0b; font-size: 15px; letter-spacing: 2px; }
        .rating-summary .count { color: #9ca3af; font-size: 12.5px; margin-top: 2px; }

        .highlight-item {
            display: flex;
            gap: 12px;
            padding: 14px 0;
            border-bottom: 1px solid var(--hairline);
        }
        .highlight-item:last-child { border-bottom: none; padding-bottom: 0; }
        .highlight-item .avatar {
            width: 36px; height: 36px; flex-shrink: 0;
            border-radius: 50%;
            display: flex; align-items: center; justify-content: center;
            font-size: 15px; font-weight: 700; color: white;
        }
        .highlight-item .avatar.a1 { background: var(--webdev-accent); }
        .highlight-item .avatar.a2 { background: var(--ai-accent); }
        .highlight-item .avatar.a3 { background: var(--networking-accent); }
        .highlight-item h4 { font-size: 13.5px; font-weight: 700; }
        .highlight-item .stars-small { color: #f59e0b; font-size: 11px; margin: 3px 0; letter-spacing: 1px; }
        .highlight-item p { font-size: 12.5px; color: #6b7280; line-height: 1.5; }

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
/* ================= MY FEEDBACK ================= */

.my-feedback-section {
    margin-top: 30px;
}

.my-feedback-section h2 {
    font-family: 'Playfair Display', Georgia, serif;
    font-size: 25px;
    margin-bottom: 6px;
}

.my-feedback-subtitle {
    color: #6b7280;
    font-size: 14px;
    margin-bottom: 20px;
}

.student-feedback-card {
    background: white;
    border: 1px solid var(--hairline);
    border-radius: 18px;
    padding: 22px;
    margin-bottom: 16px;
}

.student-feedback-top {
    display: flex;
    justify-content: space-between;
    align-items: center;
    gap: 15px;
    margin-bottom: 15px;
}

.student-feedback-category {
    font-weight: 700;
    font-size: 14px;
    color: #111827;
}

.student-feedback-date {
    color: #9ca3af;
    font-size: 12px;
    margin-left: 10px;
}

.student-feedback-message {
    color: #4b5563;
    font-size: 14px;
    line-height: 1.7;
    background: #f9fafb;
    padding: 14px;
    border-radius: 12px;
    margin-bottom: 15px;
}

.student-feedback-rating {
    color: #f59e0b;
    font-size: 14px;
    margin-bottom: 15px;
}

/* STATUS */

.feedback-status {
    display: inline-flex;
    align-items: center;
    gap: 6px;
    padding: 7px 13px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 700;
}

.status-new {
    background: #eff6ff;
    color: #2563eb;
}

.status-important {
    background: #fef2f2;
    color: #dc2626;
}

.status-reviewing {
    background: #fff7ed;
    color: #ea580c;
}

.status-resolved {
    background: #ecfdf5;
    color: #047857;
}

.no-feedback {
    background: white;
    border: 1px solid var(--hairline);
    border-radius: 18px;
    padding: 30px;
    text-align: center;
    color: #9ca3af;
}

        @media (max-width: 900px) {
            .feedback-layout { grid-template-columns: 1fr; }
        }
        @media (max-width: 700px) {
            .header { flex-direction:column; gap:15px; padding:18px 20px; }
            .main { padding: 30px 20px 60px; }
            .two-col { grid-template-columns: 1fr; }
            .panel { padding: 24px; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

<header class="header">
    <div class="logo">📘 StudyVault</div>
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
            <div class="eyebrow">Tell us what you think</div>
            <h1>Feedback</h1>
            <p class="subtitle">Your input shapes what we build next. Report a bug, suggest a resource, or just tell us how it's going.</p>

            <asp:Panel ID="pnlConfirmation" runat="server" CssClass="confirmation" Visible="false">
                <div class="check">✓</div>
                <div>
                    <h3>Thanks — your feedback was submitted.</h3>
                    <p>We read every response. If you asked a question, we'll follow up by email.</p>
                </div>
            </asp:Panel>

            <div class="feedback-layout">

                <!-- FORM -->
                <div class="panel">
                    <div class="field">
                        <label for="<%= txtName.ClientID %>">Name</label>
                        <asp:TextBox ID="txtName" runat="server" TextMode="SingleLine" Enabled="false"></asp:TextBox>
                    </div>

                    <div class="two-col">
                        <div class="field">
                            <label for="<%= txtEmail.ClientID %>">Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" placeholder="you@example.com"></asp:TextBox>
                        </div>
                        <div class="field">
                            <label for="<%= ddlCategory.ClientID %>">Category</label>
                            <asp:DropDownList ID="ddlCategory" runat="server">
                                <asp:ListItem Text="General Feedback" Value="general" />
                                <asp:ListItem Text="Bug Report" Value="bug" />
                                <asp:ListItem Text="Resource Suggestion" Value="resource" />
                                <asp:ListItem Text="Feature Request" Value="feature" />
                                <asp:ListItem Text="Other" Value="other" />
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="field">
                        <label>Your rating <span class="hint">how's StudyVault working for you?</span></label>
                        <div class="star-rating">
                            <asp:RadioButton ID="rb5" runat="server" GroupName="rating" />
                            <label for="<%= rb5.ClientID %>">★</label>
                            <asp:RadioButton ID="rb4" runat="server" GroupName="rating" />
                            <label for="<%= rb4.ClientID %>">★</label>
                            <asp:RadioButton ID="rb3" runat="server" GroupName="rating" Checked="true" />
                            <label for="<%= rb3.ClientID %>">★</label>
                            <asp:RadioButton ID="rb2" runat="server" GroupName="rating" />
                            <label for="<%= rb2.ClientID %>">★</label>
                            <asp:RadioButton ID="rb1" runat="server" GroupName="rating" />
                            <label for="<%= rb1.ClientID %>">★</label>
                        </div>
                    </div>

                    <div class="field">
                        <label for="<%= txtMessage.ClientID %>">Message</label>
                        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" placeholder="What's on your mind?"></asp:TextBox>
                    </div>

                    <div class="field">
                        <asp:Button ID="btnSubmitFeedback" runat="server" CssClass="submit-btn"
                            Text="Submit Feedback" OnClick="btnSubmitFeedback_Click" />
                    </div>
                </div>

                <!-- SIDE PANEL -->
                <div class="panel side-panel">
                    <h2>What students are saying</h2>
                    <p class="lead">A quick look at recent feedback.</p>

                    <div class="rating-summary">
                        <div class="big-num">4.9</div>
                        <div>
                            <div class="stars">★★★★★</div>
                            <div class="count">Based on 250+ reviews</div>
                        </div>
                    </div>

                    <div class="highlight-item">
                        <div class="avatar a1">R</div>
                        <div>
                            <h4>Riya S.</h4>
                            <div class="stars-small">★★★★★</div>
                            <p>The database notes saved my midterm prep. Would love more video walkthroughs.</p>
                        </div>
                    </div>

                    <div class="highlight-item">
                        <div class="avatar a2">A</div>
                        <div>
                            <h4>Aashish T.</h4>
                            <div class="stars-small">★★★★☆</div>
                            <p>Great resource library. Search could be a bit faster on mobile.</p>
                        </div>
                    </div>

                    <div class="highlight-item">
                        <div class="avatar a3">P</div>
                        <div>
                            <h4>Prakriti M.</h4>
                            <div class="stars-small">★★★★★</div>
                            <p>Clean layout, easy to find what I need before class.</p>
                        </div>
                    </div>
                    <!-- ================= MY FEEDBACK ================= -->

<asp:Panel
    ID="pnlMyFeedback"
    runat="server"
    CssClass="my-feedback-section">

    <h2>My Feedback</h2>

    <p class="my-feedback-subtitle">
        Track the status of feedback you have submitted.
    </p>

    <asp:Repeater
        ID="rptMyFeedback"
        runat="server">

        <ItemTemplate>

            <div class="student-feedback-card">

                <div class="student-feedback-top">

                    <div>
                        <span class="student-feedback-category">
                            <%# Eval("Category") %>
                        </span>

                        <span class="student-feedback-date">
                            <%# Eval("SubmittedOn", "{0:MMM dd, yyyy}") %>
                        </span>
                    </div>

                    <span class='<%# GetStatusCss(Eval("Status").ToString()) %>'>
                        <%# GetStatusIcon(Eval("Status").ToString()) %>
                        <%# GetStudentStatus(Eval("Status").ToString()) %>
                    </span>

                </div>

                <div class="student-feedback-message">
                    <%# Server.HtmlEncode(Eval("Message").ToString()) %>
                </div>

                <div class="student-feedback-rating">
                    <%# GetStars(Convert.ToInt32(Eval("Rating"))) %>
                </div>

            </div>

        </ItemTemplate>

    </asp:Repeater>

    <asp:Panel
        ID="pnlNoFeedback"
        runat="server"
        CssClass="no-feedback"
        Visible="false">

        <p>
            You haven't submitted any feedback yet.
        </p>

    </asp:Panel>

</asp:Panel>
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
</body>
</html>