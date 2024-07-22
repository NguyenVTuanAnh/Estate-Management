package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.RoleDTO;
import com.javaweb.entity.RoleEntity;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.stream.Collectors;

@Component
public class BuildingConverter {

    @Autowired
    private ModelMapper modelMapper;

    public BuildingDTO convertToBuildingDTO(BuildingEntity buildingEntity) {
       BuildingDTO buildingDTO = modelMapper.map(buildingEntity, BuildingDTO.class);
       return buildingDTO;
    }


    public BuildingSearchResponse convertToBuildingSearchResponse(BuildingEntity buildingEntity) {
       BuildingSearchResponse buildingSearchResponse = modelMapper.map(buildingEntity, BuildingSearchResponse.class);
        if (buildingEntity.getStreet() != null && buildingEntity.getWard() != null && buildingEntity.getDistrict() != null) {
            buildingSearchResponse.setAddress(buildingEntity.getStreet() + "," + buildingEntity.getWard() + "," + buildingEntity.getDistrict().toLowerCase());
        }

        if (buildingEntity.getRentAreasList() != null) {
            String rentAreaResult = buildingEntity.getRentAreasList().stream()
//                    .filter(item -> item != null && item.getValue() != null)
                    .map(item -> item.getValue().toString())
                    .collect(Collectors.joining(","));
            buildingSearchResponse.setRentArea(rentAreaResult);
        }

        return buildingSearchResponse;
    }
    public BuildingEntity convertToBuildingEntity(BuildingDTO buildingDTO) {
         BuildingEntity buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);
         return buildingEntity;
    }
}
