<%--
  Created by IntelliJ IDEA.
  User: 84976
  Date: 7/15/2024
  Time: 10:45 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<html>
<head>
    <title>Thêm mới tòa nhà</title>
</head>
<body>
<div class="main-content" >



    <div class="main-content">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try { ace.settings.check('breadcrumbs', 'fixed') } catch (e) { }
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Home</a>
                    </li>
                    <li class="active">Thêm tòa nhà </li>
                </ul><!-- /.breadcrumb -->

                <div class="col-xs-12">
                    <div class="row" style="font-family: 'Times New Roman', Times, serif;" >
                        <div class="col-xs-12" >
                            <form:form class="form-horizontal" method="post" modelAttribute="buildingDTO"  action="/admin/building-edit" id="form-edit">
                                <div class="form-group">
                                    <form:label path="name" class="col-xs-3">Tên tòa nhà</form:label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="name" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <form:label class="col-xs-3"   path="district">Quận </form:label>
                                    <div class="col-xs-9">
                                        <form:select cssClass="form-control" path="district">
                                            <form:option  value="">--Chọn quận--</form:option>
                                            <form:options  items="${districts}"/>
                                        </form:select>
                                    </div>

                                </div>
                                <div class="form-group">
                                    <form:label path="ward" class="col-xs-3">Phường </form:label>
                                    <div class="col-xs-9">
                                        <form:input  class="form-control" path="ward" id="ward"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:label path="street" class="col-xs-3">Đường</form:label>
                                    <div class="col-xs-9">
                                        <form:input path="street" class="form-control" type="text" name="street" id="text"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:label path="structure" class="col-xs-3">
                                        kết cấu
                                    </form:label>
                                    <div class="col-xs-9">
                                        <form:input path="structure" class="form-control"  id="structure"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:label path="numberOfBasement" class="col-xs-3">số tầng hầm</form:label>
                                    <div class="col-xs-9">
                                        <form:input path="numberOfBasement" class="form-control"  id="numberOfBasement"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:label path="floorArea" class="col-xs-3">Diện tích sàn</form:label>
                                    <div class="col-xs-9">
                                        <form:input path="floorArea" class="form-control"  id="floorArea"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:label path="direction" class="col-xs-3">Hướng</form:label>
                                    <div class="col-xs-9">
                                        <form:input path="direction" class="form-control"  id="direction"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:label path="level" class="col-xs-3">Hạng</form:label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="level" id="level"/>
                                    </div>
                                </div>
<%--                                <div class="form-group">--%>
<%--                                    <form:label path="rentArea" class="col-xs-3">Diện tích thuê</form:label>--%>
<%--                                    <div class="col-xs-9">--%>
<%--                                        <form:input path="" class="form-control"  id="rentArea"/>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
                                <div class="form-group">
                                    <form:label path="rentPrice" class="col-xs-3">Giá thuê</form:label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="rentPrice" id="rentPrice"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <form:label path="" class="col-xs-3">Mô tả giá</form:label>
                                    <div class="col-xs-9">
                                        <form:input path="rentPriceDescription" class="form-control" id="rentPriceDescription"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:label path="serviceFee" class="col-xs-3">Phí dịch vụ</form:label>
                                    <div class="col-xs-9">
                                        <form:input path="serviceFee" class="form-control"  id="serviceFee"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:label path="carFee" class="col-xs-3">Phí oto</form:label>
                                    <div class="col-xs-9">
                                        <form:input path="carFee"  class="form-control"  id="carFee"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:label path="motoFee" class="col-xs-3"> Phí moto</form:label>
                                    <div class="col-xs-9">
                                        <form:input path="motoFee"  class="form-control" id="motoFee"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:label path="overTimeFee" class="col-xs-3"> Phí ngoài giờ</form:label>
                                    <div class="col-xs-9">
                                        <form:input path="overTimeFee"  class="form-control" id="overTimeFee"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:label path="waterFee" class="col-xs-3"> Giá nuớc</form:label>
                                    <div class="col-xs-9">
                                        <form:input path="waterFee"  class="form-control" id="waterFee"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:label path="electricityFee" class="col-xs-3">Giá điện</form:label>
                                    <div class="col-xs-9">
                                        <form:input class="form-control" path="electricityFee"  id="electricityFee"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <form:label path="deposit" class="col-xs-3">Đặt cọc</form:label>
                                    <div class="col-xs-9">
                                        <form:input path="deposit" class="form-control"  id="deposit"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:label path="payment" class="col-xs-3">Thanh Toán</form:label>
                                    <div class="col-xs-9">
                                        <form:input path="payment" class="form-control"  id="payment"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:label path="rentTime" class="col-xs-3">Thời hạn thuê</form:label>
                                    <div class="col-xs-9">
                                        <form:input path="rentTime" class="form-control"  id="rentTime"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <form:label path="decorationTime" class="col-xs-3">Thời gian trang trí</form:label>
                                    <div class="col-xs-9">
                                        <form:input path="decorationTime" class="form-control"  id="decorationTime"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <form:label path="brokerageFee" class="col-xs-3"> Brokerage fee</form:label>
                                    <div class="col-xs-9">
                                        <form:input path="brokerageFee"  class="form-control" id="brokerageFee"/>
                                    </div>
                                </div>

                                 <div class="form-group">
                                    <form:label path="note" class="col-xs-3"> Chú thích </form:label>
                                    <div class="col-xs-9">
                                        <form:input path="note"  class="form-control" id="note"/>
                                    </div>
                                </div>
                                 <div class="form-group">
                                    <form:label path="linkOfBuilding" class="col-xs-3"> Đường dẫn</form:label>
                                    <div class="col-xs-9">
                                        <form:input path="linkOfBuilding"  class="form-control" id="linkOfBuilding"/>
                                    </div>
                                </div>

                                 <div class="form-group">
                                    <form:label path="map" class="col-xs-3"> Map </form:label>
                                    <div class="col-xs-9">
                                        <form:input path="map"  class="form-control" id="map"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <form:label path="avatar" class="col-xs-3"> Ảnh </form:label>
                                    <div class="col-xs-9">
                                        <form:input path="avatar"  class="form-control" id="avatar"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <form:label path="createdDate" class="col-xs-3"> Ngày tạo </form:label>
                                    <div class="col-xs-9">
                                        <form:input path="createdDate"  class="form-control" id="createdDate"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:label path="modifiedDate" class="col-xs-3"> modifiedDate </form:label>
                                    <div class="col-xs-9">
                                        <form:input path="modifiedDate"  class="form-control" id="modifiedDate"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:label path="createBy" class="col-xs-3"> createBy </form:label>
                                    <div class="col-xs-9">
                                        <form:input path="createBy"  class="form-control" id="createBy"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:label path="modifiedBy" class="col-xs-3"> modifiedBy </form:label>
                                    <div class="col-xs-9">
                                        <form:input path="modifiedBy"  class="form-control" id="modifiedBy"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:label path="managerName" class="col-xs-3">Tên quản lý</form:label>
                                    <div class="col-xs-9">
                                        <form:input path="managerName" class="form-control" type="text" name="managerName" id="managerName"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:label path="managerPhone" class="col-xs-3">Số điện thoại quán lý</form:label>
                                    <div class="col-xs-9">
                                        <form:input path="managerPhone" class="form-control"  id="managerPhoneNumber"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:label class="col-xs-3" path="typeCode">
                                        loại tòa nhà
                                    </form:label>
                                    <div class="col-xs-9">
<%--                                        <form:checkboxes items="${typeCode}" path="typeCode" />--%>
                                        <input type="checkbox" name="" />



                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-xs-3">

                                    </label>
                                    <div class="col-xs-9">

                                        <c:if test="${not empty buildingDTO.id}">
                                            <button type="button" class="btn btn-success" id ="btnAddOrUpdateBuilding">
                                                Cập nhật
                                            </button>
                                            <button type="button" class="btn btn-danger" id="btnCancel">
                                                Hủy thao tác
                                            </button>
                                        </c:if>

                                        <c:if test="${empty buildingDTO.id}">
                                            <button type="button" class="btn btn-success" id ="btnAddOrUpdateBuilding">
                                                Thêm tòa nhà
                                            </button>
                                            <button type="button" class="btn btn-danger" id="btnCancel">
                                                Hủy thao tác
                                            </button>
                                        </c:if>

                                    </div>

                                </div>
                                <form:hidden path="id"  id="buildingId" />
                            </form:form>
                        </div>
                    </div>

                </div>
            </div>


        </div><!-- /.page-content -->

    </div>

</div><!-- /.main-content -->
<script src="assets/js/jquery.2.1.1.min.js"></script>
<script>
    $('#btnAddOrUpdateBuilding').click(function(){
        var data = {};
        var typeCode = [];
        var formData = $('#form-edit').serializeArray();
        $.each(formData, function(index, value){
            if(value.name != 'typeCode'){
                data["" + value.name + ""] = value.value
            }

            else{
                typeCode.push(value.value);
            }
        });
        data['typeCode'] = typeCode;
        // if(typeCode != ''){
            addOrUpdateBuilding(data);
        //
        // } else {
        //     window.location.href= "/admin/building-edit";
        // }
    });
    function addOrUpdateBuilding(data){
        $.ajax({
            type: "POST",         // method của api
            url: "/api/building",   // url cua api xử lý thao tác này
            data: JSON.stringify(data),     // chuyển dâta vừa thu thập ở trên thành dạng json
            contentType: "application/json", //
            dataType: "JSON",               // định nghĩa data cho sever là json
            success: function(respond){
                console.log("oke");
            },
            error: function(respond){
                console.log(respond);
            }
        });
        window.location.href = "/admin/building-list";
        updateWeb();
    }

    $('#buildingId').ready(function (e){
        $.ajax({
            type: "GET",         // method của api
            url: "/admin/building" + ${buildingDTO.id} +'/type',   // url cua api xử lý thao tác này
            // data: JSON.stringify(data),     // chuyển dâta vừa thu thập ở trên thành dạng json
            // contentType: "application/json", //
            dataType: "JSON",               // định nghĩa data cho sever là json
            success: function(respond){
                var row = '';
                row += '<input type="checkbox" name="" />'

            },
            error: function(respond){
                console.log(respond);
            }
            html()
        });
    })






    function updateWeb(){
        $.ajax({
            type: "GET",         // method của api
            url: "/admin/building-list",   // url cua api xử lý thao tác này
            // data: JSON.stringify(data),     // chuyển dâta vừa thu thập ở trên thành dạng json
            // contentType: "application/json", //
            dataType: "JSON",               // định nghĩa data cho sever là json
            success: function(respond){
                console.log("oke");
            },
            error: function(respond){
                console.log(respond);
            }
        });
    }





    $('#btnCancel').click(function (){
        window.location.href = "/admin/building-list";
    });
</script>
</body>
</html>
