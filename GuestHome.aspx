<%@ Page Title="StudyVault | Your Academic Resource Hub"
    Language="C#"
    AutoEventWireup="true"
    CodeBehind="GuestHome.aspx.cs"
    Inherits="STUDYVAULT.GuestHome" %>

<!DOCTYPE html>

<html lang="en">

<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0" />

    <meta name="description"
          content="StudyVault - Your academic resource hub for notes, assignments, tutorials and study materials." />

    <title>StudyVault | Your Academic Resource Hub</title>
    <link rel="preconnect"
          href="https://fonts.googleapis.com" />

    <link rel="preconnect"
          href="https://fonts.gstatic.com"
          crossorigin />

    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;600;700&family=Playfair+Display:ital,wght@0,600;0,700;1,600&display=swap"
          rel="stylesheet" />

    <style>

        /* =========================================================
           RESET
        ========================================================= */

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: 'DM Sans', 'Segoe UI', sans-serif;
            background: #f7f8fc;
            color: #111827;
            line-height: 1.6;
            overflow-x: hidden;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        button,
        input {
            font-family: inherit;
        }

        img {
            max-width: 100%;
        }

        ::selection {
            background: #6366f1;
            color: white;
        }


        /* =========================================================
           VARIABLES
        ========================================================= */

        :root {

            --primary: #6366f1;
            --primary-dark: #4f46e5;
            --primary-light: #eef2ff;

            --purple: #8b5cf6;
            --blue: #3b82f6;

            --text: #111827;
            --muted: #6b7280;
            --light-text: #9ca3af;

            --white: #ffffff;

            --background: #f7f8fc;

            --border: rgba(17, 24, 39, 0.08);

            --shadow:
                0 15px 40px rgba(15, 23, 42, 0.08);

            --shadow-large:
                0 25px 70px rgba(15, 23, 42, 0.15);

            --radius: 20px;
        }


        /* =========================================================
           GLOBAL
        ========================================================= */

        .container {
            width: min(1200px, calc(100% - 40px));
            margin: 0 auto;
        }

        .section-label {
            display: inline-flex;
            align-items: center;
            gap: 8px;

            color: var(--primary);

            font-size: 12px;
            font-weight: 800;

            letter-spacing: 1.8px;
            text-transform: uppercase;

            margin-bottom: 12px;
        }

        .section-label::before {
            content: "";
            width: 25px;
            height: 2px;
            background: var(--primary);
            border-radius: 10px;
        }

        .section-title {
            font-family: 'Playfair Display', Georgia, serif;

            font-size: clamp(30px, 4vw, 46px);

            line-height: 1.15;

            color: #111827;

            margin-bottom: 15px;
        }

        .section-description {
            max-width: 650px;

            margin: 0 auto;

            color: var(--muted);

            font-size: 15px;

            line-height: 1.8;
        }


        /* =========================================================
           HEADER
        ========================================================= */

        .site-header {

            position: fixed;

            top: 0;
            left: 0;
            right: 0;

            z-index: 9999;

            height: 82px;

            display: flex;
            align-items: center;

            transition:
                background 0.3s ease,
                box-shadow 0.3s ease,
                height 0.3s ease;

            background: transparent;
        }

        .site-header.scrolled {

            height: 70px;

            background: rgba(255,255,255,0.94);

            backdrop-filter: blur(18px);
            -webkit-backdrop-filter: blur(18px);

            box-shadow:
                0 8px 30px rgba(15,23,42,0.08);
        }

        .header-inner {

            width: min(1280px, calc(100% - 50px));

            margin: auto;

            display: flex;

            align-items: center;

            justify-content: space-between;
        }


      .logo {
    font-size: 21px;
    font-weight: 800;
    letter-spacing: -1px;
}


.logo-dot {
    color: #64dce8;
}


        /* NAVIGATION */

        .main-nav {

            display: flex;

            align-items: center;

            gap: 30px;
        }

        .main-nav a {

            color: rgba(255,255,255,0.9);

            font-size: 14px;

            font-weight: 600;

            position: relative;

            transition: 0.25s ease;
        }

        .main-nav a:not(.nav-button)::after {

            content: "";

            position: absolute;

            left: 0;
            bottom: -7px;

            width: 0;

            height: 2px;

            background: white;

            transition: 0.25s ease;
        }

        .main-nav a:not(.nav-button):hover::after {
            width: 100%;
        }

        .main-nav a:hover {
            color: white;
        }

        .site-header.scrolled .main-nav a {
            color: #4b5563;
        }

        .site-header.scrolled .main-nav a:not(.nav-button)::after {
            background: var(--primary);
        }

        .site-header.scrolled .main-nav a:hover {
            color: var(--primary);
        }


        /* NAV BUTTON */

        .nav-button {

            background: white;

            color: var(--primary) !important;

            padding: 11px 20px;

            border-radius: 30px;

            box-shadow:
                0 8px 25px rgba(0,0,0,0.16);

            transition: 0.25s ease !important;
        }

        .nav-button:hover {

            transform: translateY(-2px);

            background: #eef2ff;

            color: var(--primary-dark) !important;
        }

        .site-header.scrolled .nav-button {

            background: var(--primary);

            color: white !important;
        }

        .site-header.scrolled .nav-button:hover {

            background: var(--primary-dark);

            color: white !important;
        }


        /* =========================================================
           HERO
        ========================================================= */

        .hero {

            min-height: 760px;

            position: relative;

            overflow: hidden;

            display: flex;

            align-items: center;

            justify-content: center;

            text-align: center;

            padding:
                130px 20px
                150px;
        }


        /* HERO IMAGE */

        .hero-image {

            position: absolute;

            inset: 0;

            width: 100%;
            height: 100%;

            object-fit: cover;

            z-index: 0;
        }


        /* DARK OVERLAY */

        .hero-overlay {

            position: absolute;

            inset: 0;

            z-index: 1;

            background:

                linear-gradient(
                    135deg,
                    rgba(15,23,42,0.88) 0%,
                    rgba(30,27,75,0.72) 45%,
                    rgba(49,46,129,0.65) 100%
                );
        }


        /* DECORATIVE LIGHT */

        .hero-glow {

            position: absolute;

            width: 600px;
            height: 600px;

            border-radius: 50%;

            background:
                radial-gradient(
                    circle,
                    rgba(129,140,248,0.30),
                    transparent 70%
                );

            top: -250px;
            right: -180px;

            z-index: 2;
        }

        .hero-glow-two {

            position: absolute;

            width: 500px;
            height: 500px;

            border-radius: 50%;

            background:
                radial-gradient(
                    circle,
                    rgba(139,92,246,0.25),
                    transparent 70%
                );

            bottom: -250px;
            left: -180px;

            z-index: 2;
        }


        /* HERO CONTENT */

        .hero-content {

            position: relative;

            z-index: 5;

            width: min(850px, 100%);
        }


        /* BADGE */

        .hero-badge {

            display: inline-flex;

            align-items: center;

            gap: 8px;

            padding: 9px 17px;

            border-radius: 30px;

            background:
                rgba(255,255,255,0.10);

            border:
                1px solid rgba(255,255,255,0.20);

            color: #e0e7ff;

            backdrop-filter: blur(10px);

            font-size: 13px;

            font-weight: 600;

            margin-bottom: 25px;

            animation:
                fadeUp 0.8s ease both;
        }


        /* HERO TITLE */

        .hero-title {

            font-family:
                'Playfair Display',
                Georgia,
                serif;

            color: white;

            font-size:
                clamp(42px, 6vw, 70px);

            line-height: 1.08;

            letter-spacing: -1.5px;

            margin-bottom: 22px;

            text-shadow:
                0 10px 35px rgba(0,0,0,0.30);

            animation:
                fadeUp 0.8s ease 0.1s both;
        }

        .hero-title em {

            color: #c7d2fe;

            font-style: italic;
        }


        /* HERO TEXT */

        .hero-description {

            max-width: 650px;

            margin: 0 auto 35px;

            color:
                rgba(255,255,255,0.82);

            font-size: 17px;

            line-height: 1.8;

            animation:
                fadeUp 0.8s ease 0.2s both;
        }


        /* SEARCH */

        .hero-search {

            width: min(650px, 100%);

            margin: 0 auto;

            padding: 7px;

            display: flex;

            align-items: center;

            gap: 5px;

            background: white;

            border-radius: 50px;

            box-shadow:
                0 20px 60px rgba(0,0,0,0.25);

            animation:
                fadeUp 0.8s ease 0.3s both;
        }

        .hero-search input {

            flex: 1;

            min-width: 0;

            border: 0;

            outline: none;

            background: transparent;

            padding: 14px 18px;

            color: #374151;

            font-size: 15px;
        }

        .hero-search input::placeholder {
            color: #9ca3af;
        }

        .hero-search input:focus {
            outline: none;
        }

        .hero-search-button {

            border: 0;

            cursor: pointer;

            background:
                linear-gradient(
                    135deg,
                    #6366f1,
                    #7c3aed
                );

            color: white;

            border-radius: 40px;

            padding: 13px 25px;

            font-size: 14px;

            font-weight: 700;

            transition: 0.25s ease;
        }

        .hero-search-button:hover {

            transform: translateY(-2px);

            box-shadow:
                0 10px 25px rgba(99,102,241,0.35);
        }


        /* HERO STATS */

        .hero-stats {

            display: flex;

            justify-content: center;

            align-items: center;

            gap: 45px;

            margin-top: 42px;

            animation:
                fadeUp 0.8s ease 0.4s both;
        }

        .hero-stat {

            color: white;

            text-align: center;
        }

        .hero-stat strong {

            display: block;

            font-size: 22px;

            font-weight: 800;
        }

        .hero-stat span {

            display: block;

            color:
                rgba(255,255,255,0.65);

            font-size: 12px;

            margin-top: 2px;
        }

        .stat-divider {

            width: 1px;

            height: 35px;

            background:
                rgba(255,255,255,0.20);
        }


        /* HERO BOTTOM SHAPE */

        .hero-bottom {

            position: absolute;

            bottom: -1px;

            left: 0;

            width: 100%;

            height: 100px;

            z-index: 6;

            background: var(--background);

            clip-path:
                polygon(
                    0 55%,
                    20% 45%,
                    40% 65%,
                    60% 45%,
                    80% 60%,
                    100% 40%,
                    100% 100%,
                    0 100%
                );
        }


        /* =========================================================
           CATEGORIES
        ========================================================= */

        .categories-section {

            padding: 75px 0 40px;

            background: var(--background);

            text-align: center;
        }

        .categories-grid {

            display: grid;

            grid-template-columns:
                repeat(6, 1fr);

            gap: 14px;

            margin-top: 35px;
        }

        .category-card {

            background: white;

            border: 1px solid var(--border);

            border-radius: 18px;

            padding: 22px 12px;

            transition:
                transform 0.25s ease,
                box-shadow 0.25s ease,
                border-color 0.25s ease;
        }

        .category-card:hover {

            transform:
                translateY(-6px);

            box-shadow:
                var(--shadow);

            border-color:
                rgba(99,102,241,0.25);
        }

        .category-icon {

            width: 52px;
            height: 52px;

            display: flex;

            align-items: center;
            justify-content: center;

            margin: 0 auto 12px;

            border-radius: 15px;

            font-size: 24px;
        }

        .category-card h3 {

            font-size: 13px;

            font-weight: 700;

            color: #374151;
        }

        .category-card p {

            color: #9ca3af;

            font-size: 11px;

            margin-top: 3px;
        }


        .category-webdev .category-icon {
            background: #eff6ff;
        }

        .category-database .category-icon {
            background: #ecfeff;
        }

        .category-network .category-icon {
            background: #ecfdf5;
        }

        .category-ai .category-icon {
            background: #f5f3ff;
        }

        .category-security .category-icon {
            background: #fef2f2;
        }

        .category-design .category-icon {
            background: #fffbeb;
        }


        /* =========================================================
           RESOURCES
        ========================================================= */

        .resources-section {

            padding: 90px 0;

            background: var(--background);
        }

        .resources-header {

            text-align: center;

            margin-bottom: 40px;
        }

        .resource-grid {

            display: grid;

            grid-template-columns:
                repeat(4, 1fr);

            gap: 22px;
        }


        /* RESOURCE CARD */

        .resource-card {

            background: white;

            border:
                1px solid var(--border);

            border-top:
                4px solid #6366f1;

            border-radius: 20px;

            padding: 23px;

            position: relative;

            overflow: hidden;

            transition:
                transform 0.3s ease,
                box-shadow 0.3s ease;
        }

        .resource-card::after {

            content: "";

            position: absolute;

            width: 130px;
            height: 130px;

            border-radius: 50%;

            background:
                rgba(99,102,241,0.04);

            top: -60px;
            right: -60px;

            transition: 0.3s ease;
        }

        .resource-card:hover {

            transform:
                translateY(-7px);

            box-shadow:
                var(--shadow);
        }

        .resource-card:hover::after {

            transform: scale(1.3);
        }


        /* CATEGORY COLORS */

        .resource-card[data-category="webdev"] {
            border-top-color: #3b82f6;
        }

        .resource-card[data-category="databases"] {
            border-top-color: #06b6d4;
        }

        .resource-card[data-category="networking"] {
            border-top-color: #10b981;
        }

        .resource-card[data-category="ai"] {
            border-top-color: #8b5cf6;
        }

        .resource-card[data-category="security"] {
            border-top-color: #ef4444;
        }

        .resource-card[data-category="design"] {
            border-top-color: #f59e0b;
        }


        /* CARD TOP */

        .card-top {

            display: flex;

            justify-content: space-between;

            align-items: center;

            margin-bottom: 20px;
        }

        .icon-badge {

            width: 50px;
            height: 50px;

            display: flex;

            align-items: center;
            justify-content: center;

            border-radius: 15px;

            background: #eef2ff;

            font-size: 23px;
        }

        .format-chip {

            font-size: 10px;

            font-weight: 800;

            color: #6b7280;

            background: #f3f4f6;

            padding: 5px 10px;

            border-radius: 20px;

            letter-spacing: 0.5px;
        }


        /* CARD TITLE */

        .resource-card h3 {

            font-size: 16px;

            line-height: 1.4;

            color: #111827;

            margin-bottom: 9px;
        }

        .resource-description {

            color: #6b7280;

            font-size: 12.5px;

            line-height: 1.6;

            margin-bottom: 17px;

            display: -webkit-box;

            -webkit-line-clamp: 3;

            -webkit-box-orient: vertical;

            overflow: hidden;
        }


        /* TAG */

        .tag-row {

            display: flex;

            align-items: center;

            gap: 8px;

            flex-wrap: wrap;

            margin-bottom: 18px;
        }

        .category-tag {

            font-size: 11px;

            font-weight: 700;

            padding: 5px 9px;

            border-radius: 9px;

            background: #eef2ff;

            color: #4f46e5;
        }

        .meta-text {

            color: #9ca3af;

            font-size: 11px;
        }


        /* LOCK BUTTON */

        .locked-btn {

            display: flex;

            align-items: center;

            justify-content: center;

            gap: 7px;

            width: 100%;

            padding: 11px;

            border-radius: 12px;

            background: #f8faff;

            border:
                1px dashed #c7d2fe;

            color: #4f46e5;

            font-size: 12px;

            font-weight: 700;

            transition: 0.25s ease;
        }

        .locked-btn:hover {

            background: #eef2ff;

            border-color: #818cf8;

            transform: translateY(-1px);
        }


        /* EMPTY */

        .empty-state {

            grid-column:
                1 / -1;

            text-align: center;

            padding: 70px 20px;

            color: #6b7280;

            background: white;

            border-radius: 20px;

            border: 1px solid var(--border);
        }

        .empty-state-icon {

            font-size: 45px;

            margin-bottom: 15px;
        }


        /* =========================================================
           ABOUT
        ========================================================= */

        .about-section {

            padding: 110px 0;

            background: white;

            scroll-margin-top: 80px;
        }

        .about-header {

            text-align: center;

            margin-bottom: 55px;
        }


        /* ABOUT LAYOUT */

        .about-grid {

            display: grid;

            grid-template-columns:
                1fr 1fr;

            gap: 65px;

            align-items: center;
        }


        /* ABOUT IMAGE */

        .about-image-wrapper {

            position: relative;
        }

        .about-image {

            width: 100%;

            height: 480px;

            object-fit: cover;

            border-radius: 28px;

            box-shadow:
                var(--shadow-large);
        }

        .about-image-card {

            position: absolute;

            right: -25px;

            bottom: 30px;

            background: white;

            padding: 20px;

            border-radius: 18px;

            box-shadow:
                0 20px 50px rgba(15,23,42,0.15);

            display: flex;

            align-items: center;

            gap: 12px;
        }

        .about-image-card-icon {

            width: 45px;
            height: 45px;

            border-radius: 12px;

            display: flex;

            align-items: center;
            justify-content: center;

            background: #eef2ff;

            font-size: 21px;
        }

        .about-image-card strong {

            display: block;

            font-size: 14px;
        }

        .about-image-card span {

            display: block;

            color: #9ca3af;

            font-size: 11px;
        }


        /* ABOUT CONTENT */

        .about-content .section-label {
            margin-bottom: 15px;
        }

        .about-content h2 {

            font-family:
                'Playfair Display',
                Georgia,
                serif;

            font-size: 38px;

            line-height: 1.2;

            margin-bottom: 18px;
        }

        .about-content > p {

            color: #6b7280;

            font-size: 15px;

            line-height: 1.8;

            margin-bottom: 28px;
        }


        /* FEATURES */

        .about-features {

            display: grid;

            grid-template-columns:
                1fr 1fr;

            gap: 15px;
        }

        .about-feature {

            padding: 18px;

            background: #f8f9ff;

            border-radius: 16px;

            border: 1px solid #eef0ff;
        }

        .about-feature-icon {

            font-size: 22px;

            margin-bottom: 7px;
        }

        .about-feature h3 {

            font-size: 13px;

            margin-bottom: 4px;
        }

        .about-feature p {

            color: #6b7280;

            font-size: 11.5px;

            line-height: 1.5;
        }


        /* =========================================================
           CTA
        ========================================================= */

        .cta-section {

            padding: 100px 0;

            background:
                #f7f8fc;
        }

        .cta-box {

            position: relative;

            overflow: hidden;

            border-radius: 30px;

            padding: 75px 30px;

            text-align: center;

            background:

                radial-gradient(
                    circle at 10% 10%,
                    rgba(129,140,248,0.3),
                    transparent 30%
                ),

                radial-gradient(
                    circle at 90% 90%,
                    rgba(139,92,246,0.3),
                    transparent 30%
                ),

                linear-gradient(
                    135deg,
                    #111827,
                    #1e1b4b
                );

            box-shadow:
                var(--shadow-large);
        }

        .cta-box h2 {

            font-family:
                'Playfair Display',
                Georgia,
                serif;

            color: white;

            font-size: 42px;

            margin-bottom: 12px;
        }

        .cta-box p {

            max-width: 550px;

            margin: 0 auto 28px;

            color:
                rgba(255,255,255,0.70);

            font-size: 14px;
        }

        .cta-buttons {

            display: flex;

            justify-content: center;

            gap: 12px;

            flex-wrap: wrap;
        }

        .cta-primary {

            background: white;

            color: #4f46e5;

            padding: 13px 25px;

            border-radius: 30px;

            font-size: 13px;

            font-weight: 800;

            transition: 0.25s ease;
        }

        .cta-primary:hover {

            transform: translateY(-3px);

            background: #eef2ff;
        }

        .cta-secondary {

            background:
                rgba(255,255,255,0.08);

            color: white;

            border:
                1px solid rgba(255,255,255,0.25);

            padding: 13px 25px;

            border-radius: 30px;

            font-size: 13px;

            font-weight: 700;

            transition: 0.25s ease;
        }

        .cta-secondary:hover {

            background:
                rgba(255,255,255,0.16);

            transform: translateY(-3px);
        }


        /* =========================================================
           FOOTER
        ========================================================= */

        .footer {

            background: #0f172a;

            color: white;

            padding: 60px 0 30px;
        }

        .footer-grid {

            display: grid;

            grid-template-columns:
                1.5fr 1fr 1fr;

            gap: 60px;

            padding-bottom: 40px;
        }

        .footer-brand h2 {

            font-family:
                'Playfair Display',
                Georgia,
                serif;

            font-size: 24px;

            margin-bottom: 10px;
        }

        .footer-brand p {

            max-width: 350px;

            color: #94a3b8;

            font-size: 13px;

            line-height: 1.7;
        }

        .footer-column h3 {

            font-size: 13px;

            margin-bottom: 15px;

            color: white;
        }

        .footer-column a {

            display: block;

            color: #94a3b8;

            font-size: 12px;

            margin-bottom: 10px;

            transition: 0.2s ease;
        }

        .footer-column a:hover {

            color: white;

            transform: translateX(3px);
        }

        .footer-bottom {

            border-top:
                1px solid rgba(255,255,255,0.08);

            padding-top: 25px;

            display: flex;

            justify-content: space-between;

            align-items: center;

            gap: 20px;

            color: #64748b;

            font-size: 11px;
        }


        /* =========================================================
           ANIMATIONS
        ========================================================= */

        @keyframes fadeUp {

            from {

                opacity: 0;

                transform:
                    translateY(25px);
            }

            to {

                opacity: 1;

                transform:
                    translateY(0);
            }
        }


        /* =========================================================
           RESPONSIVE
        ========================================================= */

        @media (max-width: 1050px) {

            .categories-grid {

                grid-template-columns:
                    repeat(3, 1fr);
            }

            .resource-grid {

                grid-template-columns:
                    repeat(2, 1fr);
            }

            .about-grid {

                gap: 40px;
            }

        }


        @media (max-width: 800px) {

            .site-header {

                height: 70px;
            }

            .main-nav {

                gap: 15px;
            }

            .main-nav a {

                font-size: 12px;
            }

            .hero {

                min-height: 700px;

                padding-top: 120px;
            }

            .hero-stats {

                gap: 20px;
            }

            .about-grid {

                grid-template-columns:
                    1fr;
            }

            .about-image {

                height: 380px;
            }

            .about-image-card {

                right: 15px;
            }

            .footer-grid {

                grid-template-columns:
                    1fr 1fr;
            }

        }


        @media (max-width: 600px) {

            .container {

                width:
                    calc(100% - 30px);
            }

            .site-header {

                height: 65px;
            }

            .header-inner {

                width:
                    calc(100% - 30px);
            }

            .logo {

                font-size: 17px;
            }

            .logo-icon {

                width: 34px;
                height: 34px;

                font-size: 17px;
            }

            .main-nav {

                gap: 10px;
            }

            .main-nav a:not(.nav-button) {

                display: none;
            }

            .nav-button {

                padding:
                    9px 15px;
            }

            .hero {

                min-height: 690px;

                padding:
                    110px 15px 120px;
            }

            .hero-title {

                font-size: 40px;
            }

            .hero-description {

                font-size: 14px;
            }

            .hero-search {

                border-radius: 18px;

                flex-direction: column;

                padding: 8px;
            }

            .hero-search input {

                width: 100%;

                padding:
                    13px;
            }

            .hero-search-button {

                width: 100%;

                border-radius: 13px;
            }

            .hero-stats {

                margin-top: 30px;

                gap: 12px;
            }

            .hero-stat strong {

                font-size: 17px;
            }

            .hero-stat span {

                font-size: 10px;
            }

            .categories-grid {

                grid-template-columns:
                    repeat(2, 1fr);
            }

            .resource-grid {

                grid-template-columns:
                    1fr;
            }

            .about-content h2 {

                font-size: 31px;
            }

            .about-features {

                grid-template-columns:
                    1fr;
            }

            .about-image {

                height: 300px;
            }

            .about-image-card {

                right: 10px;

                bottom: 15px;

                padding: 13px;
            }

            .cta-box {

                padding:
                    55px 20px;
            }

            .cta-box h2 {

                font-size: 32px;
            }

            .footer-grid {

                grid-template-columns:
                    1fr;
            }

            .footer-bottom {

                flex-direction: column;

                text-align: center;
            }

        }

    </style>

</head>


<body>

<form id="form1" runat="server">


    <!-- =========================================================
         HEADER
    ========================================================== -->

    <header class="site-header" id="siteHeader">

        <div class="header-inner">

            <a href="GuestHome.aspx"
               class="logo">
  <!-- LOGO -->

      STUDYVAULT<span class="logo-dot">.</span>

  </a>
            <nav class="main-nav">

                <a href="GuestHome.aspx">
                    Home
                </a>

                <!-- ABOUT NOW SCROLLS ON SAME PAGE -->
                <a href="#about">
                    About
                </a>

                <a href="Login.aspx">
                    Log In
                </a>

                <a href="Register.aspx"
                   class="nav-button">

                    Create Account

                </a>

            </nav>

        </div>

    </header>



    <!-- =========================================================
         HERO
    ========================================================== -->

    <section class="hero">

        <!-- HERO IMAGE -->

        <img class="hero-image"
             src="https://images.unsplash.com/photo-1523240795612-9a054b0db644?auto=format&fit=crop&w=2200&q=85"
             alt="Students studying together" />


        <!-- OVERLAY -->

        <div class="hero-overlay"></div>


        <!-- DECORATION -->

        <div class="hero-glow"></div>

        <div class="hero-glow-two"></div>


        <!-- HERO CONTENT -->

        <div class="hero-content">

            <div class="hero-badge">

                🎓

                Your Academic Resource Hub

            </div>


            <h1 class="hero-title">

                Learn smarter.

                <br />

                <em>Study better.</em>

            </h1>


            <p class="hero-description">

                Discover notes, assignments, research papers,
                tutorials and academic resources — all organized
                in one beautiful place.

            </p>


            <!-- SEARCH -->

            <div class="hero-search">

                <label for="<%= txtSearch.ClientID %>"
                       style="position:absolute;left:-9999px;">

                    Search resources

                </label>


                <asp:TextBox
                    ID="txtSearch"
                    runat="server"
                    placeholder="Search notes, topics, subjects..."
                    aria-label="Search resources">
                </asp:TextBox>


                <asp:Button
                    ID="btnSearch"
                    runat="server"
                    Text="🔍 Search"
                    CssClass="hero-search-button"
                    OnClick="btnSearch_Click" />

            </div>


            <!-- STATS -->

            <div class="hero-stats">

                <div class="hero-stat">

                    <strong>120+</strong>

                    <span>Resources</span>

                </div>


                <div class="stat-divider"></div>


                <div class="hero-stat">

                    <strong>6</strong>

                    <span>Subjects</span>

                </div>


                <div class="stat-divider"></div>


                <div class="hero-stat">

                    <strong>250+</strong>

                    <span>Students</span>

                </div>


                <div class="stat-divider"></div>


                <div class="hero-stat">

                    <strong>4.9 ⭐</strong>

                    <span>Rating</span>

                </div>

            </div>

        </div>


        <!-- BOTTOM SHAPE -->

        <div class="hero-bottom"></div>

    </section>



    <!-- =========================================================
         CATEGORIES
    ========================================================== -->

    <section class="categories-section">

        <div class="container">

            <div class="section-label">
                Explore Subjects
            </div>

            <h2 class="section-title">
                Find what you're learning
            </h2>

            <p class="section-description">

                Jump straight into a subject and discover
                resources designed to help you understand,
                practice and succeed.

            </p>


            <div class="categories-grid">


                <!-- WEB DEV -->

                <a href="GuestHome.aspx?cat=webdev"
                   class="category-card category-webdev">

                    <div class="category-icon">
                        💻
                    </div>

                    <h3>
                        Web Development
                    </h3>

                    <p>
                        Code & Websites
                    </p>

                </a>


                <!-- DATABASE -->

                <a href="GuestHome.aspx?cat=databases"
                   class="category-card category-database">

                    <div class="category-icon">
                        🗄️
                    </div>

                    <h3>
                        Databases
                    </h3>

                    <p>
                        Data & SQL
                    </p>

                </a>


                <!-- NETWORKING -->

                <a href="GuestHome.aspx?cat=networking"
                   class="category-card category-network">

                    <div class="category-icon">
                        🌐
                    </div>

                    <h3>
                        Networking
                    </h3>

                    <p>
                        Networks & Systems
                    </p>

                </a>


                <!-- AI -->

                <a href="GuestHome.aspx?cat=ai"
                   class="category-card category-ai">

                    <div class="category-icon">
                        🤖
                    </div>

                    <h3>
                        Artificial Intelligence
                    </h3>

                    <p>
                        AI & Machine Learning
                    </p>

                </a>


                <!-- SECURITY -->

                <a href="GuestHome.aspx?cat=security"
                   class="category-card category-security">

                    <div class="category-icon">
                        🔐
                    </div>

                    <h3>
                        Cyber Security
                    </h3>

                    <p>
                        Security & Privacy
                    </p>

                </a>


                <!-- DESIGN -->

                <a href="GuestHome.aspx?cat=design"
                   class="category-card category-design">

                    <div class="category-icon">
                        🎨
                    </div>

                    <h3>
                        Design
                    </h3>

                    <p>
                        UI & UX
                    </p>

                </a>

            </div>

        </div>

    </section>



    <!-- =========================================================
         RESOURCE LIBRARY
    ========================================================== -->

    <section class="resources-section"
             id="resources">

        <div class="container">


            <div class="resources-header">

                <div class="section-label">
                    Study Library
                </div>

                <h2 class="section-title">

                    <asp:Literal
                        ID="litResultsTitle"
                        runat="server">
                    </asp:Literal>

                </h2>

                <p class="section-description">

                    <asp:Literal
                        ID="litResultsSubtitle"
                        runat="server">
                    </asp:Literal>

                </p>

            </div>


            <!-- RESOURCE GRID -->

            <div class="resource-grid">


                <asp:Repeater
                    ID="rptResources"
                    runat="server">


                    <ItemTemplate>


                        <div class="resource-card"
                             data-category='<%# Eval("Category") %>'>


                            <!-- CARD TOP -->

                            <div class="card-top">


                                <div class="icon-badge">

                                    <%# Eval("Icon") %>

                                </div>


                                <span class="format-chip">

                                    <%# Eval("Format") %>

                                </span>

                            </div>


                            <!-- TITLE -->

                            <h3>

                                <%# Eval("Title") %>

                            </h3>


                            <!-- DESCRIPTION -->

                            <p class="resource-description">

                                <%# Eval("Description") %>

                            </p>


                            <!-- TAG -->

                            <div class="tag-row">


                                <span class="category-tag">

                                    <%# Eval("CategoryLabel") %>

                                </span>


                                <span class="meta-text">

                                    <%# Eval("Meta") %>

                                </span>


                            </div>


                            <!-- LOCK -->

                            <a href="Register.aspx"
                               class="locked-btn">

                                🔒

                                Create an account to download

                            </a>


                        </div>


                    </ItemTemplate>


                </asp:Repeater>


                <!-- EMPTY -->

                <asp:Panel
                    ID="pnlNoResults"
                    runat="server"
                    CssClass="empty-state"
                    Visible="false">


                    <div class="empty-state-icon">
                        📚
                    </div>


                    <h3>
                        No resources found
                    </h3>


                    <p>
                        Try another search or browse one
                        of our categories.
                    </p>


                    <br />


                    <a href="GuestHome.aspx"
                       style="color:#4f46e5;font-weight:700;">

                        ← Back to Library

                    </a>

                </asp:Panel>


            </div>

        </div>

    </section>



    <!-- =========================================================
         ABOUT SECTION
    ========================================================== -->

    <section class="about-section"
             id="about">


        <div class="container">


            <!-- HEADER -->

            <div class="about-header">

                <div class="section-label">
                    About StudyVault
                </div>

                <h2 class="section-title">
                    Built for students who want to
                    <em>learn better.</em>
                </h2>

                <p class="section-description">

                    StudyVault brings the resources you need
                    together so you can spend less time searching
                    and more time learning.

                </p>

            </div>


            <!-- ABOUT GRID -->

            <div class="about-grid">


                <!-- IMAGE -->

                <div class="about-image-wrapper">


                    <img
                        class="about-image"
                        src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?auto=format&fit=crop&w=1200&q=85"
                        alt="Students learning together" />


                    <div class="about-image-card">

                        <div class="about-image-card-icon">
                            ⭐
                        </div>

                        <div>

                            <strong>
                                Loved by students
                            </strong>

                            <span>
                                Learn together. Grow together.
                            </span>

                        </div>

                    </div>

                </div>


                <!-- CONTENT -->

                <div class="about-content">


                    <div class="section-label">
                        Why StudyVault?
                    </div>


                    <h2>
                        Your study journey,
                        all in one place.
                    </h2>


                    <p>

                        Whether you're preparing for an exam,
                        working on an assignment, learning to code,
                        or exploring a completely new subject,
                        StudyVault gives you a simple place to
                        discover useful academic resources.

                    </p>


                    <div class="about-features">


                        <div class="about-feature">

                            <div class="about-feature-icon">
                                📚
                            </div>

                            <h3>
                                Organized Resources
                            </h3>

                            <p>
                                Find notes and learning materials
                                organized by subject.
                            </p>

                        </div>


                        <div class="about-feature">

                            <div class="about-feature-icon">
                                🔎
                            </div>

                            <h3>
                                Easy Search
                            </h3>

                            <p>
                                Search for topics and resources
                                without wasting time.
                            </p>

                        </div>


                        <div class="about-feature">

                            <div class="about-feature-icon">
                                📝
                            </div>

                            <h3>
                                Assignments
                            </h3>

                            <p>
                                Keep your academic work
                                organized in one place.
                            </p>

                        </div>


                        <div class="about-feature">

                            <div class="about-feature-icon">
                                🎥
                            </div>

                            <h3>
                                Video Tutorials
                            </h3>

                            <p>
                                Learn difficult concepts through
                                helpful tutorials.
                            </p>

                        </div>


                    </div>

                </div>

            </div>

        </div>

    </section>



    <!-- =========================================================
         CTA
    ========================================================== -->

    <section class="cta-section">

        <div class="container">

            <div class="cta-box">


                <h2>
                    Ready to study smarter?
                </h2>


                <p>

                    Create your free StudyVault account
                    and unlock the full learning experience.

                </p>


                <div class="cta-buttons">


                    <a href="Register.aspx"
                       class="cta-primary">

                        🚀 Create Free Account

                    </a>


                    <a href="Login.aspx"
                       class="cta-secondary">

                        Already have an account?

                    </a>


                </div>

            </div>

        </div>

    </section>



    <!-- =========================================================
         FOOTER
    ========================================================== -->

    <footer class="footer">


        <div class="container">


            <div class="footer-grid">


                <!-- BRAND -->

                <div class="footer-brand">

                    <h2>
                        📘 StudyVault
                    </h2>

                    <p>

                        Your smart academic companion.
                        Discover resources, learn new concepts
                        and make your study journey easier.

                    </p>

                </div>


                <!-- PLATFORM -->

                <div class="footer-column">

                    <h3>
                        Platform
                    </h3>

                    <a href="GuestHome.aspx">
                        Home
                    </a>

                    <a href="#about">
                        About
                    </a>

                    <a href="#resources">
                        Resources
                    </a>

                    <a href="Register.aspx">
                        Create Account
                    </a>

                </div>


                <!-- ACCOUNT -->

                <div class="footer-column">

                    <h3>
                        Account
                    </h3>

                    <a href="Login.aspx">
                        Log In
                    </a>

                    <a href="Register.aspx">
                        Register
                    </a>

                    <a href="#about">
                        About StudyVault
                    </a>

                </div>


            </div>


            <div class="footer-bottom">

                <span>
                    © 2026 StudyVault. All Rights Reserved.
                </span>

                <span>
                    Made for students ❤️
                </span>

            </div>

        </div>

    </footer>



</form>


<!-- =========================================================
     HEADER SCROLL SCRIPT
========================================================== -->

<script>

    (function () {

        var header =
            document.getElementById("siteHeader");


        function updateHeader() {

            if (window.scrollY > 40) {

                header.classList.add("scrolled");

            } else {

                header.classList.remove("scrolled");

            }

        }


        window.addEventListener(
            "scroll",
            updateHeader,
            { passive: true }
        );


        updateHeader();

    })();

</script>


</body>

</html>
