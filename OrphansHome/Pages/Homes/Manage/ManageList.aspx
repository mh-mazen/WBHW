<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ManageList.aspx.cs" Inherits="OrphansHome.Pages.Homes.Manage.ManageList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" runat="server">
    <!--/ Intro Single star /-->
    <section class="intro-single">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-8">
                    <div class="title-single-box">
                        <h1 class="title-single">ادارة دور الايتام 
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
                                <a href="/Pages/Homes/List.aspx">الدور</a>
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
                                        <h3 class="title-d">قائمة الدور</h3>
                                    </div>
                                    <div class="col-md-6 col-lg-6">
                                        <asp:Panel runat="server" ID="addBtnVisible">
                                            <a class="btn btn-a non-rtl-f" title="اضافة" href="/Pages/Homes/Manage/ManageAdd.aspx">
                                                <i class="fa fa-plus"></i>&nbsp;&nbsp;اضافة
                                            </a>
                                        </asp:Panel>
                                        <asp:Panel runat="server" ID="addBtnError" Visible="false">
                                            <a class="btn btn-a trigger-btn non-rtl-f" href="#FreeErrorModel" data-toggle="modal">
                                                <i class="fa fa-stop-circle" aria-hidden="true"></i>&nbsp;&nbsp;<span>لا يوجد مستخدمين بلا دور! </span>
                                            </a>
                                            <div id="FreeErrorModel" class="modal fade">
                                                <div class="modal-dialog modal-login">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <div class="avatar">
                                                                <img src="/Content/img/error.png" alt="Avatar">
                                                            </div>
                                                            <h4 class="modal-title">عدد المستخدمين</h4>
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                        </div>
                                                        <div class="modal-body">
                                                            لا يوجد اي مستخدم غير مرتبط بدار ايتام الرجاء اضافة مستخدم جديد
                                                            <br />
                                                            <hr />
                                                            <div class="col-md-12">
                                                                <div class="center-text">
                                                                    <a href="/Page/Users/Manage/ManageAdd.aspx" class="btn btn-a">اضافة مستخدم جديد</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </asp:Panel>
                                    </div>
                                </div>

                            </div>
                            <div class="property-description center-text">
                                <asp:Repeater runat="server" ID="OrphRep">
                                    <HeaderTemplate>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>اسم الدار</th>
                                                    <th>تفاصيل الدار</th>
                                                    <th>عنوان الدار</th>
                                                    <th>عدد المعالين </th>
                                                    <th>عدد الطاقم</th>
                                                    <th>البريد الالكتروني</th>
                                                    <th>رقم الهاتف</th>
                                                    <th>عنوان البريد </th>
                                                    <th>-</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <th scope="row">
                                                <asp:Label ID="lblOID" runat="server" Text='<%# Eval("OID") %>' />
                                            </th>
                                            <td><%# DataBinder.Eval(Container.DataItem,"Name") %></td>
                                            <td><%# GetString(DataBinder.Eval(Container.DataItem,"Description").ToString(),'،') %></td>
                                            <td><%# DataBinder.Eval(Container.DataItem,"Address") %></td>
                                            <td><%# DataBinder.Eval(Container.DataItem,"NumOfOrphans") %></td>
                                            <td><%# DataBinder.Eval(Container.DataItem,"NumOfStaff") %></td>
                                            <td><%# DataBinder.Eval(Container.DataItem,"EmailAddress") %></td>
                                            <td><%# DataBinder.Eval(Container.DataItem,"PhoneNumber") %></td>
                                            <td><%# DataBinder.Eval(Container.DataItem,"MailAddress") %></td>
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
                                             Visible='<%# OrphRep.Items.Count == 0 %>' Text="لا يوجد تبرعات" />
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

