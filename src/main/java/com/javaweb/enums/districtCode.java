package com.javaweb.enums;

import java.util.HashMap;
import java.util.Map;

public enum  districtCode {


    // khai báo dạng key(value)
    QUAN_1 ("Quận 1"),
    QUAN_2 ("Quận 2"),
    QUAN_3 ("Quận 3"),
    QUAN_4 ("Quận 4"),
    QUAN_5 ("Quận 5"),
    QUAN_6 ("Quận 6"),
    QUAN_7 ("Quận 7"),
    QUAN_8 ("Quận 8"),
    ;

    private final String districtName;


    // hàm khởi tạo của enum
    districtCode(String districtName) {
        this.districtName = districtName;
    }

    // hàm get value của enum
    public String getDistrictName() {
        return districtName;
    }


    // lấy enum ra theo dạng map
    public static Map<String,String> type(){
        Map<String,String> listType = new HashMap<>();
        for(districtCode item : districtCode.values()){
            listType.put(item.toString() , item.districtName);
        }
        return listType;
    }
}
