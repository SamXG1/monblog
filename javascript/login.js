const form = document.querySelector(".login form");
continueBtn = form.querySelector(".button input");
errotText = form.querySelector(".error-text");

form.onsubmit = (e)=>{
    e.preventDefault();
}

continueBtn.onclick = ()=>{
    let xhr = new XMLHttpRequest(); // creating xml object
    xhr.open("POST", "php/login.php", true);
    xhr.onload = ()=>{
        if(xhr.readyState === XMLHttpRequest.DONE){
            if(xhr.status === 200){
                let data = xhr.response;
                if(data == "success"){
                    location.href = "index.php";
                }else{
                    errotText.textContent = data;
                    errotText.style.display = "block";
                }
            }
        }
    }

    // sending form data through ajax to php

    let formData = new FormData(form); //creating new formdata object

    xhr.send(formData); //sending this form data to php
}