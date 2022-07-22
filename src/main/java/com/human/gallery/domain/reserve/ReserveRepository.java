package com.human.gallery.domain.reserve;

import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface ReserveRepository {

    void addReserve(Reserve reserve);
    void deleteById(String orderId);
    Reserve findById(String orderId);
    void updatePaymentById(String orderId);
    ArrayList<Reserve> findByUserId(String userId);
    Reserve findByIdWithUserId(String orderId, String userId);
    void updateStateByOrderId(String orderId);
}
