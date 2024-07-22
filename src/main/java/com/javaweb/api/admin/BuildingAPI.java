package com.javaweb.api.admin;

import com.javaweb.converter.BuildingConverter;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
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

    // future: them moi
    @PostMapping
    @Transactional
    public void btnAddOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO){
        BuildingEntity buildingEntity = buildingConverter.convertToBuildingEntity(buildingDTO);
        if(buildingEntity.getId() != null){
            entityManager.merge(buildingEntity);
        } else {
            entityManager.persist(buildingEntity);
        }

    }





    @DeleteMapping
    public void deleteListBuilding(@RequestBody List<Long> listId){
        // xuong database de xoa
        System.out.println("okeee");
    }

}
