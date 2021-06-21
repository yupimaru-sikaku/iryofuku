// 預り金を入力したら次のフォームが出てくる
setInterval(() => {
  for (var i=0; i<6; i++){
    let priceEnd = document.querySelector(`.price_${i}_end`);
    let prices = document.getElementsByClassName(`price_${i+1}`);
    
    // price[0]が項目、[1]が値段
    if (priceEnd.value) {
      prices[0].hidden = false; 
      prices[1].hidden = false; 
    }
  }
}, 500);

// 預り金が既に入力されている場合は表示されるようにする
window.addEventListener('DOMContentLoaded', () => {
  for (var i=1; i<6; i++){
    let prices = document.getElementsByClassName(`price_${i}`);
    let priceSub = document.querySelector(`#gh_price_sub${i}`);
    
    // price[0]が項目、[1]が値段
    if (priceSub.value) {
      prices[0].hidden = false; 
      prices[1].hidden = false; 
    }
  }
})

// その他にチェックが入るとフォームが表示される
const validDisabilityOther = document.querySelector('#valid_disabilityその他');
const validDisabilityField = document.querySelector('.valid_disability_hidden_field');
const validDisabilityTextField = document.querySelector('.valid_disability_textfield');

const residentialStyleOther = document.querySelector('#residential_styleその他');
const residentialStyleField = document.querySelector('.residential_style_hidden_field');
const residentialStyleTextField = document.querySelector('.residential_style_textfield');

const staffWeekdayTimeOther = document.querySelector('#staff_weekdaytimeその他');
const staffWeekdayTimeField = document.querySelector('.staff_weekdaytime_hidden_field');
const staffWeekdayTimeTextField = document.querySelector('.staff_weekdaytime_textfield');

const barrierFreeTimeOther = document.querySelector('#barrier_freeその他');
const barrierFreeTimeField = document.querySelector('.barrier_free_hidden_field');
const barrierFreeTimeTextField = document.querySelector('.barrier_free_textfield');

setInterval(() => {
  if (validDisabilityOther.checked){
    validDisabilityField.hidden = false;
  }else{
    validDisabilityField.hidden = true;
    validDisabilityTextField.value = '';
  }

  if (residentialStyleOther.checked){
    residentialStyleField.hidden = false;
  }else{
    residentialStyleField.hidden = true;
    residentialStyleTextField.value = '';
  }

  if (staffWeekdayTimeOther.checked){
    staffWeekdayTimeField.hidden = false;
  }else{
    staffWeekdayTimeField.hidden = true;
    staffWeekdayTimeTextField.value = '';
  }

  if (barrierFreeTimeOther.checked){
    barrierFreeTimeField.hidden = false;
  }else{
    barrierFreeTimeField.hidden = true;
    barrierFreeTimeTextField.value = '';
  }
  
}, 500);

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


// 既存の画像を削除したいとき
// imagesの枚数を取得して
const ghEditImagesArray = [];

for(i=0;i<2;i++){
  let ghImagesDelete = document.querySelector(`.gh_images_delete_${i}`);
  let ghEditImages= document.querySelector(`.gh_edit_images_${i}`);
  ghEditImagesArray.push(ghEditImages)
}
  
for(i=0; i<ghEditImagesArray.length; i++){
  let ghImagesDelete = document.querySelector(`.gh_images_delete_${i}`);
  let ghEditImages_= document.querySelector(`.gh_edit_images_${i}`);

  ghImagesDelete.addEventListener('click', () => {
    ghEditImages_.remove();
  })
}
