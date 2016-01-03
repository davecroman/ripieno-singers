package com.ripienosingers.utils;

import com.ripienosingers.model.BasicSection;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SectionMapper {

    public static Map<Integer, BasicSection> asMap(List<BasicSection> sections) {
        Map<Integer, BasicSection> map = new HashMap<>();

        for( BasicSection section : sections ) {
            map.put(section.getId(), section);
        }

        return map;
    }
}
