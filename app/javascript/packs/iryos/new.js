// ★★都道府県が増えたときにすること
// ①を追加。配列も追加
// ②を追加（区がある場合）
// ③を追加（区がある場合）
// ④を追加
// ⑤を追加（区がある場合）
// ⑥を追加
// ⑦を追加（区がある場合）
// ⑧を追加
// ⑨を追加
// ⑩を追加（区がない場合はsetIntervalいらない）

// 都道府県を選択するselect
let selectPrefecture = document.querySelector('[name="iryo[prefecture_id]"]');

// ①全体のdivダグ（都道府県別）
const hiddenOsakaCity = document.querySelector('.hidden_osaka_city');
const hiddenHyogoCity = document.querySelector('.hidden_hyogo_city');
const hiddenKyotoCity = document.querySelector('.hidden_kyoto_city');
const hiddenShigaCity = document.querySelector('.hidden_shiga_city');
const hiddenNaraCity = document.querySelector('.hidden_nara_city');
const hiddenWakayamaCity = document.querySelector('.hidden_wakayama_city');
const hiddenMieCity = document.querySelector('.hidden_mie_city');

const hiddenCityArray = [hiddenOsakaCity, hiddenHyogoCity, hiddenKyotoCity, hiddenShigaCity, hiddenNaraCity, hiddenWakayamaCity, hiddenMieCity]

// ②全体のdivダグ（区がある市）
const hiddenOsakaWard = document.querySelector('.hidden_osaka_ward');
const hiddenSakaiWard = document.querySelector('.hidden_sakai_ward');
const hiddenKobeWard = document.querySelector('.hidden_kobe_ward');
const hiddenKyotoWard = document.querySelector('.hidden_kyoto_ward');

const hiddenCityWardArray = [hiddenOsakaWard, hiddenSakaiWard, hiddenKobeWard, hiddenKyotoWard]

// ③「全体のdivダグ（都道府県別）」に入っている市のチェックボックス→ここをクリックすると区のチェックボックスが表示
const osakaCity = document.querySelector('.osaka_city_大阪市');
const sakaiCity = document.querySelector('.osaka_city_堺市');
const kobeCity = document.querySelector('.hyogo_city_神戸市');
const kyotoCity = document.querySelector('.kyoto_city_京都市');

const cityArray = [osakaCity, sakaiCity, kobeCity, kyotoCity]

// ④市町村郡を選択する欄で、市町村郡の全項目にチェックをつけるチェック（○○県全般ってやつ）
const osakaCityAll = document.querySelector('#osaka_city_all');
const hyogoCityAll = document.querySelector('#hyogo_city_all');
const kyotoCityAll = document.querySelector('#kyoto_city_all');
const shigaCityAll = document.querySelector('#shiga_city_all');
const naraCityAll = document.querySelector('#nara_city_all');
const wakayamaCityAll = document.querySelector('#wakayama_city_all');
const mieCityAll = document.querySelector('#mie_city_all');

const cityAllArray = [osakaCityAll, hyogoCityAll, kyotoCityAll, shigaCityAll, naraCityAll, wakayamaCityAll, mieCityAll]

// ⑤区を選択する欄で、各区の全項目にチェックをつけるチェック（○○市全般ってやつ）
const osakaCityWardAll = document.querySelector('#osaka_city_ward_all');
const sakaiCityWardAll = document.querySelector('#sakai_city_ward_all');
const kobeCityWardAll = document.querySelector('#kobe_city_ward_all');
const kyotoCityWardAll = document.querySelector('#kyoto_city_ward_all');

const cityWardAllArray = [osakaCityWardAll, sakaiCityWardAll, kobeCityWardAll, kyotoCityWardAll]

// ⑥市町村郡を選択する欄にある「○○県全般」の下にあるチェック項目すべて
const osakaCityGroup = document.getElementsByClassName('osaka_city_group');
const hyogoCityGroup = document.getElementsByClassName('hyogo_city_group');
const kyotoCityGroup = document.getElementsByClassName('kyoto_city_group');
const shigaCityGroup = document.getElementsByClassName('shiga_city_group');
const naraCityGroup = document.getElementsByClassName('nara_city_group');
const wakayamaCityGroup = document.getElementsByClassName('wakayama_city_group');
const mieCityGroup = document.getElementsByClassName('mie_city_group');

const cityGroupArray = [osakaCityGroup, hyogoCityGroup, kyotoCityGroup, shigaCityGroup, naraCityGroup, wakayamaCityGroup, mieCityGroup]

// ⑦区を選択する欄で、「○○市全般」の下にあるチェック項目すべて
const osakaCityWardGroup = document.getElementsByClassName('osaka_city_ward_group');
const sakaiCityWardGroup = document.getElementsByClassName('sakai_city_ward_group');
const kobeCityWardGroup = document.getElementsByClassName('kobe_city_ward_group');
const kyotoCityWardGroup = document.getElementsByClassName('kyoto_city_ward_group');

const cityWardGroupArray = [osakaCityWardGroup, sakaiCityWardGroup, kobeCityWardGroup, kyotoCityWardGroup]

// ⑧「○○全般」のチェックをつけるとその下の全てにチェックが付く
const checkAll = (group, all) => {
  all.addEventListener('click', () => {
    for (let i=0; i<group.length; i++){
      let element = group[i];
      element.checked = all
    }
  })
}
checkAll(osakaCityGroup, osakaCityAll);
checkAll(hyogoCityGroup, hyogoCityAll);
checkAll(kyotoCityGroup, kyotoCityAll);
checkAll(shigaCityGroup, shigaCityAll);
checkAll(naraCityGroup, naraCityAll);
checkAll(wakayamaCityGroup, wakayamaCityAll);
checkAll(mieCityGroup, mieCityAll);

checkAll(osakaCityWardGroup, osakaCityWardAll);
checkAll(sakaiCityWardGroup, sakaiCityWardAll);
checkAll(kobeCityWardGroup, kobeCityWardAll);
checkAll(kyotoCityWardGroup, kyotoCityWardAll);
//## 「○○全般」のチェックをつけるとその下の全てにチェックが付く

// ⑨一つでもチェックを外すと「○○全般」のチェックが外れる
const removeAllCheck = (group, all) => {
  for (let i=0; i<group.length; i++){
    let element = group[i];
    element.addEventListener('click', () => {
      all.checked = false;
    })
  }
}
removeAllCheck(osakaCityGroup, osakaCityAll);
removeAllCheck(hyogoCityGroup, hyogoCityAll);
removeAllCheck(kyotoCityGroup, kyotoCityAll);
removeAllCheck(shigaCityGroup, shigaCityAll);
removeAllCheck(naraCityGroup, naraCityAll);
removeAllCheck(wakayamaCityGroup, wakayamaCityAll);
removeAllCheck(mieCityGroup, mieCityAll);

removeAllCheck(osakaCityWardGroup, osakaCityWardAll);
removeAllCheck(sakaiCityWardGroup, sakaiCityWardAll);
removeAllCheck(kobeCityWardGroup, kobeCityWardAll);
removeAllCheck(kyotoCityWardGroup, kyotoCityWardAll);
//## 一つでもチェックを外すと「○○全般」のチェックが外れる

// 「○○全般」のチェックとその下にあるチェックすべてを解除
const removeGroupCheck = (group) => {
  for (let i=0; i<group.length; i++){
    let element = group[i];
    element.checked = false;
  }
}

// 「○○全般」のチェックとその下にあるチェックすべてを解除
const removeCheckAll = (all) => {
  all.checked = false
}
//##「○○全般」のチェックとその下にあるチェックすべてを解除

//  指定された都道府県の市一覧を表示させ、それ以外は非表示にする
const hiddenDiv = (existCity) => {
  let newhiddenCityArray = hiddenCityArray.filter(elements => {
    return elements !== existCity
  })
  newhiddenCityArray.forEach(hiddenCity => {
    hiddenCity.hidden = true
  })
  existCity.hidden = false
}

const allDone = (hiddenCity, cityGroup, cityAll, cityWardGroup_1, cityWardGroup_2, cityWardAll_1, cityWardAll_2, city_1, city_2,  hiddenCityWard_1, hiddenCityWard_2) => {
  
  hiddenDiv(hiddenCity);

  let newCityGroupArray = cityGroupArray.filter(cityGroupElements => {
    return cityGroupElements !==  cityGroup;
  })
  newCityGroupArray.forEach(cityGroupElement => {
    removeGroupCheck(cityGroupElement);
  })

  let newCityAllArray = cityAllArray.filter(cityAllElements => {
    return cityAllElements !==  cityAll;
  })
  newCityAllArray.forEach(cityAllElement => {
    removeCheckAll(cityAllElement);
  })
  
  let newCityWardGroupArray = cityWardGroupArray.filter(cityWardGroupElements => {
    return (cityWardGroupElements !==  cityWardGroup_1 && cityWardGroupElements !==  cityWardGroup_2);
  })
  newCityWardGroupArray.forEach(cityWardGroupElement => {
    removeGroupCheck(cityWardGroupElement);
  })
  
  let newCityWardAllArray = cityWardAllArray.filter(cityWardAllElements => {
    return (cityWardAllElements !==  cityWardAll_1 && cityWardAllElements !==  cityWardAll_2);
  })
  newCityWardAllArray.forEach(cityWardAllElement => {
    removeCheckAll(cityWardAllElement);
  })

  setInterval(() => {
    if (city_1.checked){
      hiddenCityWard_1.hidden = false;
    }else{
      hiddenCityWard_1.hidden = true;
    }
    if (city_2.checked){
      hiddenCityWard_2.hidden = false;
    }else{
      hiddenCityWard_2.hidden = true;
    }
    }, 500);
}

//##  指定された都道府県の市一覧を表示させ、それ以外は非表示にする
// ⑩
setInterval(() => {
  switch (selectPrefecture.value) {
    // 三重県を選択した場合
    case '24':
      allDone(hiddenMieCity, mieCityGroup, mieCityAll, "ダミー", "ダミー", "ダミー", "ダミー", "ダミー", "ダミー", "ダミー", "ダミー")
      break;
    // 滋賀県を選択した場合
    case '25':
      allDone(hiddenShigaCity, shigaCityGroup, shigaCityAll, "ダミー", "ダミー", "ダミー", "ダミー", "ダミー", "ダミー", "ダミー", "ダミー")
      break;
    // 京都府を選択した場合
    case '26':
      allDone(hiddenKyotoCity, kyotoCityGroup, kyotoCityAll, kyotoCityWardGroup, "ダミー", kyotoCityWardAll, "ダミー", kyotoCity, "ダミー",  hiddenKyotoWard, "ダミー",)
      break;
      // 大阪府を選択した場合
      case '27':
        allDone(hiddenOsakaCity, osakaCityGroup, osakaCityAll, osakaCityWardGroup, sakaiCityWardGroup, osakaCityWardAll, sakaiCityWardAll, osakaCity, sakaiCity, hiddenOsakaWard, hiddenSakaiWard)
        break;
    // 兵庫県を選択した場合
    case '28':
      allDone(hiddenHyogoCity, hyogoCityGroup, hyogoCityAll, kobeCityWardGroup, "ダミー", kobeCityWardAll, "ダミー", kobeCity, "ダミー", hiddenKobeWard, "ダミー")
      break;
    // 奈良県を選択した場合
    case '29':
      allDone(hiddenNaraCity, naraCityGroup, naraCityAll, "ダミー", "ダミー", "ダミー", "ダミー", "ダミー", "ダミー", "ダミー", "ダミー")
      break;
    // 和歌山県を選択した場合
    case '30':
      allDone(hiddenWakayamaCity, wakayamaCityGroup, wakayamaCityAll, "ダミー", "ダミー", "ダミー", "ダミー", "ダミー", "ダミー", "ダミー", "ダミー")
      break;
    default:
        allDone("", "", "", "", "", "", "", "", "", "", "")
      break;
      }
}, 100);