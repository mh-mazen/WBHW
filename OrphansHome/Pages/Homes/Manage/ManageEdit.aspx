<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="ManageEdit.aspx.cs" Inherits="OrphansHome.Pages.Homes.Manage.ManageEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Body" runat="server">
    <!--/ Intro Single star /-->
    <section class="intro-single">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-8">
                    <div class="title-single-box">
                        <h1 class="title-single">تعديل دار ايتام 
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
                                            <label for="Name">اسم الدار</label>
                                            <asp:TextBox runat="server" ID="Name" CssClass="form-control form-control-lg form-control-a" placeholder="الاسم"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Name" ForeColor="Red" ErrorMessage="الرجاء ادخال اسم"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <div class="form-group">
                                            <label for="Desc">تفاصيل الدار</label>
                                            <asp:TextBox runat="server" ID="Desc" Height="200" TextMode="MultiLine" CssClass="form-control form-control-lg form-control-a" placeholder="التفاصيل"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Desc" ForeColor="Red" ErrorMessage="الرجاء ادخال الشرح"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <div class="form-group">
                                            <label for="Address">عنوان الدار</label>
                                            <asp:TextBox runat="server" ID="Address" CssClass="form-control form-control-lg form-control-a" placeholder="العنوان"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Address" ForeColor="Red" ErrorMessage="الرجاء ادخال العنوان"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <div class="form-group">
                                            <label for="NumOrph">عدد المعالين</label>
                                            <asp:TextBox runat="server" ID="NumOrph" TextMode="Number" CssClass="form-control form-control-lg form-control-a" placeholder="عدد المعالين"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="NumOrph" ForeColor="Red" ErrorMessage="الرجاء ادخال عدد المعالين"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <div class="form-group">
                                            <label for="NumStaff">عدد الطاقم</label>
                                            <asp:TextBox runat="server" ID="NumStaff" TextMode="Number" CssClass="form-control form-control-lg form-control-a" placeholder="عدد الطاقم"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="NumStaff" ForeColor="Red" ErrorMessage="الرجاء ادخال عدد الطاقم"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <div class="col-md-12 mb-3">
                                        <div class="form-group">
                                            <label for="MailAddress">عنوان البريد</label>
                                            <asp:TextBox runat="server" ID="MailAddress" CssClass="form-control form-control-lg form-control-a" placeholder="عنوان البريد"></asp:TextBox>
                                            <asp:RequiredFieldValidator runat="server" ControlToValidate="MailAddress" ForeColor="Red" ErrorMessage="الرجاء ادخال عنوان البريد"></asp:RequiredFieldValidator>
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
                                    <div class="col-md-6 mb-3">
                                        <div class="form-group">
                                            <label for="ImageFile">صورة الدار</label>
                                            <asp:FileUpload runat="server" ID="ImageFile" CssClass="form-control form-control-lg form-control-a" placeholder="صورة الدار" AllowMultiple="false" accept=".png,.jpg,.jpeg,.gif"></asp:FileUpload>
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <div class="form-group">
                                            <div class="center-text">
                                                <asp:Image runat="server" ID="Image" CssClass="img-thumbnail img-responsive img-small" />
                                            </div>
                                        </div>
                                    </div>
                                    <asp:HiddenField runat="server" ID="LocArgs" ClientIDMode="Static" />
                                    <div class="col-md-12 mb-3">
                                        <div class="form-group">
                                            <label>موقع الدار</label>
                                            <div id="map" style="width: 100%; height: 380px;"></div>

                                            <script>
                                                function myMap() {

                                                    var map = new google.maps.Map(document.getElementById("map"), mapOptions);
                                                    var myCenter = new google.maps.LatLng(<%= GetLoc(LocArgs.Value,true) %>, <%= GetLoc(LocArgs.Value,false)  %>);
                                                    var mapCanvas = document.getElementById("map");
                                                    var mapOptions = { center: myCenter, zoom: 16 };
                                                    var map = new google.maps.Map(mapCanvas, mapOptions);
                                                    var marker = new google.maps.Marker({ position: myCenter, draggable: true, map: map });
                                                    google.maps.event.addListener(map, 'dragend', function () { var l = map.getCenter(); marker.setPosition(l); });
                                                    google.maps.event.addListener(marker, 'dragend', function (event) { document.getElementById('LocArgs').value = event.latLng.lat() + "," + event.latLng.lng(); });
                                                }
                                            </script>
                                            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAaVKNXmtNr00rvvxUU_Vc767_dovgDVyQ&callback=myMap"></script>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <asp:Button runat="server" ID="send" OnClick="send_Click" CssClass="btn btn-a" Text="تعديل الدار " />
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
