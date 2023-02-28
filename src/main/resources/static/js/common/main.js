$(document).ready()
{
  //세션 있으면 정보 요청 후 띄워주기
  window.ajax.request("/user/info",{},(result)=>{
    if(result)
    {
      $("#nickname").text(`${result.nickname}님 안녕하세요!`);
    }
  })
  
}
