package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.UserDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;

public interface BuildingService {
    List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest);
    BuildingDTO findById(Long id);
    void deleteBuildingById(List<Long> listId);
    void addOrUpdateBuilding(BuildingEntity buildingEntity);
    ResponseDTO staffList(Long buildingId);
    ResponseDTO typeList(Long buildingId);
    void updateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO);
}
