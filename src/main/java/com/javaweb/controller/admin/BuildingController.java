package com.javaweb.controller.admin;



import com.javaweb.enums.buildingType;
import com.javaweb.enums.districtCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.BuildingService;
import com.javaweb.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller(value="buildingControllerOfAdmin")
public class BuildingController {



    @Autowired
    private BuildingService buildingService;

    @Autowired
    private IUserService userService;
    // tìm kiếm
    @GetMapping(value = "/admin/building-list")
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/list");
        mav.addObject("buildingSearchRequest",buildingSearchRequest);   // gắn lên box timd kiếm cho dễ nhìn
        List<BuildingSearchResponse> buildingDTOList = buildingService.findAll(buildingSearchRequest);
        mav.addObject("buildingDTOList", buildingDTOList);
        mav.addObject("listStaffs", userService.getStaffs());
        mav.addObject("districts", districtCode.type());
        mav.addObject("typeCode", buildingType.type());
        
        return mav;
    }

    // thêm mới
    @GetMapping(value = "/admin/building-edit")
    public ModelAndView buildingEdit(@ModelAttribute BuildingDTO buildingDTO,HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("buildingDTO", buildingDTO);
        mav.addObject("districts", districtCode.type());
        mav.addObject("typeCode", buildingType.type());       // ENUM

        return mav;
    }


    // chiỉnh sửa
    @GetMapping(value = "/admin/building-edit-{id}")
    public ModelAndView buildingEdit(@PathVariable("id") Long id, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/building/edit");
        // xuống database tìm building theo id
        BuildingDTO buildingDTO = buildingService.findById(id);
        mav.addObject("buildingDTO", buildingDTO);
        mav.addObject("districts", districtCode.type());
        mav.addObject("typeCode", buildingType.type());

        return mav;
    }





}
