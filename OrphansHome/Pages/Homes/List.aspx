<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="OrphansHome.Pages.Homes.List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" runat="server">
    <!--/ Intro Single star /-->
    <section class="intro-single">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-8">
                    <div class="title-single-box">
                        <h1 class="title-single">البيوت قيد الرعاية</h1>
                        <span class="color-text-a">ميتم بالقرب منك</span>
                    </div>
                </div>
                <div class="col-md-12 col-lg-4">
                    <nav aria-label="breadcrumb" class="breadcrumb-box d-flex justify-content-lg-end">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="/">الرئيسية</a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">البيوت قيد الرعاية
                            </li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!--/ Intro Single End /-->

    <!--/ Property Grid Star /-->
    <section class="property-grid grid">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                    <div class="grid-option">
                        <form>
                            <select class="custom-select">
                                <option selected>الكل</option>
                                <option value="1">الجديد اولا</option>
                                <option value="2">حسب عدد المعالين</option>
                                <option value="3">حسب كمية الاحتياجات</option>
                            </select>
                        </form>
                    </div>
                </div>
                <asp:Repeater runat="server" ID="listRepeater">
                    <ItemTemplate>
                        <div class="col-md-4">
                            <div class="card-box-a card-shadow">
                                <div class="img-box-a">
                                    <img src="<%# "/Photos/"+ DataBinder.Eval(Container.DataItem,"ImageName")%>" alt="" class="img-a img-fluid">
                                </div>
                                <div class="card-overlay">
                                    <div class="card-overlay-a-content">
                                        <div class="card-header-a">
                                            <h2 class="card-title-a">
                                                <a href="<%# string.Format("/Pages/Homes/Details.aspx?OID={0}",DataBinder.Eval(Container.DataItem,"OID")) %>"><%# DataBinder.Eval(Container.DataItem,"Name") %></a>
                                            </h2>
                                        </div>
                                        <div class="card-body-a">
                                            <div class="price-box d-flex">
                                                <span class="price-a"><%# GetString(DataBinder.Eval(Container.DataItem,"Description").ToString(),'،') %></span>
                                            </div>
                                            <a href="<%# string.Format("/Pages/Homes/Details.aspx?OID={0}",DataBinder.Eval(Container.DataItem,"OID")) %>" class="link-a">اعرض التفاصيل
                                            <span class="ion-ios-arrow-forward"></span>
                                            </a>
                                        </div>
                                        <div class="card-footer-a">
                                            <ul class="card-info d-flex justify-content-around">
                                                <li>
                                                    <h4 class="card-info-title">المعالين</h4>
                                                    <span><%# DataBinder.Eval(Container.DataItem,"NumOfOrphans") %>
                                                    </span>
                                                </li>
                                                <li>
                                                    <h4 class="card-info-title">الطاقم</h4>
                                                    <span><%# DataBinder.Eval(Container.DataItem,"NumOfStaff") %>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>

            </div>
        </div>
    </section>
    <hr />
    <!--/ Property Grid End /-->
    <section class="property-grid grid">
        <div class="container">
            <div class="row">
                <div class="col-md-7 col-lg-7 section-md-t3">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="title-box-d">
                                <h3 class="title-d">الاقرب اليك</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div id="map" style="width: 100%; height: 500px;"></div>

                <script>
                    function myMap() {

                        var map = new google.maps.Map(document.getElementById("map"), mapOptions);
                        var myCenter = new google.maps.LatLng(38.224905, 48.252143);
                        var mapCanvas = document.getElementById("map");
                        var mapOptions = { center: myCenter, zoom: 16 };
                        var map = new google.maps.Map(mapCanvas, mapOptions);
                        var marker = new google.maps.Marker({ position: myCenter });
                        marker.setMap(map);
                    }
                </script>

                <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAaVKNXmtNr00rvvxUU_Vc767_dovgDVyQ&callback=myMap"></script>
            </div>
        </div>
    </section>

</asp:Content>
