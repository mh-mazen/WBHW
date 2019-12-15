<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="List.aspx.cs" Inherits="OrphansHome.Pages.Donation.List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" runat="server">
    <!--/ Intro Single star /-->
    <section class="intro-single">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-8">
                    <div class="title-single-box">
                        <h1 class="title-single">قائمة التبرعات 
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
                                <h3 class="title-d">التبرعات الجديدة</h3>
                            </div>
                            <div class="property-description center-text">
                                <asp:Repeater runat="server" ID="notDoneRep">
                                    <HeaderTemplate>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>اسم المرسل</th>
                                                    <th>عنوان المرسل</th>
                                                    <th>رقم هاتف المرسل</th>
                                                    <th>بريد المرسل</th>
                                                    <th>نوع التبرع</th>
                                                    <th>طريقة التسليم</th>
                                                    <th>تم التنفيذ</th>
                                                    <th>-</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <th scope="row">
                                                <asp:Label ID="lblDID" runat="server" Text='<%# Eval("DID") %>' />
                                            </th>
                                            <td><%# DataBinder.Eval(Container.DataItem,"FullName") %></td>
                                            <td><%# DataBinder.Eval(Container.DataItem,"Address") %></td>
                                            <td><%# DataBinder.Eval(Container.DataItem,"PhoneNumber") %></td>
                                            <td><%# DataBinder.Eval(Container.DataItem,"EmailAddress") %></td>
                                            <td><%# GetReqType(Convert.ToInt32(DataBinder.Eval(Container.DataItem,"TID"))) %></td>
                                            <td><%# GetDelType(Convert.ToInt32(DataBinder.Eval(Container.DataItem,"DOID"))) %></td>
                                            <td><%# ((bool)DataBinder.Eval(Container.DataItem,"IsCollected"))?"نعم":"لا" %></td>
                                            <td>
                                                <asp:Button runat="server" ID="btnDone" CssClass="btn btn-b-n" Text="تم التنفيذ" OnClick="btnDone_Click" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </tbody>
                                    </table>
                                         <asp:Label ID="defaultItem" runat="server"
                                             Visible='<%# notDoneRep.Items.Count == 0 %>' Text="لا يوجد تبرعات" />
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 col-lg-12 section-md-t3">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="title-box-d">
                                <h3 class="title-d">التبرعات المستلمة</h3>
                            </div>
                            <div class="property-description center-text">
                                <asp:Repeater runat="server" ID="doneRep">
                                    <HeaderTemplate>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>اسم المرسل</th>
                                                    <th>عنوان المرسل</th>
                                                    <th>رقم هاتف المرسل</th>
                                                    <th>بريد المرسل</th>
                                                    <th>نوع التبرع</th>
                                                    <th>طريقة التسليم</th>
                                                    <th>تم التنفيذ</th>
                                                    <th>-</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <th scope="row">
                                                <asp:Label ID="lblDID" runat="server" Text='<%# Eval("DID") %>' />
                                            </th>
                                            <td><%# DataBinder.Eval(Container.DataItem,"FullName") %></td>
                                            <td><%# DataBinder.Eval(Container.DataItem,"Address") %></td>
                                            <td><%# DataBinder.Eval(Container.DataItem,"PhoneNumber") %></td>
                                            <td><%# DataBinder.Eval(Container.DataItem,"EmailAddress") %></td>
                                            <td><%# GetReqType(Convert.ToInt32(DataBinder.Eval(Container.DataItem,"TID"))) %></td>
                                            <td><%# GetDelType(Convert.ToInt32(DataBinder.Eval(Container.DataItem,"DOID"))) %></td>
                                            <td><%# ((bool)DataBinder.Eval(Container.DataItem,"IsCollected"))?"نعم":"لا" %></td>
                                            <td>
                                                <asp:Button runat="server" ID="btnNotDone" CssClass="btn btn-b-n" Text="لم يتم التنفيذ" OnClick="btnNotDone_Click" />
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </tbody>
                                    </table>
                                          <asp:Label ID="defaultItem" runat="server"
                                              Visible='<%# doneRep.Items.Count == 0 %>' Text="لا يوجد تبرعات" />
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
