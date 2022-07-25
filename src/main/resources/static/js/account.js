
function getPaymentHistory() {
    $.ajax({
        type : 'POST',
        url : '/history/reserve/'+ $("#usernum").val(),
        data : '',
        dataType : "JSON",
        beforeSend : function() {
            $("#paymentTable").empty();
        },
        success : function (data) {
            for (let i = 0; i < data.length; i++) {
                let reserve = data[i];
                let state;
                if (reserve['state'] == 'N') {
                    state = "예약취소"
                    let str = `
                    <tr class = "p-5 text-center">
                        <td id = ${reserve['orderId']}>${reserve['orderId']}</td>
                        <td>${reserve['exhibitionName']}</td>
                        <td>${reserve['reserveDate']}</td>
                        <td>${state}</td>
                    </tr>`;
                        $("#paymentTable").append(str);
                } else {
                    state = "예약완료"
                    let str = `
                    <tr class = "p-5 text-center">
                        <td id = ${reserve['orderId']}>${reserve['orderId']}</td>
                        <td>${reserve['exhibitionName']}</td>
                        <td>${reserve['reserveDate']}</td>
                        <td>${state}</td>
                        <td><button type="button" class="btn btn-outline-dark" id="btnDetail">상세보기</button></td>
                    </tr>`;
                    $("#paymentTable").append(str);
                }
            }
        }
    })
}