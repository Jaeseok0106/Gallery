package com.human.gallery.domain.mypage;

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

@Controller
@Slf4j
@RequiredArgsConstructor
public class mypageController {

    @GetMapping("/mypage")
    public String mypage(@SessionAttribute(name = "user", required = false) Users user, Model model ) {
        model.addAttribute("user", user);
        return "mypage/mypage";
    }
    private final PaymentRepository paymentRepository;
    private final ExhibitRepository exhibitRepository;
    private final UserRepository userRepository;
    private final ReserveRepository reserveRepository;


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
        ArrayList<Reserve> reserve = reserveRepository.findByDateWithUserId(userId, today);
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
    @PostMapping("/history/reserve/date")
    @ResponseBody
    public Object returnReserve(@RequestParam("userId") String userId,
                                @RequestParam("startDate") String start,
                                @RequestParam("endDate") String end) {
        ArrayList<Reserve> reserve = reserveRepository.findWeekByDateWithUserId(userId, start, end);
        return reserve;
    }
//    @PostMapping("/mypage/update")
//    public String domypageupdate(@RequestParam("userId") String userId,
//                                 @RequestParam("password") String password) throws NoSuchAlgorithmException {
//        Users user = userRepository.mypage(userId,password);
//        if (user == null)
//        {
//            return "users/login";
//        }
//        return "redirect:";
//    }
}
