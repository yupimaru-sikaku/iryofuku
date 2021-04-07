// 住所自動入力
$(function(){
  $('#address_btn').on('click', (event) => {
    event.preventDefault();
    $.ajax({
      url: "//zipcloud.ibsnet.co.jp/api/search?zipcode=" + $('#postal_code').val(),
      dataType: 'jsonp',
    }).done((data) => {
      if (data.results) { 
        getData(data.results[0]);
      } else {
        alert('該当データが見つかりません');
      }
    }).fail((data) => {
      alert('通信に失敗しました');
    });
  });

  function getData(data) {
    $('#address_city').val(data.address1 + data.address2 + data.address3);
  }
});