function sendEmail(e){
    let con = confirm('이메일을 보내시겠습니까?');
    if(con == true){
        alert('이메일 발송 완료!');
        location.href="../aws/email";
    }else{
        alert('이메일 발송을 취소하였습니다!');
        e.preventDefalut();
    }
}