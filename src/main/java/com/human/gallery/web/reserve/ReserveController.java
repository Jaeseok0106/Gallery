package com.human.gallery.web.reserve;

import com.human.gallery.domain.exhibit.Exhibit;
import com.human.gallery.domain.exhibit.ExhibitRepository;
import com.human.gallery.domain.payment.PaymentRepository;
import com.human.gallery.domain.reserve.Reserve;
import com.human.gallery.domain.reserve.ReserveRepository;
import com.human.gallery.domain.user.UserRepository;
import com.human.gallery.domain.user.Users;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Controller
@Slf4j
@RequiredArgsConstructor
public class ReserveController {

    private final PaymentRepository paymentRepository;
    private final ExhibitRepository exhibitRepository;
    private final UserRepository userRepository;
    private final ReserveRepository reserveRepository;
    @GetMapping("/reserve/exhibit/{exhibitId}")
    public String viewcheckPay(@SessionAttribute(name = "user", required = false) Users user,
                               Model model,
                               @PathVariable("exhibitId") String exhibitId) {

        model.addAttribute("user", user);
        model.addAttribute("exhibitId", exhibitId);
        return "payment/checkPay";
    }

    @PostMapping("/reserve/exhibit/{exhibitId}")
    @ResponseBody
    public String returnExhibit(@PathVariable("exhibitId") int id,
                                @RequestParam("userId") String userId) {
        Exhibit exhibit = exhibitRepository.findById(id);
        Users userDetail = userRepository.findDetailById(userId);
        String uuid = UUID.randomUUID().toString();
        log.info("유저 정보 = {}", userDetail);
        JSONObject jO = new JSONObject();
        jO.put("name", exhibit.getName());
        jO.put("price", exhibit.getPrice());
        jO.put("total", exhibit.getTotal());
        jO.put("exhibitId", exhibit.getId());

        jO.put("userName", userDetail.getUsername());
        jO.put("address", userDetail.getAddress());
        jO.put("postcode", userDetail.getPostcode());
        jO.put("dtaddress", userDetail.getDtaddress());
        jO.put("orderId", uuid);
        log.info("예약 화면으로 넘어갈 값 = {}", jO);
        return jO.toJSONString();
    }

    @PostMapping("/reserve/add")
    @ResponseBody
    public void doAddReserve(@ModelAttribute Reserve reserve) {

        log.info("받은 값 = {}", reserve);
        reserveRepository.addReserve(reserve);
    }

    @PostMapping("/reserve/cancel")
    @ResponseBody
    public void doDeleteReserve(@RequestParam("orderId") String orderId) {
        reserveRepository.deleteById(orderId);
    }

    @PostMapping("/history/reserve/{userId}")
    @ResponseBody
    public String returnPaymentHistory(@PathVariable String userId) {
        log.info("넘어온 유저 아이디 번호 = {}", userId);
        List<Reserve> reserveList = reserveRepository.findByUserId(userId);
        log.info("예매 내역 = {}", reserveList);
        JSONArray jA = new JSONArray();
        for (int i = 0; i < reserveList.size(); i++) {
            Reserve reserve = reserveList.get(i);
            JSONObject jO = new JSONObject();
            jO.put("orderId", reserve.getOrderId());
            jO.put("exhibitionName", reserve.getExhibitName());
            jO.put("reserveDate", reserve.getReserveDate());
            jO.put("state", reserve.getIsPayment());
            jA.add(jO);
        }
        return jA.toJSONString();
    }

    @PostMapping("/history/reserve/detail/{orderId}")
    @ResponseBody
    public String returnPaymentByOrderId(@PathVariable("orderId") String orderId,
                                         @RequestParam("userId") String userId) {
        log.info("받은 orderId 값 = {}", orderId);
        Reserve reserve = reserveRepository.findByIdWithUserId(orderId, userId);
        JSONObject jO = new JSONObject();
        JSONArray jA = new JSONArray();
        jO.put("orderId", reserve.getOrderId());
        jO.put("exhibitionName", reserve.getExhibitName());
        jO.put("reserveDate", reserve.getReserveDate());
        jO.put("representName", reserve.getUserName());
        jO.put("person", reserve.getPerson());
        jO.put("state", reserve.getIsPayment());
        jO.put("address", reserve.getAddress());
        jO.put("postcode", reserve.getPostcode());
        return jO.toJSONString();
    }
    @PostMapping("/history/reserve/delete/{orderId}")
    @ResponseBody
    public String deletePaymentByOrderId(@PathVariable("orderId") String orderId) {
        log.info("제대로 넘어왔는가 = {}", orderId);
        paymentRepository.deleteById(orderId);
        log.info("여긴가?");
        reserveRepository.updateStateByOrderId(orderId);
        return "true";
    }

    @PostMapping("/history/reserve/today")
    @ResponseBody
    public Object returnTodayReserve(@RequestParam("userId") String userId,
                                     @RequestParam("date") String today) {
        log.info("받은 값 = {} {}", userId, today);
        Reserve reserve = reserveRepository.findByDateWithUserId(userId, today);
        log.info("검색 후 넘어온 값 = {}", reserve);
        return reserve;
    }

    @PostMapping("/history/reserve/thisWeek")
    @ResponseBody
    public Object returnWeekReserve(@RequestParam("userId") String userId,
                                    @RequestParam("startDate") String start,
                                    @RequestParam("endDate") String end) {

        log.info("입력받은 값 = {}, {}", start, end);
        ArrayList<Reserve> reserve = reserveRepository.findWeekByDateWithUserId(userId, start, end);
        log.info("넘어온 값 = {}", reserve);
        return reserve;
    }
    @PostMapping("/history/reserve/thisMonth")
    @ResponseBody
    public Object returnMonthReserve(@RequestParam("userId") String userId,
                                     @RequestParam("startDate") String start,
                                     @RequestParam("endDate") String end) {

        ArrayList<Reserve> reserve = reserveRepository.findWeekByDateWithUserId(userId, start, end);
        return reserve;

    }
}
