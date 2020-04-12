//= require active_admin/base
//= require active_admin/sortable
//= require tinymce-jquery
//= require izitoast/dist/js/iziToast.js


$(function(){
  var elements = document.getElementsByClassName("col-link");
  
  var copyLink = function (){
    const el = document.createElement('textarea');
    str = this.innerText;
    el.value = str;
    document.body.appendChild(el);
    el.select();
    document.execCommand('copy');
    document.body.removeChild(el);
    iziToast.success({
      title: '복사 성공!',
      position: 'center',
      message: str,
    });
  };
  
  for (var i = 0; i < elements.length; i++) {
    elements[i].addEventListener('click', copyLink, false);
  }
})