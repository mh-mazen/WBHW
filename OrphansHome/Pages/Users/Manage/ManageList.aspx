<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ManageList.aspx.cs" Inherits="OrphansHome.Pages.Users.Manage.ManageList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" runat="server">
    <!--/ Intro Single star /-->
    <section class="intro-single">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-8">
                    <div class="title-single-box">
                        <h1 class="title-single">ادارةالمستخدمين 
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
                                <a href="/Pages/Homes/List.aspx">المستخدمين</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">الكل
                            </li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!--/ Intro Single End /-->
    <section class="contact">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-12 section-md-t3">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="title-box-d">
                                <div class="row">
                                    <div class="col-md-6 col-lg-6">
                                        <h3 class="title-d">قائمة المستخدمين</h3>
                                    </div>
                                    <div class="col-md-6 col-lg-6">
                                        <a class="btn btn-a non-rtl-f" title="اضافة" href="/Pages/Users/Manage/ManageAdd.aspx">
                                            <i class="fa fa-plus"></i>&nbsp;&nbsp;اضافة
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="property-description center-text">
                                <asp:Repeater runat="server" ID="UserRep">
                                    <HeaderTemplate>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>اسم الاول</th>
                                                    <th>الكنية </th>
                                                    <th>البريد الالكتروني</th>
                                                    <th>رقم الهاتف</th>
                                                    <th>-</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <th scope="row">
                                                <asp:Label ID="lblUID" runat="server" Text='<%# Eval("UID") %>' />
                                            </th>
                                            <td><%# DataBinder.Eval(Container.DataItem,"FirstName") %></td>
                                            <td><%# DataBinder.Eval(Container.DataItem,"SurName") %></td>
                                            <td><%# DataBinder.Eval(Container.DataItem,"EmailAddress") %></td>
                                            <td><%# DataBinder.Eval(Container.DataItem,"PhoneNumber") %></td>
                                            <td>
                                                <button runat="server" id="btnEdit" onserverclick="btnEdit_ServerClick" class="btn btn-b-n" title="تعديل">
                                                    <i class="fa fa-pencil"></i>&nbsp;&nbsp;تعديل
                                                </button>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </tbody>
                                    </table>
                                         <asp:Label ID="defaultItem" runat="server"
                                             Visible='<%# UserRep.Items.Count == 0 %>' Text="لا يوجد مستخدمين" />
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>


