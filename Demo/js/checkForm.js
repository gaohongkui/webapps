function checkForm() {
	var obj = document.getElementById("username");
	if(obj.value == "") {
		alert("用户名不能为空哦！");
		obj.focus();
		return false;
	} else if(obj.value.indexOf(" ") != -1) {
		alert("用户名不能含有空格！");
		obj.focus();
		return false;
	}
	return checkValid();
}

function checkValid() {
	var obj = document.getElementById("password");
	var str = obj.value;
	var strlen = str.length;
	if(strlen > 15 || strlen < 6) {
		alert("密码长度不合法！");
		obj.focus();
		return false;
	} else if(str.indexOf(" ") != -1) {
		alert("密码不能含有空格！");
		obj.focus();
		return false;
	}
	return true;
}