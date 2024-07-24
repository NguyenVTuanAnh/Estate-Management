package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.RoleDTO;
import com.javaweb.entity.RoleEntity;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Component;

import java.util.stream.Collectors;

@Component
public class BuildingConverter {

    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private StringHttpMessageConverter stringHttpMessageConverter;

    public BuildingDTO convertToBuildingDTO(BuildingEntity buildingEntity) {
       BuildingDTO buildingDTO = modelMapper.map(buildingEntity, BuildingDTO.class);
       return buildingDTO;
    }


    public BuildingSearchResponse convertToBuildingSearchResponse(BuildingEntity buildingEntity) {
       BuildingSearchResponse buildingSearchResponse = modelMapper.map(buildingEntity, BuildingSearchResponse.class);
        String address = "";
        if(buildingEntity.getStreet() != null && !buildingEntity.getStreet().isEmpty()){
            address += buildingEntity.getStreet();
        }
        if(buildingEntity.getWard() != null && !buildingEntity.getWard().isEmpty()) {
            if(buildingEntity.getStreet() != null && !buildingEntity.getStreet().isEmpty()){
                address +=",";
            }
            address += buildingEntity.getWard();
        }
        if(buildingEntity.getDistrict() != null && !buildingEntity.getDistrict().isEmpty()){
            if((buildingEntity.getWard() != null && !buildingEntity.getWard().isEmpty()) || (buildingEntity.getStreet() != null && !buildingEntity.getStreet().isEmpty())){
                address +=",";
            }
            address +=  buildingEntity.getDistrict().toLowerCase();
        }
        buildingSearchResponse.setAddress(address);
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
         String typeCode = buildingDTO.getTypeCode().stream().map(item -> item.toString()).collect(Collectors.joining(","));
         buildingEntity.setType(typeCode);
         return buildingEntity;
    }
}
