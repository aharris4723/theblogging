var a = document.getElementById('signup_check');
var b = document.getElementById('signup_password');

a.addEventListener("submit", function() {
    let b = signup_password.value;
    var temp = false;
    for (var i = 0; i < 10; i++) {
        if (b.indexOf(i) >= 0) {
            var temp = true;
        } 

    }
    if (temp == true) {
        a.submit()
    } else if (temp == false) {
        event.preventDefault();
        alert("your password does not contain a number")
    }
})
