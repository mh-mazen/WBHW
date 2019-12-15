<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="OrphansHome.Pages.Requirements.Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" runat="server">
    <!--/ Intro Single star /-->
    <section class="intro-single">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-8">
                    <div class="title-single-box">
                        <h1 class="title-single">احتياج جديد
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
                                <a href="/Pages/Homes/List.aspx">احتياجات</a>
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
                                            <label for="Desc">تفاصيل الاحتياج</label>
                                            <asp:TextBox runat="server" ID="Desc" TextMode="MultiLine" Height="200" CssClass="form-control form-control-lg form-control-a" placeholder="التفاصيل"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Desc" ForeColor="Red" ErrorMessage="الرجاء ادخال الشرح"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <div class="form-group">
                                            <label for="dType">نوع الاحتياج</label>
                                            <asp:DropDownList runat="server" ID="dType" CssClass="full-width">
                                                <asp:ListItem Text="مادي" Value="1"></asp:ListItem>
                                                <asp:ListItem Text="مواد" Value="2"></asp:ListItem>
                                                <asp:ListItem Text="الكل" Value="3"></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator runat="server" ForeColor="Red" ErrorMessage="الرجاء اختيار نوع المعونة" ControlToValidate="dType"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:Button runat="server" ID="send" CssClass="btn btn-a" OnClick="send_Click" Text="اضافة احتياج جديد" />
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
