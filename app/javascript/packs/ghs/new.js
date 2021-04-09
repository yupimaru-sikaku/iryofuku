// // 預り金を入力したら次のフォームが出てくる
for (var i=0; i<6; i++){
  let priceEnd = document.querySelector(`.price_${i}_end`);
  let prices = document.getElementsByClassName(`price_${i+1}`);
  
  priceEnd.addEventListener('input', () => {
    for (var i=0; i<prices.length; i++){
      let priceSub = prices[i];
      priceSub.hidden = false; 
    }
  })
}
// //預り金を入力したら次のフォームが出てくる

// disability チェックの全選択、解除
const disabilityAll = document.querySelector('.disability_all');
const disabilityTests = document.getElementsByClassName('disability_test');

// 「全て選択」チェックで全てにチェック付く
disabilityAll.addEventListener('click', () => {
  for (var i=0; i<disabilityTests.length; i++){
    let test = disabilityTests[i];
    test.checked = disabilityAll;
  }
});

// 一つでもチェックを外すと「全て選択」のチェック外れる
for (var i=0; i<disabilityTests.length; i++){
  let disability_test = disabilityTests[i];
  disability_test.addEventListener('click', () => {
    disabilityAll.checked = false;
  })
}

// staff_holiday_timeチェックの全選択、解除
const staffHolidayTimeAll = document.querySelector('.staff_holidaytime_all');
const staffHolidayTimeTests = document.getElementsByClassName('staff_holidaytime_test');

staffHolidayTimeAll.addEventListener('click', () => {
  for (var i=0; i<staffHolidayTimeTests.length; i++){
    let test = staffHolidayTimeTests[i];
    test.checked = staffHolidayTimeAll;
  }
});

for (var i=0; i<staffHolidayTimeTests.length; i++){
  let disability_test = staffHolidayTimeTests[i];
  disability_test.addEventListener('click', () => {
    staffHolidayTimeAll.checked = false;
  })
}

// residentialstyle その他チェックでテキスト入力できるように
const residentialStyleOther = document.querySelector('#residential_styleその他');
const residentialStyleTextField = document.querySelector('.residential_style_textfield')

residentialStyleOther.addEventListener('click', () => {
  
  residentialStyleTextField.disabled = false;
  residentialStyleTextField.hidden = false;
  
})

const residentialStyles = document.getElementsByClassName('residential_style')

for (var i=0; i<residentialStyles.length; i++){
  let residentialStyle = residentialStyles[i];

  residentialStyle.addEventListener('click', () => {
    residentialStyleTextField.disabled = true;
    residentialStyleTextField.hidden = true;
  })
}

//  staff_weekdaytimeその他チェックでテキスト入力できるように
const staffWeekdayTimeOther = document.querySelector('#staff_weekdaytimeその他');
const staffWeekdayTimeTextField = document.querySelector('.staff_weekdaytime_textfield')

staffWeekdayTimeOther.addEventListener('click', () => {
  
  staffWeekdayTimeTextField.disabled = false;
  staffWeekdayTimeTextField.hidden = false;
  
})

const staffWeekdays = document.getElementsByClassName('staff_weekdaytime')

for (var i=0; i<staffWeekdays.length; i++){
  let staffWeekday = staffWeekdays[i];
  
  staffWeekday.addEventListener('click', () => {
    staffWeekdayTimeTextField.disabled = true;
    staffWeekdayTimeTextField.hidden = true;
  })
}

//  barrier_freeその他チェックでテキスト入力できるように（ラジオボタン）
const barrierFreeOther = document.querySelector('#barrier_freeその他');
const barrierFreeTextField = document.querySelector('.barrier_free_textfield')

barrierFreeOther.addEventListener('click', () => {
  
  barrierFreeTextField.disabled = false;
  barrierFreeTextField.hidden = false;
  
})

const barrierFrees = document.getElementsByClassName('barrier_free')

for (var i=0; i<barrierFrees.length; i++){
  let staffWeekday = barrierFrees[i];
  
  staffWeekday.addEventListener('click', () => {
    barrierFreeTextField.disabled = true;
    barrierFreeTextField.hidden = true;
  })
}


//  valid_disabilityその他チェックでテキスト入力できるように（チェックボタン）
const validDisabilityOther = document.querySelector('#valid_disabilityその他');
const validDisabilityTextField = document.querySelector('.valid_disability_textfield');

validDisabilityOther.addEventListener('click', () => {
  validDisabilityTextField.disabled = false;
})

// パンフレットのプレビュー
document.addEventListener('DOMContentLoaded', function(){
  const fileField = document.querySelector('#gh_image');
  const imageLists = document.querySelector('.image-lists');
  const dataBox = new DataTransfer();
  const inputLabel = document.querySelector('.gh_image_label');
  
  fileField.addEventListener('change', (e) =>{
    file = e.target.files[0];
    blob = window.URL.createObjectURL(file);
    dataBox.items.add(file);

    fileField.files = dataBox.files

    if (fileField.files.length == 6){
      inputLabel.style.display = 'none';
    }
    
    const blobDiv = document.createElement('div');
    blobDiv.setAttribute('class', 'image-list');
    
    // const blobImage = document.createElement('img');
    // blobImage.setAttribute('src', blob);
    // blobImage.setAttribute('id', file.name);

    const blobImage = document.createElement('iframe');
    blobImage.setAttribute('src', blob);
    
    const deleteButton = document.createElement('p')
    deleteButton.setAttribute('class', 'delete');
    deleteButton.innerHTML = '削除';
    
    blobDiv.appendChild(blobImage);
    blobDiv.appendChild(deleteButton);
    imageLists.appendChild(blobDiv);
    
    deleteButton.addEventListener('click', function(){
      const deleteDiv = deleteButton.parentNode;
      const deleteImg = deleteButton.previousElementSibling;
      
      if (fileField.files.length == 1){
        deleteDiv.remove();
        fileField.value = "";
        dataBox.clearData();
        
      }else{
        
        Array.from(fileField.files).forEach(function(files, i){
          if (files.name == deleteImg.id){
            dataBox.items.remove(i);
            fileField.files = dataBox.files
          }
        });
      }
      deleteDiv.remove();

      if (fileField.files.length < 6){
        inputLabel.style.display = 'block';
      }
    })
  })
})