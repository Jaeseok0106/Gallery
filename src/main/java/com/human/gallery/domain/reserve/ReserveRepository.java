package com.human.gallery.domain.reserve;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReserveRepository {

    void addReserve(Reserve reserve);
    void deleteById(String orderId);
    Reserve findById(String orderId);
}
