package com.javaweb.api.admin;

import com.javaweb.converter.BuildingConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.BuildingService;
import com.javaweb.service.impl.BuildingServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

@RestController
@RequestMapping(value = "/api/building")
public class BuildingAPI {

    @PersistenceContext
    private EntityManager entityManager;

    @Autowired
    private BuildingConverter buildingConverter;
    @Autowired
    private BuildingService buildingService;

    // future: them moi
    @PostMapping
    @Transactional
    public void btnAddOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO){
        BuildingEntity buildingEntity = buildingConverter.convertToBuildingEntity(buildingDTO);
        buildingService.addOrUpdateBuilding(buildingEntity);
    }





    @DeleteMapping
    public void deleteListBuilding(@RequestBody List<Long> listId){
        // xuong database de xoa
        buildingService.deleteBuildingById(listId);

    }


    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffList(@PathVariable Long id){
        ResponseDTO responseDTO = buildingService.staffList(id);
        return responseDTO;  // tra ve cho ben front end
    }


    @PostMapping("/assignment")
    public void updateAssignmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO){
        buildingService.updateAssignmentBuilding(assignmentBuildingDTO);
    }

    @GetMapping("/{id}/type")
    public ResponseDTO loadBuildingType(@PathVariable Long id){
        ResponseDTO responseDTO = buildingService.typeList(id);


        return responseDTO;
    }




}
