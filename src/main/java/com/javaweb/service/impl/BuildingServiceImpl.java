package com.javaweb.service.impl;

import com.javaweb.converter.BuildingConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.enums.buildingType;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.model.response.TypeCodeResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.security.KeyStore;
import java.util.*;

@Service
@Transactional
public class BuildingServiceImpl implements BuildingService {

    @Autowired
    private BuildingRepository buildingRepository;


    @Autowired
    private BuildingConverter buildingConverter;

    @Autowired
    private UserRepository userRepository;

    @PersistenceContext
    private EntityManager entityManager;
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

    @Override
    public void deleteBuildingById(List<Long> listId) {
        buildingRepository.deleteByIdIn(listId);
    }

    @Override
    public void addOrUpdateBuilding(BuildingEntity buildingEntity) {
         buildingRepository.save(buildingEntity);
    }

    @Override
    public ResponseDTO staffList(Long buildingId) {
        ResponseDTO responseDTO = new ResponseDTO();
        BuildingEntity buildingEntity = buildingRepository.findById(buildingId).get();   // timf building theo id
        List<UserEntity> userEntityList = userRepository.findByStatusAndRoles_Code(1, "STAFF"); // tìm tất cả các staff hiện có
        List<UserEntity> userAssignmentList = buildingEntity.getUserEntityList();   // tim cacs user dang assignment co toa nha nay
        List<StaffResponseDTO> staffResponseDTOList = new ArrayList<>();
        for (UserEntity userEntity : userEntityList) {
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(userEntity.getFullName());
            staffResponseDTO.setStaffId(userEntity.getId());
            if(userAssignmentList.contains(userEntity)) {                             // nếu trong list assignment có staff dang xét thì đánh dau là checked
                staffResponseDTO.setChecked("checked");
            }
            staffResponseDTOList.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOList);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    public ResponseDTO typeList(Long buildingId) {
        BuildingEntity buildingEntity = buildingRepository.findById(buildingId).get();
        String type = buildingEntity.getType();
        ResponseDTO responseDTO = new ResponseDTO();
        List<TypeCodeResponseDTO> typeCodeResponseDTOList = new ArrayList<>();
        Map<String, String> typeCodeEnum = buildingType.type();
        for(Map.Entry<String, String> item : typeCodeEnum.entrySet()){
            TypeCodeResponseDTO typeCodeResponseDTO = new TypeCodeResponseDTO();
            typeCodeResponseDTO.setCode(item.getKey());
            typeCodeResponseDTO.setName(item.getValue());
            if(type.contains(item.getKey())){
                typeCodeResponseDTO.setChecked("checked");
            }
            typeCodeResponseDTOList.add(typeCodeResponseDTO);
        }
        responseDTO.setData(typeCodeResponseDTOList);
        return responseDTO;
    }

    @Override
    public void updateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
        List<Long> staffIdList = assignmentBuildingDTO.getStaffs();
        BuildingEntity buildingEntity = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
        List<UserEntity> userEntityList = new ArrayList<>();
        for(Long id : staffIdList) {
            UserEntity userEntity = userRepository.findById(id).get();
            userEntityList.add(userEntity);
        }
        buildingEntity.setUserEntityList(userEntityList);
        entityManager.merge(buildingEntity);
    }
}
