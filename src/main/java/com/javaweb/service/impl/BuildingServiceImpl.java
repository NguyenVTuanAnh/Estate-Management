package com.javaweb.service.impl;

import com.javaweb.converter.BuildingConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
public class BuildingServiceImpl implements BuildingService {

    @Autowired
    private BuildingRepository buildingRepository;


    @Autowired
    private BuildingConverter buildingConverter;


    @Override
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest) {
        List<BuildingSearchResponse> buildingSearchResponseList = new ArrayList<>();
        List<BuildingEntity> buildingEntityList = buildingRepository.findAll(buildingSearchRequest);
        for (BuildingEntity buildingEntity : buildingEntityList) {
            BuildingSearchResponse buildingSearchResponse = buildingConverter.convertToBuildingSearchResponse(buildingEntity);
            buildingSearchResponseList.add(buildingSearchResponse);
        }
        return buildingSearchResponseList;
    }

    @Override
    public BuildingDTO findById(Long id) {
        BuildingEntity buildingEntity = buildingRepository.findById(id).get();
        BuildingDTO buildingDTO = buildingConverter.convertToBuildingDTO(buildingEntity);
        return buildingDTO;
    }
}
