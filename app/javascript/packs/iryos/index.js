// 市区町村のセレクトボックス全体のDiv（先頭だけ取得なので注意）
const iryoSearchForm = document.querySelector('.iryo_search_form');

// 都道府県を選択するselectのdiv
let selectPrefectureDiv = document.querySelector(".iryo_search_form");
// 都道府県を選択するselect
let selectPrefecture = document.querySelector('[name="search[prefecture_id]"]');

// 各都道府県別の市町村郡を選択するselect
const selectOsakaCity = document.querySelector('[name="search[osaka_city_id]"]');
const selectHyogoCity = document.querySelector('[name="search[hyogo_city_id]"]');
const selectKyotoCity = document.querySelector('[name="search[kyoto_city_id]"]');
const selectShigaCity = document.querySelector('[name="search[shiga_city_id]"]');
const selectNaraCity = document.querySelector('[name="search[nara_city_id]"]');
const selectWakayamaCity = document.querySelector('[name="search[wakayama_city_id]"]');
const selectMieCity = document.querySelector('[name="search[mie_city_id]"]');

const selectCityArray = [selectOsakaCity, selectHyogoCity, selectKyotoCity, selectShigaCity, selectNaraCity, selectWakayamaCity, selectMieCity]

// 各県の市町村郡のセレクトボックス
const osakaCity = document.querySelector('.osaka_city');
const hyogoCity = document.querySelector('.hyogo_city');
const kyotoCity = document.querySelector('.kyoto_city');
const shigaCity = document.querySelector('.shiga_city');
const naraCity = document.querySelector('.nara_city');
const wakayamaCity = document.querySelector('.wakayama_city');
const mieCity = document.querySelector('.mie_city');

const cityArray = [osakaCity, hyogoCity, kyotoCity, shigaCity, naraCity, wakayamaCity, mieCity];

// 指定された都道府県の市町村郡のセレクトボックスを表示させ、それ以外は非表示にする
const hiddenCity = (existCity, existSelectCity) => {
  
  existCity.hidden = false
  
  let newCityArray = cityArray.filter(elements => {
    return elements !== existCity
  })
  // 指定された以外の都道府県別の市区町村のセレクトボックスは削除
  newCityArray.forEach(hiddenCity => {
    hiddenCity.remove()
  })
  // 指定されたセレクトボックスのクラス名を取得
  let prefectureName = existCity.className.replace("hidden_field ", "")
  // クラス名が存在しなければ都道府県セレクトボックスの下に市区町村のセレクトボックスを挿入
  if (document.querySelector(`.${prefectureName}`) == null){
    iryoSearchForm.insertAdjacentElement('afterend', existCity)
  }
  // 選択されていない各都道府県のセレクトボックスは初期化
  let newSelectCityArray = selectCityArray.filter(elements => {
    return elements !== existSelectCity
  })
  newSelectCityArray.forEach(selectCity => {
    selectCity.value = "";
  })
  
}

setInterval(() => {
  switch(selectPrefecture.value){
    // 三重県を選択した場合
    case '24':
      hiddenCity(mieCity, selectMieCity);
      break;
    // 滋賀県を選択した場合
    case '25':
      hiddenCity(shigaCity, selectShigaCity);
      break;
    // 京都府を選択した場合
    case '26':
      hiddenCity(kyotoCity, selectKyotoCity);
      break;
    // 大阪府を選択した場合  
    case '27':
      hiddenCity(osakaCity, selectOsakaCity);
      break;
    // 兵庫県を選択した場合
    case '28':
      hiddenCity(hyogoCity, selectHyogoCity);
      break;
    // 奈良県を選択した場合
    case '29':
      hiddenCity(naraCity, selectNaraCity);
      break;
    // 和歌山県を選択した場合
    case '30':
      hiddenCity(wakayamaCity, selectWakayamaCity);
      break;
    default:
      hiddenCity("", "");
      break;
  }
}, 100);