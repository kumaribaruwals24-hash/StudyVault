<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="AdminCategories.aspx.cs"
    Inherits="STUDYVAULT.AdminCategories" %>

<!DOCTYPE html>

<html lang="en">
<head runat="server">

    <meta charset="utf-8" />

    <meta name="viewport"
          content="width=device-width, initial-scale=1" />

    <title>Manage Categories - StudyVault</title>

    <style>
* {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
}

html {
    scroll-behavior: smooth;
}

body {
    font-family: "Segoe UI", Arial, sans-serif;
    background: #f7f7fb;
    color: #171827;
    line-height: 1.5;
}

a {
    text-decoration: none;
    color: inherit;
}

button,
input,
textarea,
select {
    font-family: inherit;
}

/* =========================================================
   NAVIGATION
========================================================= */

.top-nav {
    height: 106px;
    width: 100%;
    background: #ffffff;
    border-bottom: 1px solid #e8e8ef;
    display: flex;
    align-items: center;
    position: sticky;
    top: 0;
    z-index: 1000;
}

.nav-inner {
    width: 100%;
    max-width: 1500px;
    margin: 0 auto;
    padding: 0 5.5%;

    display: grid;
    grid-template-columns: 1fr auto 1fr;
    align-items: center;
}

/* Logo */

.logo {
    justify-self: start;

    font-family: Georgia, "Times New Roman", serif;
    font-size: 27px;
    font-weight: 700;
    letter-spacing: -0.7px;

    color: #15152b;
}

.logo-dot {
    color: #5146e5;
}

/* Navigation links */

.nav-links {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 30px;
    height: 106px;
}

.nav-links a {
    position: relative;

    height: 106px;

    display: flex;
    align-items: center;

    color: #555a6b;
    font-size: 14px;
    font-weight: 500;

    white-space: nowrap;

    transition:
        color 0.2s ease,
        transform 0.2s ease;
}

.nav-links a:hover {
    color: #5146e5;
    transform: translateY(-1px);
}

.nav-links a.active {
    color: #5146e5;
    font-weight: 700;
}

.nav-links a.active::after {
    content: "";

    position: absolute;
    left: 0;
    right: 0;
    bottom: 27px;

    height: 2px;

    background: #5146e5;
    border-radius: 10px;
}

/* Admin */

.admin-area {
    justify-self: end;

    display: flex;
    align-items: center;
    gap: 12px;
}

.avatar {
    width: 44px;
    height: 44px;

    border-radius: 50%;

    background: #5146e5;
    color: #ffffff;

    display: flex;
    align-items: center;
    justify-content: center;

    font-size: 14px;
    font-weight: 700;

    box-shadow: 0 6px 18px rgba(81, 70, 229, 0.22);
}

.admin-name {
    color: #292c3b;
    font-size: 14px;
    font-weight: 650;
}

/* =========================================================
   MAIN CONTENT
========================================================= */

.main {
    width: 100%;
    max-width: 1500px;
    margin: 0 auto;

    padding: 70px 5.5% 80px;
}

/* =========================================================
   PAGE HEADER
========================================================= */

.page-header {
    display: flex;
    justify-content: space-between;
    align-items: flex-end;

    gap: 30px;

    margin-bottom: 42px;
}

.page-header h1 {
    color: #171827;

    font-family: Georgia, "Times New Roman", serif;

    font-size: clamp(42px, 4vw, 58px);
    line-height: 1.05;

    font-weight: 700;

    letter-spacing: -2px;

    margin-bottom: 18px;
}

.page-header p {
    color: #7b8194;

    font-size: 16px;
    font-weight: 400;

    max-width: 650px;
}

/* Purple small label if added */

.page-header::before {
    display: none;
}

/* =========================================================
   PRIMARY BUTTON
========================================================= */

.btn-primary {
    border: none;

    min-width: 150px;

    padding: 14px 22px;

    border-radius: 11px;

    background: #5146e5;
    color: #ffffff;

    font-size: 14px;
    font-weight: 700;

    cursor: pointer;

    box-shadow: 0 8px 18px rgba(81, 70, 229, 0.16);

    transition:
        background 0.2s ease,
        transform 0.2s ease,
        box-shadow 0.2s ease;
}

.btn-primary:hover {
    background: #4439d2;

    transform: translateY(-2px);

    box-shadow: 0 12px 25px rgba(81, 70, 229, 0.22);
}

/* =========================================================
   ALERTS
========================================================= */

.message {
    padding: 15px 18px;

    border-radius: 12px;

    margin-bottom: 22px;

    font-size: 14px;
    font-weight: 600;

    border: 1px solid transparent;
}

.message.success {
    background: #eaf9f3;
    color: #087f5b;
    border-color: #ccefe1;
}

.message.error {
    background: #fff1f0;
    color: #d92d20;
    border-color: #ffd8d5;
}

/* =========================================================
   STAT CARDS
========================================================= */

.stats {
    display: grid;

    grid-template-columns: repeat(3, 1fr);

    gap: 22px;

    margin-bottom: 30px;
}

.stat-card {
    position: relative;

    background: #ffffff;

    border: 1px solid #e9e9f0;

    border-radius: 17px;

    padding: 25px 27px;

    box-shadow:
        0 8px 25px rgba(23, 24, 39, 0.045);

    transition:
        transform 0.2s ease,
        box-shadow 0.2s ease;
}

.stat-card:hover {
    transform: translateY(-3px);

    box-shadow:
        0 14px 30px rgba(23, 24, 39, 0.075);
}

.stat-label {
    color: #85899a;

    font-size: 13px;
    font-weight: 600;

    margin-bottom: 9px;
}

.stat-value {
    color: #171827;

    font-size: 32px;
    font-weight: 800;

    letter-spacing: -0.8px;
}

/* =========================================================
   CONTENT GRID
========================================================= */

.content-grid {
    display: grid;

    grid-template-columns: 370px minmax(0, 1fr);

    gap: 25px;

    align-items: start;
}

/* =========================================================
   PANELS
========================================================= */

.panel {
    background: #ffffff;

    border: 1px solid #e9e9f0;

    border-radius: 19px;

    padding: 27px;

    box-shadow:
        0 8px 28px rgba(23, 24, 39, 0.055);

    overflow: hidden;
}

.panel-title {
    display: block;

    color: #171827;

    font-size: 20px;
    font-weight: 800;

    margin-bottom: 24px;

    letter-spacing: -0.3px;
}

/* =========================================================
   FORM
========================================================= */

.form-group {
    margin-bottom: 18px;
}

.form-group label {
    display: block;

    color: #45495a;

    font-size: 13px;
    font-weight: 700;

    margin-bottom: 8px;
}

.form-control {
    width: 100%;

    min-height: 45px;

    border: 1px solid #e1e2ea;

    border-radius: 10px;

    padding: 11px 13px;

    background: #ffffff;
    color: #171827;

    font-size: 14px;

    outline: none;

    transition:
        border-color 0.2s ease,
        box-shadow 0.2s ease,
        background 0.2s ease;
}

.form-control::placeholder {
    color: #a0a5b5;
}

.form-control:hover {
    border-color: #cfd1dc;
}

.form-control:focus {
    border-color: #5146e5;

    box-shadow:
        0 0 0 3px rgba(81, 70, 229, 0.10);
}

textarea.form-control {
    min-height: 110px;
    resize: vertical;
}

/* Checkbox */

.checkbox-row {
    display: flex;
    align-items: center;

    gap: 8px;

    margin: 12px 0 22px;

    color: #45495a;

    font-size: 14px;
}

.checkbox-row input {
    accent-color: #5146e5;
}

/* Form buttons */

.form-buttons {
    display: flex;
    gap: 10px;
}

.btn-save {
    flex: 1;

    border: none;

    background: #5146e5;
    color: #ffffff;

    padding: 12px 15px;

    border-radius: 10px;

    cursor: pointer;

    font-size: 13px;
    font-weight: 700;

    transition:
        background 0.2s ease,
        transform 0.2s ease;
}

.btn-save:hover {
    background: #4439d2;
    transform: translateY(-1px);
}

.btn-cancel {
    flex: 1;

    border: 1px solid #e4e4eb;

    background: #f7f7fa;
    color: #45495a;

    padding: 12px 15px;

    border-radius: 10px;

    cursor: pointer;

    font-size: 13px;
    font-weight: 700;

    transition:
        background 0.2s ease,
        border-color 0.2s ease;
}

.btn-cancel:hover {
    background: #eeeeF4;
    border-color: #d8d9e1;
}

/* =========================================================
   SEARCH
========================================================= */

.search-box {
    display: flex;

    gap: 10px;

    margin-bottom: 23px;
}

.search-box input {
    flex: 1;

    width: 100%;

    min-height: 47px;

    border: 1px solid #e1e2ea;

    border-radius: 10px;

    padding: 12px 15px;

    outline: none;

    background: #ffffff;

    color: #171827;

    font-size: 14px;

    transition:
        border-color 0.2s ease,
        box-shadow 0.2s ease;
}

.search-box input::placeholder {
    color: #9da2b3;
}

.search-box input:focus {
    border-color: #5146e5;

    box-shadow:
        0 0 0 3px rgba(81, 70, 229, 0.09);
}

.btn-search {
    min-width: 105px;

    border: none;

    background: #5146e5;
    color: #ffffff;

    padding: 0 20px;

    border-radius: 10px;

    cursor: pointer;

    font-size: 13px;
    font-weight: 700;

    transition:
        background 0.2s ease,
        transform 0.2s ease;
}

.btn-search:hover {
    background: #4439d2;

    transform: translateY(-1px);
}

/* =========================================================
   TABLE
========================================================= */

.table-wrapper {
    overflow-x: auto;

    border: 1px solid #ebebf1;

    border-radius: 14px;
}

.category-table {
    width: 100%;

    border-collapse: separate;
    border-spacing: 0;

    min-width: 700px;
}

.category-table th {
    text-align: left;

    background: #fafaff;

    color: #777d91;

    font-size: 11px;

    text-transform: uppercase;

    letter-spacing: 0.7px;

    font-weight: 750;

    padding: 15px;

    border-bottom: 1px solid #e8e8ef;
}

.category-table td {
    padding: 16px 15px;

    border-bottom: 1px solid #eeeeF3;

    vertical-align: middle;

    font-size: 14px;

    color: #303344;

    background: #ffffff;

    transition: background 0.15s ease;
}

.category-table tbody tr:last-child td {
    border-bottom: none;
}

.category-table tr:hover td {
    background: #fcfcff;
}

/* =========================================================
   CATEGORY ICON
========================================================= */

.category-icon {
    width: 43px;
    height: 43px;

    border-radius: 12px;

    background: #efedff;

    color: #5146e5;

    display: flex;
    align-items: center;
    justify-content: center;

    font-size: 20px;

    border: 1px solid #e2dfff;
}

/* =========================================================
   CATEGORY NAME
========================================================= */

.category-name {
    color: #202131;

    font-size: 14px;
    font-weight: 750;
}

.category-slug {
    color: #999eae;

    font-size: 12px;

    margin-top: 3px;
}

/* =========================================================
   STATUS
========================================================= */

.status {
    display: inline-flex;

    align-items: center;

    gap: 6px;

    padding: 6px 11px;

    border-radius: 20px;

    font-size: 11px;

    font-weight: 700;
}

.status::before {
    content: "";

    width: 6px;
    height: 6px;

    border-radius: 50%;
}

.status.active {
    background: #e8f8f2;
    color: #087f5b;
}

.status.active::before {
    background: #16b981;
}

.status.inactive {
    background: #fff0ef;
    color: #d92d20;
}

.status.inactive::before {
    background: #e2554c;
}

/* =========================================================
   ACTION BUTTONS
========================================================= */

.action-buttons {
    display: flex;

    gap: 8px;

    flex-wrap: wrap;
}

.btn-edit,
.btn-delete {
    border-radius: 8px;

    padding: 8px 12px;

    cursor: pointer;

    font-size: 12px;

    font-weight: 700;

    transition:
        background 0.2s ease,
        transform 0.15s ease;
}

.btn-edit {
    border: 1px solid #dedbff;

    background: #f0eeff;

    color: #5146e5;
}

.btn-edit:hover {
    background: #e5e2ff;

    transform: translateY(-1px);
}

.btn-delete {
    border: 1px solid #ffd5d2;

    background: #fff3f2;

    color: #d92d20;
}

.btn-delete:hover {
    background: #ffe7e5;

    transform: translateY(-1px);
}

/* =========================================================
   EMPTY STATE
========================================================= */

.empty-grid {
    text-align: center;

    color: #85899a;

    padding: 45px 20px;

    font-size: 14px;
}

/* =========================================================
   SCROLLBAR
========================================================= */

::-webkit-scrollbar {
    width: 8px;
    height: 8px;
}

::-webkit-scrollbar-track {
    background: #f5f5f8;
}

::-webkit-scrollbar-thumb {
    background: #cfd0da;
    border-radius: 10px;
}

::-webkit-scrollbar-thumb:hover {
    background: #b7b8c4;
}

/* =========================================================
   RESPONSIVE - 1200px
========================================================= */

@media (max-width: 1200px) {

    .nav-links {
        gap: 20px;
    }

    .nav-links a {
        font-size: 13px;
    }

    .admin-name {
        display: none;
    }

    .content-grid {
        grid-template-columns: 330px minmax(0, 1fr);
    }
}

/* =========================================================
   RESPONSIVE - 1000px
========================================================= */

@media (max-width: 1000px) {

    .nav-inner {
        grid-template-columns: auto 1fr auto;

        padding: 0 25px;
    }

    .nav-links {
        overflow-x: auto;

        justify-content: flex-start;

        padding: 0 15px;

        scrollbar-width: none;
    }

    .nav-links::-webkit-scrollbar {
        display: none;
    }

    .content-grid {
        grid-template-columns: 1fr;
    }

    .stats {
        grid-template-columns: repeat(3, 1fr);
    }

    .panel {
        width: 100%;
    }
}

/* =========================================================
   RESPONSIVE - 700px
========================================================= */

@media (max-width: 700px) {

    .top-nav {
        height: auto;
        min-height: 80px;
    }

    .nav-inner {
        display: flex;

        flex-wrap: wrap;

        gap: 10px;

        padding: 15px 20px;
    }

    .logo {
        font-size: 23px;
    }

    .nav-links {
        order: 3;

        width: 100%;

        height: 43px;

        padding: 0;

        gap: 22px;
    }

    .nav-links a {
        height: 43px;
    }

    .nav-links a.active::after {
        bottom: 2px;
    }

    .main {
        padding: 40px 18px 50px;
    }

    .page-header {
        flex-direction: column;

        align-items: flex-start;

        margin-bottom: 30px;
    }

    .page-header h1 {
        font-size: 42px;

        letter-spacing: -1.5px;
    }

    .page-header p {
        font-size: 14px;
    }

    .btn-primary {
        width: 100%;
    }

    .stats {
        grid-template-columns: 1fr;

        gap: 14px;
    }

    .panel {
        padding: 20px;

        border-radius: 15px;
    }

    .form-buttons {
        flex-direction: column;
    }

    .search-box {
        flex-direction: column;
    }

    .btn-search {
        min-height: 45px;
    }
}

/* =========================================================
   RESPONSIVE - 450px
========================================================= */

@media (max-width: 450px) {

    .main {
        padding-left: 14px;
        padding-right: 14px;
    }

    .page-header h1 {
        font-size: 36px;
    }

    .panel {
        padding: 17px;
    }

    .stat-card {
        padding: 20px;
    }

    .category-table {
        min-width: 650px;
    }
}

    </style>

</head>

<body>

<form id="form1" runat="server">

    <!-- ================= TOP NAVIGATION ================= -->

    <nav class="top-nav">

        <div class="nav-inner">

            <!-- LOGO -->

            <a href="AdminDashboard.aspx" class="logo">
                STUDYVAULT<span class="logo-dot">.</span>
            </a>


            <!-- NAVIGATION LINKS -->

            <div class="nav-links">

                <a href="AdminDashboard.aspx">
                    Overview
                </a>

                <a href="Users.aspx">
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

                <a href="AdminCategories.aspx" class="active">
                    Categories
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
                    Text="Admin" />

            </div>

        </div>

    </nav>


    <!-- ================= MAIN ================= -->

    <main class="main">

        <div class="page-header">

            <div>

                <h1>
                    Manage Categories
                </h1>

                <p>
                    Add, edit, activate or remove StudyVault categories.
                </p>

            </div>

            <button
                type="button"
                class="btn-primary"
                onclick="newCategory()">

                + Add Category

            </button>

        </div>


        <!-- ================= MESSAGES ================= -->

        <asp:Panel
            ID="pnConfirmation"
            runat="server"
            CssClass="message success"
            Visible="false">

            <asp:Label
                ID="lblConfirmationText"
                runat="server" />

        </asp:Panel>


        <asp:Panel
            ID="pnError"
            runat="server"
            CssClass="message error"
            Visible="false">

            <asp:Label
                ID="lblError"
                runat="server" />

        </asp:Panel>


        <!-- ================= STATS ================= -->

        <div class="stats">

            <div class="stat-card">

                <div class="stat-label">
                    Total Categories
                </div>

                <div class="stat-value">

                    <asp:Label
                        ID="lblTotalCategories"
                        runat="server"
                        Text="0" />

                </div>

            </div>


            <div class="stat-card">

                <div class="stat-label">
                    Active Categories
                </div>

                <div class="stat-value">

                    <asp:Label
                        ID="lblActiveCategories"
                        runat="server"
                        Text="0" />

                </div>

            </div>


            <div class="stat-card">

                <div class="stat-label">
                    Total Resources
                </div>

                <div class="stat-value">

                    <asp:Label
                        ID="lblTotalResources"
                        runat="server"
                        Text="0" />

                </div>

            </div>

        </div>


        <!-- ================= CONTENT ================= -->

        <div class="content-grid">


            <!-- ================= FORM ================= -->

            <div class="panel">

                <asp:Label
                    ID="lblFormTitle"
                    runat="server"
                    CssClass="panel-title"
                    Text="Add Category" />

                <asp:HiddenField
                    ID="hfCategoryId"
                    runat="server"
                    Value="0" />


                <div class="form-group">

                    <label for="txtName">
                        Category Name
                    </label>

                    <asp:TextBox
                        ID="txtName"
                        runat="server"
                        CssClass="form-control"
                        placeholder="e.g. Web Development" />

                </div>


                <div class="form-group">

                    <label for="txtSlug">
                        Slug
                    </label>

                    <asp:TextBox
                        ID="txtSlug"
                        runat="server"
                        CssClass="form-control"
                        placeholder="e.g. webdev" />

                </div>


                <div class="form-group">

                    <label for="txtIcon">
                        Icon / Emoji
                    </label>

                    <asp:TextBox
                        ID="txtIcon"
                        runat="server"
                        CssClass="form-control"
                        placeholder="e.g. 💻" />

                </div>


                <div class="form-group">

                    <label for="txtCssClass">
                        CSS Class
                    </label>

                    <asp:TextBox
                        ID="txtCssClass"
                        runat="server"
                        CssClass="form-control"
                        placeholder="e.g. webdev" />

                </div>


                <div class="form-group">

                    <label for="txtResourceCount">
                        Resource Count
                    </label>

                    <asp:TextBox
                        ID="txtResourceCount"
                        runat="server"
                        CssClass="form-control"
                        Text="0"
                        TextMode="Number" />

                </div>


                <div class="form-group">

                    <label for="txtDescription">
                        Description
                    </label>

                    <asp:TextBox
                        ID="txtDescription"
                        runat="server"
                        CssClass="form-control"
                        TextMode="MultiLine"
                        placeholder="Enter category description..." />

                </div>


                <div class="checkbox-row">

                    <asp:CheckBox
                        ID="chkActive"
                        runat="server"
                        Text=" Active category"
                        Checked="true" />

                </div>


                <div class="form-buttons">

                    <asp:Button
                        ID="btnAdd"
                        runat="server"
                        Text="Add Category"
                        CssClass="btn-save"
                        OnClick="btnAdd_Click" />

                    <asp:Button
                        ID="btnUpdate"
                        runat="server"
                        Text="Update Category"
                        CssClass="btn-save"
                        Visible="false"
                        OnClick="btnUpdate_Click" />

                    <asp:Button
                        ID="btnCancel"
                        runat="server"
                        Text="Cancel"
                        CssClass="btn-cancel"
                        CausesValidation="false"
                        OnClick="btnCancel_Click" />

                </div>

            </div>


            <!-- ================= LIST ================= -->

            <div class="panel">

                <div class="panel-title">
                    Categories
                </div>


                <div class="search-box">

                    <asp:TextBox
                        ID="txtSearch"
                        runat="server"
                        placeholder="Search categories..." />

                    <asp:Button
                        ID="btnSearch"
                        runat="server"
                        Text="Search"
                        CssClass="btn-search"
                        OnClick="btnSearch_Click" />

                </div>


                <div class="table-wrapper">

                    <asp:Repeater
                        ID="rptCategories"
                        runat="server"
                        OnItemCommand="rptCategories_ItemCommand">

                        <HeaderTemplate>

                            <table class="category-table">

                                <thead>

                                    <tr>

                                        <th>
                                            Icon
                                        </th>

                                        <th>
                                            Category
                                        </th>

                                        <th>
                                            Resources
                                        </th>

                                        <th>
                                            Status
                                        </th>

                                        <th>
                                            Actions
                                        </th>

                                    </tr>

                                </thead>

                                <tbody>

                        </HeaderTemplate>


                        <ItemTemplate>

                            <tr>

                                <td>

                                    <div class="category-icon">

                                        <%# Eval("Icon") %>

                                    </div>

                                </td>


                                <td>

                                    <div class="category-name">

                                        <%# Eval("Name") %>

                                    </div>

                                    <div class="category-slug">

                                        <%# Eval("Slug") %>

                                    </div>

                                </td>


                                <td>

                                    <%# Eval("ResourceCount") %>

                                </td>


                                <td>

                                    <span
                                        class='<%# Convert.ToBoolean(Eval("IsActive")) ? "status active" : "status inactive" %>'>

                                        <%# Convert.ToBoolean(Eval("IsActive")) ? "Active" : "Inactive" %>

                                    </span>

                                </td>


                                <td>

                                    <div class="action-buttons">

                                        <asp:LinkButton
                                            ID="btnEditRow"
                                            runat="server"
                                            CssClass="btn-edit"
                                            CommandName="EditCategory"
                                            CommandArgument='<%# Eval("Id") %>'>

                                            Edit

                                        </asp:LinkButton>


                                        <asp:LinkButton
                                            ID="btnDeleteRow"
                                            runat="server"
                                            CssClass="btn-delete"
                                            CommandName="DeleteCategory"
                                            CommandArgument='<%# Eval("Id") %>'
                                            OnClientClick="return confirm('Are you sure you want to delete this category?');">

                                            Delete

                                        </asp:LinkButton>

                                    </div>

                                </td>

                            </tr>

                        </ItemTemplate>


                        <FooterTemplate>

                                </tbody>

                            </table>

                        </FooterTemplate>

                    </asp:Repeater>


                    <asp:Panel
                        ID="pnlNoCategories"
                        runat="server"
                        CssClass="empty-grid"
                        Visible="false">

                        No categories found.

                    </asp:Panel>

                </div>

            </div>

        </div>

    </main>

</form>


<script>

    function newCategory() {

        var name = document.getElementById(
            '<%= txtName.ClientID %>'
        );

        if (name) {
            name.focus();
        }

    }

</script>

</body>

</html>