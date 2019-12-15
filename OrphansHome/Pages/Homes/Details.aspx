<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Details.aspx.cs" Inherits="OrphansHome.Pages.Homes.Details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" runat="server">
    <!--/ Intro Single star /-->
    <section class="intro-single">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-8">
                    <div class="title-single-box">
                        <h1 class="title-single">
                            <%= orph.Name %>
                        </h1>
                        <span class="color-text-a">مؤسسة ايتام</span>
                    </div>
                </div>
                <div class="col-md-12 col-lg-4">
                    <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="/">الرئيسية</a>
                            </li>
                            <li class="breadcrumb-item">
                                <a href="/Pages/Homes/List.aspx">المياتم</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">
                                <%= orph.Name %>
                            </li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!--/ Intro Single End /-->

    <!--/ Property Single Star /-->
    <section class="property-single nav-arrow-b">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div id="property-single-carousel" class="owl-carousel gallery-property non-rtl">
                        <div class="carousel-item-b">
                            <img src="<%= string.Format("/Photos/{0}",orph.ImageName) %>" />
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <div class="col-md-5 col-lg-4">
                            <div class="property-price d-flex justify-content-center foo">
                                <div class="card-header-c d-flex">
                                    <div class="card-box-ico">
                                        <span class="ion-money"><i class="fa fa-star-o"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="property-summary">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="title-box-d section-t4">
                                            <h3 class="title-d">معلومات</h3>
                                        </div>
                                    </div>
                                </div>
                                <div class="summary-list">
                                    <ul class="list">
                                        <li class="d-flex justify-content-between">
                                            <strong>معرف الميتم:</strong>
                                            <span>
                                                <%= orph.OID %>

                                            </span>
                                        </li>
                                        <li class="d-flex justify-content-between">
                                            <strong>عدد المعالين:</strong>
                                            <span>
                                                <%= orph.NumOfOrphans %>

                                            </span>
                                        </li>
                                        <li class="d-flex justify-content-between">
                                            <strong>عدد الطاقم:</strong>
                                            <span>
                                                <%= orph.NumOfStaff %>
                                            </span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-7 col-lg-7 section-md-t3">
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="title-box-d">
                                        <h3 class="title-d">تفاصيل الميتم</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="property-description">
                                <p class="description color-text-a">
                                    <%= orph.Description %>
                                </p>
                            </div>
                            <div class="row">
                                <div class="col-sm-12">
                                    <div class="title-box-d">
                                        <h3 class="title-d">احتياجات الميتم</h3>
                                    </div>
                                </div>
                            </div>
                            <div class="property-description">
                                <asp:Repeater runat="server" ID="reqRep">
                                    <HeaderTemplate>
                                        <table id="tablePreview" class="table">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>التفاصيل</th>
                                                    <th>نوع الطلب</th>
                                                    <th>تم التنفيذ</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <th scope="row"><%# DataBinder.Eval(Container.DataItem,"OID") %></th>
                                            <td><%# DataBinder.Eval(Container.DataItem,"Description") %></td>
                                            <td><%# GetReqType(Convert.ToInt32(DataBinder.Eval(Container.DataItem,"TID"))) %></td>
                                            <td><%# ((bool)DataBinder.Eval(Container.DataItem,"IsDone"))?"نعم":"لا" %></td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </tbody>
                                    </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="row section-t3">
                        <div class="col-sm-12">
                            <div class="title-box-d">
                                <h3 class="title-d">مدير الميتم</h3>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 col-lg-4">
                            <img src="/Content/img/agent-2.jpg" alt="" class="img-fluid">
                        </div>
                        <div class="col-md-6 col-lg-4">
                            <div class="property-agent">
                                <h4 class="title-agent">
                                    <%= user.FullName %></h4>
                                <ul class="list-unstyled">
                                    <li class="d-flex justify-content-between">
                                        <strong>الهاتف:</strong>
                                        <span class="color-text-a">
                                            <%= user.PhoneNumber %></span>
                                    </li>
                                    <li class="d-flex justify-content-between">
                                        <strong>البريد الالكتروني:</strong>
                                        <span class="color-text-a">
                                            <%= user.EmailAddress %></span>
                                    </li>
                                    <li>
                                        <div id="map" style="width: 700px; height: 280px;"></div>

                                        <script>
                                            function myMap() {

                                                var map = new google.maps.Map(document.getElementById("map"), mapOptions);
                                                var myCenter = new google.maps.LatLng(<%= orph.MapLat %>, <%= orph.MapLng %>);
                                                var mapCanvas = document.getElementById("map");
                                                var mapOptions = { center: myCenter, zoom: 16 };
                                                var map = new google.maps.Map(mapCanvas, mapOptions);
                                                var marker = new google.maps.Marker({ position: myCenter });
                                                marker.setMap(map);
                                            }
                                        </script>

                                        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAaVKNXmtNr00rvvxUU_Vc767_dovgDVyQ&callback=myMap"></script>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-12 col-lg-4">
                            <div class="property-contact">
                                <div class="row">
                                    <div class="col-md-12">
                                        <asp:Button runat="server" ID="btnDonation" CssClass="btn btn-a non-rtl-f" Text="اضافة تبرع" OnClick="btnDonation_Click" />
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--/ Property Single End /-->

</asp:Content>
