<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ManageEdit.aspx.cs" Inherits="OrphansHome.Pages.Users.Manage.ManageEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" runat="server">
    <!--/ Intro Single star /-->
    <section class="intro-single">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-8">
                    <div class="title-single-box">
                        <h1 class="title-single">تعديل مستخدم 
                        </h1>
                        <span class="color-text-a">دعم للايتام</span>
                    </div>
                </div>
                <div class="col-md-12 col-lg-4">
                    <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="/">الرئيسية</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/Pages/Homes/List.aspx">مستخدمين</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">تعديل
                            </li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!--/ Intro Single End /-->
    <!--/ Contact Star /-->
    <section class="contact">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 section-t8">
                    <div class="row">
                        <div class="col-md-12">
                            <asp:Panel runat="server" ID="successPanel">
                                <div class="alert alert-success alert-dismissible fade show">
                                    <strong>تم!</strong> ارسال طلبك بنجاح.
                                         <button type="button" class="close" data-dismiss="alert">&times;</button>
                                </div>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="errorPanel">
                                <div class="alert alert-danger alert-dismissible fade show">
                                    <strong>خطا!</strong> حدث خطا اثناء ارسال رسالتك الرجاء المحاولة لاحقا.
                                         <button type="button" class="close" data-dismiss="alert">&times;</button>
                                </div>
                            </asp:Panel>

                            <div class="form-a">
                                <div class="row">
                                    <div class="col-md-12 mb-3">
                                        <div class="form-group">
                                            <label for="FirstName">اسم الاول</label>
                                            <asp:TextBox runat="server" ID="FirstName" CssClass="form-control form-control-lg form-control-a" placeholder="الاسم الاول"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="FirstName" ForeColor="Red" ErrorMessage="الرجاء ادخال اسم"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <div class="form-group">
                                            <label for="Desc">الكنية</label>
                                            <asp:TextBox runat="server" ID="LastName" CssClass="form-control form-control-lg form-control-a" placeholder="الكنية"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="LastName" ForeColor="Red" ErrorMessage="الرجاء ادخال الكنية"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <div class="form-group">
                                            <label for="MailAddress">عنوان البريد الالكتروني</label>
                                            <asp:TextBox runat="server" ID="EmailAddress" CssClass="form-control form-control-lg form-control-a" placeholder="عنوان البريد الالكتروني"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="EmailAddress" ForeColor="Red" ErrorMessage="الرجاء ادخال عنوان البريد الالكتروني"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <div class="form-group">
                                            <label for="PhoneNumber">رقم  العاتف</label>
                                            <asp:TextBox runat="server" ID="PhoneNumber" CssClass="form-control form-control-lg form-control-a" placeholder="رقم الهاتف"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="PhoneNumber" ForeColor="Red" ErrorMessage="الرجاء ادخال رقم الهاتف"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ForeColor="Red" runat="server" ValidationExpression="(?:(\+?\d{1,3}) )?(?:([\(]?\d+[\)]?)[ -])?(\d{1,5}[\- ]?\d{1,5})" ControlToValidate="PhoneNumber" ErrorMessage="ادخل رقم هاتف صحيح"></asp:RegularExpressionValidator>

                                        </div>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <div class="form-group">
                                            <label for="Username">اسم المستخدم (حروف انكليزية فقط)</label>
                                            <asp:TextBox runat="server" ID="Username" CssClass="form-control form-control-lg form-control-a" placeholder="اسم المستخدم"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Username" ForeColor="Red" ErrorMessage="الرجاء ادخال اسم المستخدم"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <div class="form-group">
                                            <label for="Password">كلمة السر (حروف انكليزية فقط)</label>
                                            <asp:TextBox runat="server" ID="Password" CssClass="form-control form-control-lg form-control-a" placeholder="كلمة السر"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" ForeColor="Red" ErrorMessage="الرجاء ادخال كلمة سر"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:Button runat="server" ID="send" OnClick="send_Click" CssClass="btn btn-a" Text="تعديل المستخدم " />
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/ Contact End /-->

</asp:Content>

