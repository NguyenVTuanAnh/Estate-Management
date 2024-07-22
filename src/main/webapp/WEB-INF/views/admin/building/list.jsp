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
    <title>Quản lý toàn nhà</title>
</head>
<body>
<div class="main-content">
    <div>
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
                        <li class="active">Quản lí tòa nhà </li>
                    </ul><!-- /.breadcrumb -->

                    <form:form id="listForm" action="/admin/building-list" method="get" modelAttribute="buildingSearchRequest">
                    <div class="row">
                        <div class="col-xs-12" style="min-height: 209.4px;">
                            <div class="widget-box ui-sortable-handle" style="opacity: 1;">
                                <div class="widget-header">
                                    <h5 class="widget-title">Tìm kiếm</h5>

                                    <div class="widget-toolbar">

                                        <a href="#" data-action="reload">
                                            <i class="ace-icon fa fa-refresh"></i>
                                        </a>
                                    </div>
                                </div>


                                <div class="widget-body" style="font-family: Arial, Helvetica, sans-serif;">
                                    <div class="widget-main">

                                            <div class="row">

                                                <div class="form-group">
                                                    <div class="col-xs-12">
                                                        <div class="col-xs-6">
                                                            <form:label path="name">Tên tòa nhà </form:label>
                                                            <form:input path="name" class="form-control"  />
                                                        </div>
                                                        <div class="col-xs-6">
                                                            <form:label path="floorArea">Dien tich san</form:label>
                                                            <form:input path="floorArea" class="form-control"/>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-xs-12">
                                                        <div class="col-xs-2">
                                                            <form:label path="district">Quan </form:label>
                                                            <form:select class="form-control"
                                                                    aria-label="Default select example" path="district">
                                                                <form:option value="">--Chọn quận--</form:option>
                                                                <form:options items="${districts}"/>
                                                            </form:select>
                                                        </div>
                                                        <div class="col-xs-5">
                                                            <form:label path="ward">Phuong</form:label>
                                                            <form:input path="ward" class="form-control"/>
                                                        </div>
                                                        <div class="col-xs-5">
                                                            <form:label path="street">Duong</form:label>
                                                            <form:input path="street" class="form-control"/>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="col-xs-12">
                                                        <div class="col-xs-4">
                                                            <form:label path="numberOfBasement">Số tầng hầm </form:label>
                                                            <form:input path="numberOfBasement" class="form-control"/>
                                                        </div>
                                                        <div class="col-xs-4">
                                                            <fomr:label path="direction">Hướng</fomr:label>
                                                            <form:input path="direction"  class="form-control"/>
                                                        </div>
                                                        <div class="col-xs-4">
                                                            <form:label path="level">Hạng</form:label>
                                                            <form:input path="level" class="form-control"/>
                                                        </div>
                                                    </div>
                                                </div>


                                                <div class="form-group">
                                                    <div class="col-xs-12">
                                                        <div class="col-xs-3">
                                                            <form:label path="areaFrom">Diện tích từ</form:label>
                                                            <form:input path="areaFrom" class="form-control"/>
                                                        </div>
                                                        <div class="col-xs-3">
                                                            <form:label path="areaTo">Diện tích đến</form:label>
                                                            <form:input path="areaTo"  class="form-control"/>
                                                        </div>
                                                        <div class="col-xs-3">
                                                            <form:label path="rentPriceFrom">Giá thuê từ</form:label>
                                                            <form:input path="rentPriceFrom" class="form-control"/>
                                                        </div>
                                                        <div class="col-xs-3">
                                                            <form:label path="rentPriceTo">Giá thuê đến</form:label>
                                                            <form:input path="rentPriceTo" class="form-control"/>
                                                        </div>
                                                    </div>
                                                </div>



                                                <div class="form-group">
                                                    <div class="col-xs-12">

                                                        <div class="col-xs-4">
                                                            <form:label path="managerName">Tên quản lý</form:label>
                                                            <form:input path="managerName" class="form-control"/>
                                                        </div>
                                                        <div class="col-xs-4">
                                                            <form:label path="managerPhone">Điện thoại quản lý</form:label>
                                                            <form:input path="managerPhone" class="form-control"/>
                                                        </div>
                                                        <div class="col-xs-4">
                                                            <form:label path="staffId">Chọn nhân viên phụ trách </form:label>
                                                            <form:select class="form-control"
                                                                    aria-label="Default select example" path="staffId">
                                                                <form:option value="">--Chọn nhân viên--</form:option>
                                                                <form:options items="${listStaffs}" />
                                                            </form:select>
                                                        </div>

                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <div class="col-xs-12">
                                                        <div class="col-xs-6">

                                                            <form:checkboxes items="${typeCode}" path="typeCode"/>


                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <div class="col-xs-12">
                                                        <button type="button" class="btn btn-success" id="btnSearchBuilding">
                                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
                                                            </svg>
                                                            Tìm kiếm
                                                        </button>
                                                    </div>
                                                </div>


                                             </div>




                                    </div>
                                </div>
                                <div class="pull-right">
                                    <a href="/admin/building-edit" class="btn btn-success" title="Thêm tòa nhà">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-add" viewBox="0 0 16 16">
                                            <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0"/>
                                            <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                            <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                        </svg>
                                    </a>
                                    <button class="btn btn-danger" id="btnDeleteListBuilding">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-building-dash" viewBox="0 0 16 16">
                                            <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7M11 12h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1 0-1"/>
                                            <path d="M2 1a1 1 0 0 1 1-1h10a1 1 0 0 1 1 1v6.5a.5.5 0 0 1-1 0V1H3v14h3v-2.5a.5.5 0 0 1 .5-.5H8v4H3a1 1 0 0 1-1-1z"/>
                                            <path d="M4.5 2a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm-6 3a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5zm3 0a.5.5 0 0 0-.5.5v1a.5.5 0 0 0 .5.5h1a.5.5 0 0 0 .5-.5v-1a.5.5 0 0 0-.5-.5z"/>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    </form:form>


                    <div class="col-xs-12" style="margin: 3rem 0 1.5rem; font-family:'Times New Roman', Times, serif" >

                        <h1>Danh sách tòa nhà</h1>

                        <table id="tableList" class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                                <th class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace">
                                        <span class="lbl"></span>
                                    </label>
                                </th>
                                <th>Tên toàn nhà</th>
                                <th>Địa chỉ</th>
                                <th class="hidden-480">Số tầng hầm</th>

                                <th>Tên quản lý</th>
                                <th>Số điện thoại quản lý</th>
                                <th>Diện tích sàn</th>
                                <th>Giá thuê</th>
                                <th>Phí dịch vụ</th>
                                <th>Diện tích trống</th>
                                <th>Diện tích thuê</th>
                                <th>Phí mô giới</th>

                                <th>Thao tác</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="item" items="${buildingDTOList}">

                                <tr>
                                <td class="center">
                                    <label class="pos-rel">
                                        <input type="checkbox" class="ace" value="${item.id}">
                                        <span class="lbl"></span>
                                    </label>
                                </td>

                                <td>${item.name}</td>
                                <td>${item.address}</td>
                                <td>${item.numberOfBasement}</td>
                                <td>${item.managerName}</td>
                                <td>${item.managerPhone}</td>
                                <td>${item.floorArea}</td>
                                <td>${item.rentPrice}</td>
                                <td>${item.serviceFee}</td>
                                <td>${item.emptyArea}</td>
                                <td>${item.rentArea}</td>
                                <td>${item.brokerageFee}</td>

                                <td>
                                    <div class="hidden-sm hidden-xs btn-group">
                                        <button class="btn btn-xs btn-success" title="Giao tòa nhà" onclick="assignmentBuilding(${item.id})">
                                            <i class="ace-icon fa fa-check bigger-120"></i>
                                        </button>

                                        <a href="/admin/building-edit-${item.id}" class="btn btn-xs btn-info" title="Chỉnh sửa tòa nhà">
                                            <i class="ace-icon fa fa-pencil bigger-120"></i>
                                        </a>

                                        <button class="btn btn-xs btn-danger" title="xóa tòa nhà" onclick="deleteOneBuilding(${item.id})">
                                            <i class="ace-icon fa fa-trash-o bigger-120"></i>
                                        </button>


                                    </div>

                                    <div class="hidden-md hidden-lg">
                                        <div class="inline pos-rel">
                                            <button class="btn btn-minier btn-primary dropdown-toggle"
                                                    data-toggle="dropdown" data-position="auto">
                                                <i class="ace-icon fa fa-cog icon-only bigger-110"></i>
                                            </button>

                                            <ul
                                                    class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
                                                <li>
                                                    <a href="#" class="tooltip-info" data-rel="tooltip" title=""
                                                       data-original-title="View">
															<span class="blue">
																<i class="ace-icon fa fa-search-plus bigger-120"></i>
															</span>
                                                    </a>
                                                </li>

                                                <li>
                                                    <a href="#" class="tooltip-success" data-rel="tooltip" title=""
                                                       data-original-title="Edit">
															<span class="green">
																<i
                                                                        class="ace-icon fa fa-pencil-square-o bigger-120"></i>
															</span>
                                                    </a>
                                                </li>

                                                <li>
                                                    <a href="#" class="tooltip-error" data-rel="tooltip" title=""
                                                       data-original-title="Delete">
															<span class="red">
																<i class="ace-icon fa fa-trash-o bigger-120"></i>
															</span>
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </c:forEach>



                            </tbody>
                        </table>
                    </div>


                </div>







            </div><!-- /.page-content -->
        </div>
    </div><!-- /.main-content -->

    <div class="modal" tabindex="-1" role="dialog" id="assignmentBuildingModal" style="font-family: 'Times New Roman', Times, serif;">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Danh sách nhân viên</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <table class="table table-striped table-bordered table-hover" id="staffList">
                        <thead>
                        <tr class="center">
                            <th class="center">Chọn</th>
                            <th>Tên nhân viên</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <td class="center">
                                <input type="checkbox"  value="1"  id="checkbox_1" >
                            </td>
                            <td>
                                Nguyên văn a
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <input type="hidden" id="buildingId" name="buildingId" value="1">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" id="btnAssignmentBuilding">Giao tòa nhà</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="assets/js/jquery.2.1.1.min.js"></script>
<script>

    // làm chức năng nút giao tòa nhà hiển thị lên cái modal.
    function assignmentBuilding(buildingId){
        $('#assignmentBuildingModal').modal();
    }





    // làm chức năng cho nút giao tòa nhà cho nhân viên.
    $('#btnAssignmentBuilding').click(function(e){
        e.preventDefault();
        var data = {};
        data['buildingId'] = $('#buildingId').val();
        var staffs = $('#staffList').find('tbody input[type = checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        data['staffs'] = staffs;
    });


    // làm chức năng cho nút tìm kiếm
    $('#btnSearchBuilding').click(function(e){
        e.preventDefault();
        $('#listForm').submit();    //đẩy data cần tìm lên params

    });

    function deleteOneBuilding(id){
        var buildingId = [id];
        deleteListBuilding(buildingId);
    }


    $('#btnDeleteListBuilding').click(function (e){
        e.preventDefault();
        var buildingIdList = $('#tableList').find('tbody input[type = checkbox]:checked').map(function(){
            return $(this).val();
        }).get();
        deleteListBuilding(buildingIdList);
    });
    function deleteListBuilding(data){

        $.ajax({
            type: "delete",         // method của api
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
    }


</script>
</body>
</html>
