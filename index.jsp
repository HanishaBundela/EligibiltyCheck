<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login </title>

<link href="https://fonts.googleapis.com/css2?family=Jost:wght@500&display=swap" rel="stylesheet">






<link href="./Static resources/css/bootstrap.min.css" rel="stylesheet" />
<script src="./Static resources/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"
	integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI="
	crossorigin="anonymous"></script>
<style>
body{
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	font-family: 'Jost', sans-serif;
    background: -webkit-linear-gradient(40deg, #00c6ff, #3931af);
}
.main{
	width: 400px;
	height: 500px;
	background: red;
	overflow: hidden;
	background: url("https://doc-08-2c-docs.googleusercontent.com/docs/securesc/68c90smiglihng9534mvqmq1946dmis5/fo0picsp1nhiucmc0l25s29respgpr4j/1631524275000/03522360960922298374/03522360960922298374/1Sx0jhdpEpnNIydS4rnN4kHSJtU1EyWka?e=view&authuser=0&nonce=gcrocepgbb17m&user=03522360960922298374&hash=tfhgbs86ka6divo3llbvp93mg4csvb38") no-repeat center/ cover;
	border-radius: 10px;
	box-shadow: 5px 20px 50px #000;
}
#chk{
	display: none;
}
.login{
	position: relative;
	width:100%;
	height: 100%;
}
label{
	color: #fff;
	font-size: 2.3em;
	justify-content: center;
	display: flex;
	margin: 60px;
	font-weight: bold;
	cursor: pointer;
	transition: .5s ease-in-out;
}
input{
	width: 60%;
	height: 20px;
	background: #e0dede; 
	justify-content: center;
	display: flex;
	margin: 20px auto;
	padding: 10px;
	border: none;
	outline: none;
	border-radius: 5px;
}
button{
	width: 60%;
	height: 40px;
	margin: 10px auto;
	justify-content: center;
	display: block;
	color: #fff;
	background: #3931af;
	font-size: 1em;
	font-weight: bold;
	margin-top: 20px;
	outline: none;
	border: none;
	border-radius: 5px;
	transition: .2s ease-in;
	cursor: pointer;
}
button:hover{
	background: #6d44b8;
}
.signup{
	height: 460px;
	background: #eee;
	border-radius: 60% / 10%;
	transform: translateY(-180px);
	transition: .8s ease-in-out;
}
.signup label{
	color: #3931af;
	transform: scale(.6);
}

#chk:checked ~ .signup{
	transform: translateY(-500px);
}
#chk:checked ~ .signup label{
	transform: scale(1);	
}
#chk:checked ~ .login label{
	transform: scale(.6);
}

</style>
</head>
<body>
	<div class="main">  	
		<input type="checkbox" id="chk" aria-hidden="true">

			

			<div class="login" >
				<form name="loginForm" action="CheckLogin.jsp" onsubmit="return validateForm()" method="POST">
					<label for="chk" aria-hidden="true">Login</label>
					<input type="email" name="logEmail" placeholder="Email">
					<input type="password" name="logPswd" placeholder="Password" >
					<button type="submit">Login</button>
				</form>
			</div>
			
			<div class="signup">
				<form name="signUpForm" action="SaveLogin.jsp" onsubmit="return validateForm()" method="POST">
					<label for="chk" aria-hidden="true">Sign up</label>
			<!-- 		<input type="text" name="txt" placeholder="User name" > -->
					<input type="email" name="email" placeholder="Email" >
					<input type="password" name="pswd" placeholder="Password" >
					<button >Sign up</button>
				</form>
			</div>
	</div>
</body>
</html>

<script>


</script>
</html>