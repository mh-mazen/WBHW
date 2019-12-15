<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="OrphansHome.Pages.Donation.Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" runat="server">
    <!--/ Intro Single star /-->
    <section class="intro-single">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-8">
                    <div class="title-single-box">
                        <h1 class="title-single">تبرع جديد
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
                                <a href="/Pages/Homes/List.aspx">التبرعات</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">اضافة
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
                        <div class="col-md-7">
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
                                    <div class="col-md-6 mb-3">
                                        <div class="form-group">
                                            <asp:TextBox runat="server" ID="Name" CssClass="form-control form-control-lg form-control-a" placeholder="الاسم الكامل"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Name" ForeColor="Red" ErrorMessage="الرجاء ادخال اسم"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="Email" runat="server" CssClass="form-control form-control-lg form-control-a" placeholder="البريد الالكتروني"></asp:TextBox>
                                            <asp:RegularExpressionValidator ForeColor="Red" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="Email" ErrorMessage="ادخل ايميل صحيح"></asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="Email" ErrorMessage="الرجاء ادحال بريد الكتروني"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <div class="form-group">
                                            <asp:TextBox ID="Phone" runat="server" CssClass="form-control form-control-lg form-control-a" placeholder="رقم الهاتف"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ForeColor="Red" ControlToValidate="Phone" ErrorMessage="الرجاء ادحال رقم هاتف"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ForeColor="Red" runat="server" ValidationExpression="(?:(\+?\d{1,3}) )?(?:([\(]?\d+[\)]?)[ -])?(\d{1,5}[\- ]?\d{1,5})" ControlToValidate="Phone" ErrorMessage="ادخل رقم هاتف صحيح"></asp:RegularExpressionValidator>

                                        </div>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <div class="form-group">
                                            <asp:TextBox runat="server" ID="Address" CssClass="form-control form-control-lg form-control-a" placeholder="العنوان"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Address" ForeColor="Red" ErrorMessage="الرجاء ادخال عنوان"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <div class="form-group">
                                            <label for="dType">نوع التبرع</label>
                                            <asp:DropDownList runat="server" ID="dType" CssClass="full-width">
                                                <asp:ListItem Text="مادي" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="مواد" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="الكل" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator runat="server" ForeColor="Red" ErrorMessage="الرجاء اختيار نوع المعونة" ControlToValidate="dType"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <div class="form-group">
                                            <label for="doType">طريقة التوصيل</label>
                                            <asp:DropDownList runat="server" ID="doType" CssClass="full-width">
                                                <asp:ListItem Text="شخصي" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="حوالة بنكية" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="وساطة" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator runat="server" ForeColor="Red" ErrorMessage="الرجاء اختيار طريقة التسليم" ControlToValidate="dType"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:Button runat="server" ID="send" CssClass="btn btn-a" OnClick="send_Click" Text="اضافة تبرع جديد" />
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="col-md-5 section-md-t3">
                            <div class="icon-box section-b2">
                                <div class="icon-box-icon">
                                    <span class="ion-ios-paper-plane"></span>
                                </div>
                                <div class="icon-box-content table-cell">
                                    <div class="icon-box-title">
                                        <h4 class="icon-title">اضف بياناتك</h4>
                                    </div>
                                    <div class="icon-box-content">
                                        <p class="mb-1">
                                            <span class="color-a">ادخل ببانات تبرعك بالحقول امامك</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="icon-box section-b2">
                                <div class="icon-box-icon">
                                    <span class="ion-ios-pin"></span>
                                </div>
                                <div class="icon-box-content table-cell">
                                    <div class="icon-box-title">
                                        <h4 class="icon-title">سيتم التواصل معك</h4>
                                    </div>
                                    <div class="icon-box-content">
                                        <p class="mb-1">
                                            من قبل احد مسؤولي المنظمة ليتم قبول الدعم
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <div class="icon-box">
                                <div class="icon-box-icon">
                                    <span class="ion-ios-thumbs-up"></span>
                                </div>
                                <div class="icon-box-content table-cell">
                                    <div class="icon-box-title">
                                        <h4 class="icon-title">شكرً!</h4>
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
