<%@ Page Title="Resources - Admin" 
    Language="C#" 
    AutoEventWireup="true" 
    CodeBehind="AdminResources.aspx.cs" 
    Inherits="STUDYVAULT.AdminResources" %> 
 
<!DOCTYPE html> 
 
<html lang="en"> 
 
<head runat="server"> 
 
    <meta charset="utf-8" /> 
 
    <meta name="viewport" 
          content="width=device-width, initial-scale=1" /> 
 
    <title>Resources | StudyVault</title> 
 
    <style> 
 
        /* ========================================================= 
           RESET 
        ========================================================= */ 
 
        * { 
            box-sizing: border-box; 
            margin: 0; 
            padding: 0; 
        } 
 
        :root { 
            --ink: #11162b; 
            --ink-2: #30374f; 
            --muted: #737b94; 
 
            --purple: #5146e5; 
            --purple-2: #6257ee; 
            --purple-soft: #efedff; 
 
            --page: #f7f7fc; 
            --white: #ffffff; 
 
            --border: #e6e7f0; 
 
            --green: #087f5b; 
            --green-soft: #eaf9f3; 
 
            --red: #dc2626; 
            --red-soft: #fff1f2; 
 
            --shadow: 
                0 20px 60px rgba(28, 25, 80, .08); 
        } 
 
 
        /* ========================================================= 
           BODY 
        ========================================================= */ 
 
        html, 
        body { 
            min-height: 100%; 
        } 
 
        body { 
            font-family: 
                "Segoe UI", 
                Inter, 
                system-ui, 
                -apple-system, 
                BlinkMacSystemFont, 
                sans-serif; 
 
            color: var(--ink); 
 
            background: 
                radial-gradient( 
                    circle at 15% 10%, 
                    rgba(99,102,241,.08), 
                    transparent 23% 
                ), 
                radial-gradient( 
                    circle at 92% 15%, 
                    rgba(124,58,237,.09), 
                    transparent 27% 
                ), 
                #f8f8fc; 
        } 
 
        a { 
            color: inherit; 
            text-decoration: none; 
        } 
 
        input, 
        textarea, 
        select, 
        button { 
            font-family: inherit; 
        } 
 
 
        /* ========================================================= 
           ADMIN NAVIGATION 
        ========================================================= */ 
 
        .top-nav { 
            width: 100%; 
            height: 94px; 
 
            background: #ffffff; 
 
            border-bottom: 1px solid #e9e9ef; 
 
            position: sticky; 
            top: 0; 
 
            z-index: 1000; 
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
           BRAND 
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
 
            transition: opacity .2s ease; 
        } 
 
 
        .brand span { 
            color: var(--purple); 
        } 
 
 
        .brand:hover { 
            opacity: .85; 
        } 
 
 
        /* ========================================================= 
           NAV LINKS 
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
 
            transition: 
                color .2s ease, 
                font-weight .2s ease; 
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
           ADMIN AREA 
        ========================================================= */ 
 
        .admin-area { 
            justify-self: end; 
 
            display: flex; 
 
            align-items: center; 
 
            gap: 10px; 
 
            white-space: nowrap; 
        } 
 
 
        .avatar { 
            width: 43px; 
            height: 43px; 
 
            border-radius: 50%; 
 
            background: var(--purple); 
 
            display: flex; 
 
            align-items: center; 
 
            justify-content: center; 
 
            color: #ffffff; 
 
            font-size: 14px; 
 
            font-weight: 800; 
 
            flex-shrink: 0; 
 
            box-shadow: 
                0 5px 14px rgba(81,70,229,.22); 
        } 
 
 
        .admin-name { 
            color: #25283a; 
 
            font-size: 14px; 
 
            font-weight: 600; 
 
            white-space: nowrap; 
        } 
 
 
        /* ========================================================= 
           LOGOUT BUTTON 
        ========================================================= */ 
 
        .logout-btn { 
            margin-left: 8px; 
 
            display: inline-flex; 
 
            align-items: center; 
 
            justify-content: center; 
 
            gap: 7px; 
 
            min-width: 88px; 
 
            height: 39px; 
 
            padding: 0 14px; 
 
            border: 1px solid #e3e1f7; 
 
            border-radius: 9px; 
 
            background: #fafaff; 
 
            color: var(--purple); 
 
            font-size: 12px; 
 
            font-weight: 700; 
 
            cursor: pointer; 
 
            outline: none; 
 
            box-shadow: 
                0 2px 6px rgba(81,70,229,.04); 
 
            transition: 
                background .25s ease, 
                color .25s ease, 
                border-color .25s ease, 
                box-shadow .25s ease, 
                transform .25s ease; 
        } 
 
 
        .logout-btn::before { 
            content: "↪"; 
 
            display: inline-flex; 
 
            align-items: center; 
 
            justify-content: center; 
 
            font-size: 16px; 
 
            font-weight: 700; 
 
            transform: rotate(180deg); 
 
            transition: transform .25s ease; 
        } 
 
 
        .logout-btn:hover { 
            background: var(--purple); 
 
            color: #ffffff; 
 
            border-color: var(--purple); 
 
            box-shadow: 
                0 7px 18px rgba(81,70,229,.22); 
 
            transform: translateY(-2px); 
        } 
 
 
        .logout-btn:hover::before { 
            transform: 
                rotate(180deg) 
                translateX(3px); 
        } 
 
 
        .logout-btn:active { 
            transform: translateY(0); 
        } 
 
 
        .logout-btn:focus-visible { 
            outline: 3px solid rgba(81,70,229,.18); 
 
            outline-offset: 3px; 
        } 
 
 
        /* ========================================================= 
           PAGE 
        ========================================================= */ 
 
        .page { 
            width: min(1370px, calc(100% - 90px)); 
 
            margin: auto; 
 
            padding: 66px 0 100px; 
        } 
 
 
        /* ========================================================= 
           INTRO 
        ========================================================= */ 
 
        .intro { 
            display: grid; 
 
            grid-template-columns: 1fr 370px; 
 
            gap: 70px; 
 
            align-items: end; 
 
            margin-bottom: 52px; 
        } 
 
 
        .intro-left { 
            max-width: 800px; 
        } 
 
 
        .eyebrow { 
            display: inline-flex; 
 
            align-items: center; 
 
            gap: 9px; 
 
            color: var(--purple); 
 
            font-size: 11px; 
 
            font-weight: 800; 
 
            letter-spacing: 1.4px; 
 
            text-transform: uppercase; 
 
            margin-bottom: 18px; 
        } 
 
 
        .eyebrow::before { 
            content: ""; 
 
            width: 28px; 
            height: 2px; 
 
            background: var(--purple); 
 
            border-radius: 99px; 
        } 
 
 
        .intro h1 { 
            font-family: 
                Georgia, 
                "Times New Roman", 
                serif; 
 
            font-size: clamp(54px, 6vw, 78px); 
 
            line-height: .94; 
 
            letter-spacing: -3.5px; 
 
            color: #11162b; 
        } 
 
 
        .intro-description { 
            margin-top: 22px; 
 
            max-width: 650px; 
 
            color: var(--muted); 
 
            font-size: 15px; 
 
            line-height: 1.75; 
        } 
 
 
        /* ========================================================= 
           RIGHT INTRO 
        ========================================================= */ 
 
        .intro-note { 
            border-left: 2px solid var(--purple); 
 
            padding-left: 22px; 
 
            margin-bottom: 5px; 
        } 
 
 
        .intro-note strong { 
            display: block; 
 
            color: #22283f; 
 
            font-size: 14px; 
 
            margin-bottom: 7px; 
        } 
 
 
        .intro-note p { 
            color: #81889d; 
 
            font-size: 12px; 
 
            line-height: 1.7; 
        } 
 
 
        /* ========================================================= 
           SUCCESS MESSAGE 
        ========================================================= */ 
 
        .confirmation { 
            display: flex; 
 
            align-items: center; 
 
            gap: 12px; 
 
            padding: 13px 16px; 
 
            margin-bottom: 25px; 
 
            border-radius: 12px; 
 
            color: var(--green); 
 
            background: var(--green-soft); 
 
            border: 1px solid #c9eddf; 
        } 
 
 
        .confirmation .check { 
            width: 28px; 
            height: 28px; 
 
            border-radius: 50%; 
 
            display: flex; 
 
            align-items: center; 
            justify-content: center; 
 
            background: #10b981; 
 
            color: white; 
 
            font-weight: 900; 
        } 
 
 
        .confirmation h3 { 
            font-size: 13px; 
        } 
 
 
        /* ========================================================= 
           ERROR 
        ========================================================= */ 
 
        .error-box { 
            padding: 13px 16px; 
 
            margin-bottom: 25px; 
 
            border-radius: 12px; 
 
            color: var(--red); 
 
            background: var(--red-soft); 
 
            border: 1px solid #fecdd3; 
 
            font-size: 13px; 
 
            font-weight: 600; 
        } 
 
 
        /* ========================================================= 
           CREATE RESOURCE 
        ========================================================= */ 
 
        .create-layout { 
            display: grid; 
 
            grid-template-columns: 250px 1fr; 
 
            min-height: 390px; 
 
            background: white; 
 
            border: 1px solid var(--border); 
 
            border-radius: 24px; 
 
            overflow: hidden; 
 
            box-shadow: var(--shadow); 
 
            margin-bottom: 64px; 
        } 
 
 
        .create-rail { 
            padding: 34px 28px; 
 
            color: white; 
 
            background: 
                linear-gradient( 
                    145deg, 
                    #171936 0%, 
                    #24204e 55%, 
                    #3d35a5 100% 
                ); 
 
            position: relative; 
 
            overflow: hidden; 
        } 
 
 
        .create-rail::before { 
            content: ""; 
 
            position: absolute; 
 
            width: 180px; 
            height: 180px; 
 
            border-radius: 50%; 
 
            background: rgba(255,255,255,.06); 
 
            top: -80px; 
            right: -75px; 
        } 
 
 
        .create-rail::after { 
            content: ""; 
 
            position: absolute; 
 
            width: 130px; 
            height: 130px; 
 
            border-radius: 50%; 
 
            border: 1px solid rgba(255,255,255,.10); 
 
            bottom: -60px; 
            left: -55px; 
        } 
 
 
        .rail-number { 
            position: relative; 
 
            z-index: 1; 
 
            color: #a9a4ff; 
 
            font-size: 11px; 
 
            font-weight: 800; 
 
            letter-spacing: 1.5px; 
        } 
 
 
        .create-rail h2 { 
            position: relative; 
 
            z-index: 1; 
 
            margin-top: 65px; 
 
            font-family: 
                Georgia, 
                "Times New Roman", 
                serif; 
 
            font-size: 34px; 
 
            line-height: 1.05; 
 
            letter-spacing: -1px; 
        } 
 
 
        .create-rail p { 
            position: relative; 
 
            z-index: 1; 
 
            margin-top: 16px; 
 
            color: rgba(255,255,255,.63); 
 
            font-size: 12px; 
 
            line-height: 1.7; 
        } 
 
 
        /* ========================================================= 
           CREATE FORM 
        ========================================================= */ 
 
        .create-form { 
            padding: 34px 38px; 
 
            display: grid; 
 
            grid-template-columns: 
                1.1fr 
                .9fr; 
 
            gap: 21px 25px; 
 
            align-content: start; 
        } 
 
 
        .field { 
            display: flex; 
 
            flex-direction: column; 
 
            gap: 8px; 
        } 
 
 
        .field.full { 
            grid-column: 1 / -1; 
        } 
 
 
        .field label { 
            color: #4b5268; 
 
            font-size: 11px; 
 
            font-weight: 800; 
 
            text-transform: uppercase; 
 
            letter-spacing: .65px; 
        } 
 
 
        .required { 
            color: #ef4444; 
        } 
 
 
        .field input[type="text"], 
        .field textarea, 
        .field select { 
            width: 100%; 
 
            border: 1px solid #e1e3ec; 
 
            background: #fbfbfd; 
 
            color: #20263c; 
 
            outline: none; 
 
            border-radius: 11px; 
 
            transition: 
                border-color .2s ease, 
                background .2s ease, 
                box-shadow .2s ease; 
        } 
 
 
        .field input[type="text"] { 
            height: 46px; 
 
            padding: 0 13px; 
 
            font-size: 13px; 
        } 
 
 
        .field textarea { 
            min-height: 88px; 
 
            resize: vertical; 
 
            padding: 12px 13px; 
 
            font-size: 13px; 
 
            line-height: 1.55; 
        } 
 
 
        .field select { 
            height: 46px; 
 
            padding: 0 12px; 
 
            font-size: 13px; 
        } 
 
 
        .field input:focus, 
        .field textarea:focus, 
        .field select:focus { 
            background: white; 
 
            border-color: var(--purple); 
 
            box-shadow: 
                0 0 0 4px rgba(81,70,229,.08); 
        } 
 
 
        /* ========================================================= 
           FILE INPUT 
        ========================================================= */ 
 
        .file-input { 
            height: 46px; 
 
            padding: 4px 8px 4px 11px; 
 
            display: flex; 
 
            align-items: center; 
 
            border: 1px dashed #cfd1df; 
 
            border-radius: 11px; 
 
            background: #fbfbfd; 
        } 
 
 
        .file-input input { 
            width: 100%; 
 
            font-size: 12px; 
 
            color: #777e91; 
        } 
 
 
        .file-input input::file-selector-button { 
            border: 0; 
 
            border-radius: 8px; 
 
            background: var(--purple-soft); 
 
            color: var(--purple); 
 
            padding: 8px 12px; 
 
            margin-right: 9px; 
 
            font-size: 11px; 
 
            font-weight: 800; 
 
            cursor: pointer; 
        } 
 
 
        /* ========================================================= 
           PUBLISH BUTTON 
        ========================================================= */ 
 
        .create-action { 
            grid-column: 1 / -1; 
 
            display: flex; 
 
            justify-content: flex-end; 
 
            margin-top: 3px; 
        } 
 
 
        .add-button { 
            height: 45px; 
 
            padding: 0 25px; 
 
            border: 0; 
 
            border-radius: 10px; 
 
            color: white; 
 
            background: 
                linear-gradient( 
                    135deg, 
                    #5a50eb, 
                    #4438cf 
                ); 
 
            font-size: 12px; 
 
            font-weight: 800; 
 
            cursor: pointer; 
 
            box-shadow: 
                0 9px 22px rgba(81,70,229,.22); 
 
            transition: 
                transform .2s ease, 
                box-shadow .2s ease; 
        } 
 
 
        .add-button:hover { 
            transform: translateY(-2px); 
 
            box-shadow: 
                0 13px 27px rgba(81,70,229,.28); 
        } 
 
 
        /* ========================================================= 
           RESOURCE TITLE 
        ========================================================= */ 
 
        .resources-title { 
            display: flex; 
 
            justify-content: space-between; 
 
            align-items: end; 
 
            margin-bottom: 22px; 
        } 
 
 
        .resources-title h2 { 
            font-family: 
                Georgia, 
                "Times New Roman", 
                serif; 
 
            font-size: 36px; 
 
            letter-spacing: -1.2px; 
        } 
 
 
        .resources-title p { 
            color: #858ca0; 
 
            font-size: 12px; 
        } 
 
 
        /* ========================================================= 
           RESOURCE BOARD 
        ========================================================= */ 
 
        .resource-board { 
            background: white; 
 
            border-top: 3px solid var(--purple); 
 
            border-left: 1px solid var(--border); 
 
            border-right: 1px solid var(--border); 
 
            border-bottom: 1px solid var(--border); 
 
            border-radius: 20px; 
 
            overflow: hidden; 
 
            box-shadow: 
                0 16px 45px rgba(28,25,80,.06); 
        } 
 
 
        .resource-head, 
        .resource-row { 
            display: grid; 
 
            grid-template-columns: 
                1.15fr 
                1.35fr 
                .75fr 
                235px; 
 
            gap: 22px; 
 
            align-items: center; 
        } 
 
 
        .resource-head { 
            padding: 15px 23px; 
 
            background: #fafaff; 
 
            border-bottom: 1px solid var(--border); 
 
            color: #8a91a5; 
 
            font-size: 10px; 
 
            font-weight: 800; 
 
            text-transform: uppercase; 
 
            letter-spacing: .8px; 
        } 
 
 
        .resource-row { 
            padding: 19px 23px; 
 
            border-bottom: 1px solid #eeeff5; 
 
            transition: 
                background .18s ease; 
        } 
 
 
        .resource-row:last-child { 
            border-bottom: 0; 
        } 
 
 
        .resource-row:hover { 
            background: #fcfcff; 
        } 
 
 
        /* ========================================================= 
           EDIT FIELDS 
        ========================================================= */ 
 
        .edit-field input, 
        .edit-field textarea, 
        .edit-field select { 
            width: 100%; 
 
            border: 1px solid #e2e4ed; 
 
            background: white; 
 
            border-radius: 9px; 
 
            color: #272d43; 
 
            outline: none; 
        } 
 
 
        .edit-field input { 
            height: 40px; 
 
            padding: 0 11px; 
 
            font-size: 12px; 
 
            font-weight: 600; 
        } 
 
 
        .edit-field textarea { 
            min-height: 60px; 
 
            padding: 9px 11px; 
 
            resize: vertical; 
 
            font-size: 11px; 
 
            line-height: 1.5; 
        } 
 
 
        .edit-field select { 
            height: 40px; 
 
            padding: 0 9px; 
 
            font-size: 11px; 
        } 
 
 
        .edit-field input:focus, 
        .edit-field textarea:focus, 
        .edit-field select:focus { 
            border-color: var(--purple); 
 
            box-shadow: 
                0 0 0 3px rgba(81,70,229,.07); 
        } 
 
 
        /* ========================================================= 
           FILE LINK 
        ========================================================= */ 
 
        .file-link { 
            display: inline-flex; 
 
            align-items: center; 
 
            gap: 7px; 
 
            margin-top: 8px; 
 
            color: var(--purple); 
 
            font-size: 11px; 
 
            font-weight: 750; 
 
            max-width: 150px; 
 
            overflow: hidden; 
 
            text-overflow: ellipsis; 
 
            white-space: nowrap; 
        } 
 
 
        .file-link::before { 
            content: "↗"; 
 
            width: 21px; 
            height: 21px; 
 
            flex-shrink: 0; 
 
            display: flex; 
 
            align-items: center; 
            justify-content: center; 
 
            border-radius: 6px; 
 
            background: var(--purple-soft); 
 
            font-size: 11px; 
        } 
 
 
        .file-link:hover { 
            text-decoration: underline; 
        } 
 
 
        /* ========================================================= 
           ACTION BUTTONS 
        ========================================================= */ 
 
        .resource-actions { 
            display: flex; 
 
            justify-content: flex-end; 
 
            align-items: center; 
 
            gap: 9px; 
        } 
 
 
        .btn-small { 
            position: relative; 
 
            height: 40px; 
 
            padding: 0 15px; 
 
            display: inline-flex; 
 
            align-items: center; 
 
            justify-content: center; 
 
            gap: 7px; 
 
            border-radius: 11px; 
 
            font-size: 11px; 
 
            font-weight: 800; 
 
            letter-spacing: .15px; 
 
            cursor: pointer; 
 
            white-space: nowrap; 
 
            transition: 
                transform .2s ease, 
                box-shadow .2s ease, 
                background .2s ease, 
                border-color .2s ease; 
        } 
 
 
        /* SAVE */ 
 
        .btn-small.save { 
            border: 1px solid #5b50ed; 
 
            color: #ffffff; 
 
            background: 
                linear-gradient( 
                    135deg, 
                    #655bf0 0%, 
                    #4c40d8 100% 
                ); 
 
            box-shadow: 
                0 7px 18px rgba(81,70,229,.20); 
        } 
 
 
        .btn-small.save::before { 
            content: "✓"; 
 
            width: 18px; 
            height: 18px; 
 
            display: flex; 
 
            align-items: center; 
            justify-content: center; 
 
            border-radius: 50%; 
 
            background: rgba(255,255,255,.16); 
 
            font-size: 10px; 
 
            font-weight: 900; 
        } 
 
 
        .btn-small.save:hover { 
            transform: translateY(-2px); 
 
            background: 
                linear-gradient( 
                    135deg, 
                    #7066f5, 
                    #5145df 
                ); 
 
            box-shadow: 
                0 11px 25px rgba(81,70,229,.30); 
        } 
 
 
        .btn-small.save:active { 
            transform: translateY(0); 
        } 
 
 
        /* DELETE */ 
 
        .btn-small.danger { 
            border: 1px solid #eadcdf; 
 
            color: #b42332; 
 
            background: #fffafa; 
 
            box-shadow: 
                0 4px 12px rgba(120,40,55,.04); 
        } 
 
 
        .btn-small.danger::before { 
            content: "×"; 
 
            width: 18px; 
            height: 18px; 
 
            display: flex; 
 
            align-items: center; 
            justify-content: center; 
 
            border-radius: 50%; 
 
            background: #fff0f2; 
 
            color: #d52d3e; 
 
            font-size: 14px; 
 
            font-weight: 700; 
 
            line-height: 1; 
        } 
 
 
        .btn-small.danger:hover { 
            transform: translateY(-2px); 
 
            border-color: #f2b8c0; 
 
            background: #fff3f4; 
 
            color: #c51f31; 
 
            box-shadow: 
                0 9px 20px rgba(185,28,48,.10); 
        } 
 
 
        .btn-small.danger:active { 
            transform: translateY(0); 
        } 
 
 
        /* ========================================================= 
           EMPTY 
        ========================================================= */ 
 
        .empty-state { 
            padding: 65px 20px; 
 
            text-align: center; 
 
            color: #9299ac; 
 
            font-size: 13px; 
        } 
 
 
        /* ========================================================= 
           RESPONSIVE 
        ========================================================= */ 
 
        @media (max-width: 1200px) { 
 
            .nav-inner { 
                padding: 0 4%; 
            } 
 
 
            .nav-links { 
                gap: 22px; 
            } 
 
 
            .brand { 
                font-size: 24px; 
            } 
 
 
            .page { 
                width: calc(100% - 50px); 
            } 
 
 
            .intro { 
                grid-template-columns: 1fr 280px; 
 
                gap: 35px; 
            } 
 
 
            .resource-head, 
            .resource-row { 
                grid-template-columns: 
                    1fr 
                    1fr; 
            } 
 
 
            .resource-head { 
                display: none; 
            } 
 
 
            .resource-actions { 
                justify-content: flex-start; 
            } 
        } 
 
 
        @media (max-width: 1050px) { 
 
            .nav-links { 
                gap: 16px; 
            } 
 
 
            .nav-links a { 
                font-size: 13px; 
            } 
 
 
            .admin-name { 
                display: none; 
            } 
 
 
            .logout-btn { 
                margin-left: 4px; 
            } 
        } 
 
 
        @media (max-width: 850px) { 
 
            .top-nav { 
                height: auto; 
 
                padding: 17px 22px; 
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
 
 
            .admin-area { 
                margin-left: auto; 
            } 
 
 
            .admin-name { 
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
                width: calc(100% - 30px); 
 
                padding-top: 45px; 
            } 
 
 
            .intro { 
                grid-template-columns: 1fr; 
            } 
 
 
            .intro-note { 
                display: none; 
            } 
 
 
            .create-layout { 
                grid-template-columns: 1fr; 
            } 
 
 
            .create-rail { 
                min-height: 180px; 
            } 
 
 
            .create-rail h2 { 
                margin-top: 30px; 
            } 
 
 
            .create-form { 
                grid-template-columns: 1fr; 
            } 
 
 
            .field.full, 
            .create-action { 
                grid-column: auto; 
            } 
        } 
 
 
        @media (max-width: 550px) { 
 
            .brand { 
                font-size: 22px; 
            } 
 
 
            .page { 
                width: calc(100% - 22px); 
            } 
 
 
            .intro h1 { 
                font-size: 50px; 
 
                letter-spacing: -2px; 
            } 
 
 
            .create-form { 
                padding: 25px 20px; 
            } 
 
 
            .create-rail { 
                padding: 27px 22px; 
            } 
 
 
            .resources-title { 
                align-items: flex-start; 
 
                flex-direction: column; 
 
                gap: 5px; 
            } 
 
 
            .resource-row { 
                padding: 18px; 
            } 
 
 
            .resource-actions { 
                justify-content: flex-start; 
 
                flex-wrap: wrap; 
            } 
 
 
            .btn-small { 
                height: 38px; 
            } 
 
 
            .logout-btn { 
                min-width: 40px; 
 
                width: 40px; 
 
                padding: 0; 
            } 
 
 
            .logout-btn { 
                font-size: 0; 
            } 
 
 
            .logout-btn::before { 
                font-size: 16px; 
            } 
        } 
 
    </style> 
 
</head> 
 
 
<body> 
 
<form id="form1" runat="server"> 
 
 
    <!-- ========================================================= 
         NAVIGATION 
    ========================================================= --> 
 
    <nav class="top-nav"> 
 
        <div class="nav-inner"> 
 
 
            <!-- BRAND --> 
 
            <a 
                href="AdminDashboard.aspx" 
                class="brand"> 
 
                STUDYVAULT<span>.</span> 
 
            </a> 
 
 
            <!-- NAVIGATION --> 
 
            <div class="nav-links"> 
 
                <a href="AdminDashboard.aspx"> 
                    Overview 
                </a> 
 
 
                <a href="Users.aspx"> 
                    Users 
                </a> 
 
 
                <a 
                    href="AdminResources.aspx" 
                    class="active"> 
 
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
 
            </div> 
 
 
            <!-- ADMIN AREA --> 
 
            <div class="admin-area"> 
 
                <div class="avatar"> 
 
                    <asp:Label 
                        ID="lblAvatar" 
                        runat="server" 
                        Text="A" /> 
 
                </div> 
 
 
                <asp:Label 
                    ID="lblAdminName" 
                    runat="server" 
                    CssClass="admin-name" 
                    Text="Samanta Shrestha" /> 
 
            </div> 
 
 
        </div> 
 
    </nav> 
 
 
    <!-- ========================================================= 
         MAIN PAGE 
    ========================================================= --> 
 
    <main class="page"> 
 
 
        <!-- ===================================================== 
             INTRO 
        ====================================================== --> 
 
        <section class="intro"> 
 
            <div class="intro-left"> 
 
                <div class="eyebrow"> 
                    StudyVault Administration 
                </div> 
 
                <h1> 
                    Resource<br /> 
                    Library 
                </h1> 
 
                <p class="intro-description"> 
 
                    Curate the material your students need. 
                    Add notes, documents and learning resources 
                    and keep everything organized in one place. 
 
                </p> 
 
            </div> 
 
 
            <div class="intro-note"> 
 
                <strong> 
                    Keep it useful. 
                </strong> 
 
                <p> 
 
                    Well-organized resources make it easier 
                    for students to find the right material 
                    at the right time. 
 
                </p> 
 
            </div> 
 
        </section> 
 
 
        <!-- ===================================================== 
             SUCCESS 
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
             ERROR 
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
             CREATE RESOURCE 
        ====================================================== --> 
 
        <section class="create-layout"> 
 
 
            <aside class="create-rail"> 
 
                <div class="rail-number"> 
                    01 / NEW RESOURCE 
                </div> 
 
                <h2> 
                    Add something 
                    worth learning. 
                </h2> 
 
                <p> 
 
                    Give students useful material they 
                    can return to whenever they need it. 
 
                </p> 
 
            </aside> 
 
 
            <div class="create-form"> 
 
 
                <!-- TITLE --> 
 
                <div class="field"> 
 
                    <label> 
 
                        Resource Title 
 
                        <span class="required"> 
                            * 
                        </span> 
 
                    </label> 
 
                    <asp:TextBox 
                        ID="txtTitle" 
                        runat="server" 
                        placeholder="e.g. Database Management Notes" /> 
 
                </div> 
 
 
                <!-- CATEGORY --> 
 
                <div class="field"> 
 
                    <label> 
                        Category 
                    </label> 
 
                    <asp:DropDownList 
                        ID="ddlCategory" 
                        runat="server"> 
 
                        <asp:ListItem 
                            Value="" 
                            Text="Select category" /> 
 
                    </asp:DropDownList> 
 
                </div> 
 
 
                <!-- DESCRIPTION --> 
 
                <div class="field full"> 
 
                    <label> 
                        Description 
                    </label> 
 
                    <asp:TextBox 
                        ID="txtDescription" 
                        runat="server" 
                        TextMode="MultiLine" 
                        placeholder="Write a short description of this resource..." /> 
 
                </div> 
 
 
                <!-- FILE --> 
 
                <div class="field"> 
 
                    <label> 
                        Resource File 
                    </label> 
 
                    <div class="file-input"> 
 
                        <asp:FileUpload 
                            ID="fileUpload" 
                            runat="server" /> 
 
                    </div> 
 
                </div> 
 
 
                <!-- PUBLISH --> 
 
                <div class="create-action"> 
 
                    <asp:Button 
                        ID="btnAdd" 
                        runat="server" 
                        Text="Publish Resource" 
                        CssClass="add-button" 
                        OnClick="btnAdd_Click" /> 
 
                </div> 
 
            </div> 
 
        </section> 
 
 
        <!-- ===================================================== 
             RESOURCE LIST HEADER 
        ====================================================== --> 
 
        <div class="resources-title"> 
 
            <div> 
 
                <h2> 
                    Published Resources 
                </h2> 
 
            </div> 
 
            <p> 
                Edit or remove existing material 
            </p> 
 
        </div> 
 
 
        <!-- ===================================================== 
             RESOURCE BOARD 
        ====================================================== --> 
 
        <section class="resource-board"> 
 
 
            <div class="resource-head"> 
 
                <div> 
                    Resource 
                </div> 
 
                <div> 
                    Description 
                </div> 
 
                <div> 
                    Category / File 
                </div> 
 
                <div style="text-align:right;"> 
                    Actions 
                </div> 
 
            </div> 
 
 
            <asp:Repeater 
                ID="rptResources" 
                runat="server" 
                OnItemCommand="rptResources_ItemCommand"> 
 
                <ItemTemplate> 
 
                    <div class="resource-row"> 
 
 
                        <!-- RESOURCE TITLE --> 
 
                        <div class="edit-field"> 
 
                            <asp:TextBox 
                                ID="txtEditTitle" 
                                runat="server" 
                                Text='<%# Eval("Title") %>' /> 
 
                        </div> 
 
 
                        <!-- DESCRIPTION --> 
 
                        <div class="edit-field"> 
 
                            <asp:TextBox 
                                ID="txtEditDescription" 
                                runat="server" 
                                TextMode="MultiLine" 
                                Text='<%# Eval("Description") %>' /> 
 
                        </div> 
 
 
                        <!-- CATEGORY / FILE --> 
 
                        <div class="edit-field"> 
 
                            <asp:DropDownList 
                                ID="ddlEditCategory" 
                                runat="server"> 
 
                                <asp:ListItem 
                                    Value="" 
                                    Text="No category" /> 
 
                            </asp:DropDownList> 
 
 
                            <asp:HyperLink 
                                ID="lnkFile" 
                                runat="server" 
                                CssClass="file-link" 
                                NavigateUrl='<%# Eval("FilePath") %>' 
                                Target="_blank" 
                                Text="Open resource file" /> 
 
                        </div> 
 
 
                        <!-- ACTIONS --> 
 
                        <div class="resource-actions"> 
 
 
                            <!-- SAVE --> 
 
                            <asp:LinkButton 
                                ID="btnSave" 
                                runat="server" 
                                CssClass="btn-small save" 
                                CommandName="Save" 
                                CommandArgument='<%# Eval("ResourceID") %>'> 
 
                                Save Changes 
 
                            </asp:LinkButton> 
 
 
                            <!-- DELETE --> 
 
                            <asp:LinkButton 
                                ID="btnDelete" 
                                runat="server" 
                                CssClass="btn-small danger" 
                                CommandName="Delete" 
                                CommandArgument='<%# Eval("ResourceID") %>' 
                                OnClientClick='return confirm("Are you sure you want to permanently delete this resource? This cannot be undone.");'> 
 
                                Delete 
 
                            </asp:LinkButton> 
 
 
                        </div> 
 
                    </div> 
 
                </ItemTemplate> 
 
            </asp:Repeater> 
 
 
            <!-- NO RESOURCES --> 
 
            <asp:Panel 
                ID="pnlNoResources" 
                runat="server" 
                CssClass="empty-state" 
                Visible="false"> 
 
                No resources have been added yet. 
 
            </asp:Panel> 
 
 
        </section> 
 
 
    </main> 
 
</form> 
 
</body> 
 
</html>