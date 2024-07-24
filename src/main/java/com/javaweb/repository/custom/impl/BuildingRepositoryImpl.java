package com.javaweb.repository.custom.impl;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.stereotype.Repository;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {
    // có th dùng EXIST trong mysql:
    // SELECT column_name(s)
    // FROM table_name
    // WHERE EXISTS
    // (SELECT column_name FROM table_name WHERE condition);
    // dùng nó sẽ ko cần join




    // Stream trong java raats mạnh
    // thay thế cho duyệt
    // hay dùng: String areaResult = rentAreaEntities.stream().map(item -> item.getValue().toString()).collect(Collectors.joining(","));


    @PersistenceContext
    private EntityManager entityManager;

    public static void joinTable(BuildingSearchRequest buildingSearchRequest, StringBuilder sql) {
        Long staffId = buildingSearchRequest.getStaffId();
        if (staffId != null) {
            sql.append(" inner join assignmentbuilding on b.id = assignmentbuilding.id ");
        }
        Long areaFrom = buildingSearchRequest.getAreaFrom();
        Long areaTo = buildingSearchRequest.getAreaTo();
        if(areaFrom != null || areaTo != null) {
            sql.append(" inner join rentarea on rentarea.buildingid = b.id ");
        }


    }

    public static void normalQuery(BuildingSearchRequest buildingSearchRequest, StringBuilder where) {
        try{
            Field[] fields = buildingSearchRequest.getClass().getDeclaredFields();
            for(Field item : fields){
                item.setAccessible(true);
                String fieldName = item.getName();		// laays key
                if(!fieldName.equals("staffId") && !fieldName.equals("areaTo") && !fieldName.equals("areaFrom") && !fieldName.equals("typeCode") && !fieldName.equals("rentPriceFrom")
                        && !fieldName.equals("rentPriceTo")) {
                    Object value = item.get(buildingSearchRequest);
                    if(value != null && !value.equals("")){
                        if(item.getType().getTypeName().equals("java.lang.long")){
                            where.append(" AND b." + fieldName + " = " +value);
                        } else {
                            where.append(" AND b." + fieldName + " like '%" + value + "%' " );
                        }
                    }
                }

            }
        } catch (Exception ex){
            ex.printStackTrace();
        }
    }
    public static void specialQuery(BuildingSearchRequest buildingSearchRequest, StringBuilder where) {
        Long staffId = buildingSearchRequest.getStaffId();
        if (staffId != null) {
            where.append(" AND assignmentbuilding.staffid = " + staffId);
        }
        Long areaFrom = buildingSearchRequest.getAreaFrom();
        Long areaTo = buildingSearchRequest.getAreaTo();
        if (areaFrom != null || areaTo != null) {
            if(areaFrom != null){
                where.append(" AND rentarea.value >= " + areaFrom);
            }
            if(areaTo != null){
                where.append(" AND rentarea.value <= "+ areaTo);
            }
        }
        Long rentPriceFrom = buildingSearchRequest.getRentPriceFrom();
        Long rentPriceTo = buildingSearchRequest.getRentPriceTo();;
        if (rentPriceFrom != null || rentPriceTo != null) {
            if(rentPriceFrom != null){
                where.append(" AND b.rentprice >= " + rentPriceFrom);
            }
            if(rentPriceTo != null){
                where.append(" AND b.rentprice <= "+ rentPriceTo);
            }
        }

        List<String> typeCode = buildingSearchRequest.getTypeCode();

        if(typeCode != null && !typeCode.isEmpty()){
            //String typeCodeResult = typeCode.stream().map(item -> item.toString()).collect(Collectors.joining(","));
            for(String item : typeCode){
                where.append(" and b.type like '%"+item+"%' ");
            }

        }


    }




    @Override
    public List<BuildingEntity> findAll(BuildingSearchRequest buildingSearchRequest) {

        List<BuildingEntity> result = new ArrayList<>();
        StringBuilder sql = new StringBuilder("select b.*  from building b  ");
        joinTable(buildingSearchRequest, sql);
        StringBuilder where = new StringBuilder(" where 1=1 ");
        normalQuery(buildingSearchRequest, where);
        specialQuery(buildingSearchRequest, where);
        where.append(" group by b.id; ");
        sql.append(where);
        System.out.println(sql.toString());
        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList();
    }


//
//
//    public void deleteBuilding(BuildingEntity buildingEntity){
//
//    }
}