<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Form</title>
<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"
		integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI="
		crossorigin="anonymous"></script>
<link href="./Static resources/css/bootstrap.min.css" rel="stylesheet" />
<script src="./Static resources/js/bootstrap.bundle.min.js"></script>
<style>
.register {
	background: -webkit-linear-gradient(left, #3931af, #00c6ff);
/* 	margin-top: 3%; */
	padding: 1.5%;
}

.register-left {
	text-align: center;
	color: #fff;
	margin-top: 4%;
}

.register-left input {
	
	
	padding: 2%;
	width: 60%;
	background: -webkit-linear-gradient(40deg, #00c6ff, #3931af);
	font-weight: bold;
	color: #383d41;
	margin-top: 30%;
	margin-bottom: 3%;
	cursor: pointer;
}

.register-right {
	background: #f8f9fa;
	border-top-left-radius: 10% 50%;
	border-bottom-left-radius: 10% 50%;
}

.register-left img {
	margin-top: 35%;
	margin-bottom: 5%;
	width: 290px;
	height:290px;
	
	-webkit-animation: mover 2s infinite alternate;
	animation: mover 1s infinite alternate;
}

@
-webkit-keyframes mover { 0% {
	transform: translateY(0);
}

100
%
{
transform
:
translateY(
-20px
);
}
}
@
keyframes mover { 0% {
	transform: translateY(0);
}

100
%
{
transform
:
translateY(
-20px
);
}
}
.register-left p {
	font-weight: lighter;
	padding: 12%;
	margin-top: -9%;
}

.register .register-form {
	/* padding: 10%;
	margin-top: 10%; */
	    padding: 56px;
}

.btnRegister {
	float: right;
	margin-top: 10%;
	border: none;
	border-radius: 1.5rem;
	padding: 2%;
	background: #0062cc;
	color: #fff;
	font-weight: 600;
	width: 50%;
	cursor: pointer;
}

/* .register .nav-tabs {
	margin-top: 3%;
	border: none;
	background: #0062cc;
	border-radius: 1.5rem;
	width: 28%;
	float: right;
}

.register .nav-tabs .nav-link {
	padding: 2%;
	height: 34px;
	font-weight: 600;
	color: #fff;
	border-top-right-radius: 1.5rem;
	border-bottom-right-radius: 1.5rem;
}

.register .nav-tabs .nav-link:hover {
	border: none;
}

.register .nav-tabs .nav-link.active {
	width: 100px;
	color: #0062cc;
	border: 2px solid #0062cc;
	border-top-left-radius: 1.5rem;
	border-bottom-left-radius: 1.5rem;
}
 */
.register-heading {
	text-align: center;
	margin-top: 8%;
	margin-bottom: -15%;
	color: #495057;
}

.bcolor{
background: -webkit-linear-gradient(left, #3931af, #00c6ff);
color: white;
}


</style>
</head>

<body>


	<div class=" register">
		<div class="row">
			<div class="col-sm-3 register-left">
			<h3>Welcome</h3>
				<p>You are 30 seconds away from earning your own money!</p>
				<img src="./Static resources/image/undraw_remotely_2j6y.svg" alt="" />
				
				<!-- <input type="submit" name="" value="Login" /><br /> -->
			</div>
			<div class="col-sm-9 register-right">
				<!-- <ul class="nav nav-tabs nav-justified" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active" id="home-tab"
						data-toggle="tab" href="#home" role="tab" aria-controls="home"
						aria-selected="true">Employee</a></li>
					<li class="nav-item"><a class="nav-link" id="profile-tab"
						data-toggle="tab" href="#profile" role="tab"
						aria-controls="profile" aria-selected="false">Hirer</a></li>
				</ul> -->
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel"
						aria-labelledby="home-tab">
						<!-- <h3 class="register-heading">	Registration Form</h3> -->
						<div class="row register-form">
						
							
							<form name="myForm" action="SaveEmp.jsp"
									onsubmit="return validateForm()" method="POST">
								
									<!-- 	<div class="card shadow-lg p-3 mb-5 rounded" style="width: 60rem;"> -->
									<div class="row mt-3">
										<div class="col-sm ">
											<div class="form-group row  ">
												<label class=" form-label label  lcolor">Name</label>
												<div class="ml-4">
													<input type="text" class="form-control  " id="name"
														name="name" required="">
												</div>
											</div>
										</div>
										<div class="col-sm">
											<div class="form-group row">
												<label class=" form-label label lcolor">Email</label>
												<div class="">
													<input type="Email" class="form-control  ml-4 "
														id="email" name="email">
												</div>
											</div>
										</div>
									</div>
									<div class="row mt-3 ">
									
									
									
										<div class="col-sm-4">
											<div class="form-group row ">
												<label class="form-label label lcolor">Phone
													No.</label>
												<div >
													<input type="text" class="form-control ml-4"
														id="Phone" name="phoneNo">
												</div>
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group row ">
												<label class="cform-label label lcolor">Age</label>
												<div class="">
													<input type="Number" class="form-control ml-4"
														id="age" name="age" placeholder="" value="">
												</div>
											</div>
										</div>
										<div class="col-sm-4">
											<div class="label lcolor">Gender</div>
											<div class=" mt-3">
												<div class="form-check form-check-inline">
													<input class="form-check-input bcolor gender" type="radio"
														name="gender" id="" value="Female"> <label
														class="form-check-label " for="inlineRadio1">Female</label>
												</div>
												<div class="form-check form-check-inline ">
													<input class="form-check-input bcolor gender" type="radio"
														name="gender" id="" value="Male"> <label
														class="form-check-label " for="inlineRadio2">Male</label>
												</div>
												<div class="form-check form-check-inline">
													<input class="form-check-input bcolor gender" type="radio"
														name="gender" id="" value="Other"> <label
														class="form-check-label" for="">Other</label>
												</div>
											</div>
										</div>
									</div>
									<div class="row mt-3">
										
									</div>
									<div class="row mt-3">
										<div class="col-sm">
											<div class="row">
												<div class="col-sm-5">
													<label class="lcolor">Highest Qualification</label>
												</div>
												<div class="col-sm">
													<div class="dropdown">
														<button type="button"
															class="bcolor dropdown-toggle form-control "
															data-bs-toggle="dropdown" id="qualification">--Select--</button>
														<input id="selected_qualification" name="qualification"
															type="hidden"></input>
														<ul class="dropdown-menu">
															<li><a class="dropdown-item"
																onclick="selectQualification(this)" href="#">Higher
																	Secondary</a></li>
															<li><a class="dropdown-item"
																onclick="selectQualification(this)" href="#">Graduation</a></li>
															<li><a class="dropdown-item"
																onclick="selectQualification(this)" href="#">Post
																	Graduation</a></li>
														</ul>
													</div>


												</div>
											</div>
										</div>
										<div class="col-sm">
										
												<div class="drop-down  ">
													<div class="dropdown">
														<div class="row">
															<div class="col-sm-4">
																<label class="lcolor">Location</label>
															</div>
															<div class="col-sm">
																<button type="button"
																	class="bcolor  dropdown-toggle form-control "
																	data-bs-toggle="dropdown" id="location">--Select--</button>
																<input id="selected_location" name="location"
																	type="hidden"></input>
																<ul class="dropdown-menu">
																	<li><a class="dropdown-item"
																		onclick="selectLocation(this)" href="#">Delhi</a></li>
																	<li><a class="dropdown-item"
																		onclick="selectLocation(this)" href="#">Mumbai</a></li>
																	<li><a class="dropdown-item"
																		onclick="selectLocation(this)" href="#">Banglore</a></li>
																</ul>
															</div>
														</div>
													</div>
												</div>
											
											<!-- <div class="form-group   col">
												<label class=" form-label label lcolor">Work
													Experience</label>
												<div class="">
													<input type="Number" class="form-control border cborder ml-4"
														id="workExperience" name="workExperience" placeholder=""
														value="">
												</div>
											</div> -->
										</div>
									</div>
									<div class="row mt-3">
										<div class="col-sm">
											<div class="row">
												<div class="col-sm-4 mt-3 label lcolor">jobType</div>
												<div class="col-sm-6 mt-3">
													<div class="form-check form-check-inline">
														<input class="form-check-input bcolor jobType jobType"
															type="radio" name="jobType" id="jobType" value="Internship">
														<label class="form-check-label" for="inlineRadio1">Internship</label>
													</div>
													<div class="form-check form-check-inline">
														<input class="form-check-input bcolor jobType jobType"
															type="radio" name="jobType" id="jobType" value="Full-time">
														<label class="form-check-label" for="inlineRadio2">Full-time</label>
													</div>
												</div>
											</div>
										</div>
										<div class="col-sm">
											<div class="row ">
												<div class="col-sm-4 mt-3 label lcolor">Work Place</div>
												<div class="col-sm mt-3">
													<div class="form-check form-check-inline">
														<input class="form-check-input bcolor" type="radio"
															name="workPlace" id="On-board" value="on-board">
														<label class="form-check-label" for="inlineRadio1">On-board</label>
													</div>
													<div class="form-check form-check-inline">
														<input class="form-check-input bcolor" type="radio"
															name="workPlace" id="inlineRadio2" value="work from home">
														<label class="form-check-label" for="inlineRadio2">Work
															From home</label>
													</div>
													<div class="form-check form-check-inline">
														<input class="form-check-input bcolor" type="radio"
															name="workPlace" id="inlineRadio3" value="Both">
														<label class="form-check-label" for="inlineRadio3">Both</label>
													</div>
												</div>
											</div>
										</div>
										<div class="row mt-3">
											<div class="col-sm">
												<div class="drop-down  ">
													<div class="dropdown">
														<div class="row">
															 <div class="form-group   ">
												<label class=" form-label label lcolor">Work
													Experience</label>
												<div class="">
													<input type="Number" class="form-control border cborder ml-4"
														id="workExperience" name="workExperience" placeholder=""
														value="">
												</div>
											</div>
														</div>
													</div>
												</div>
											</div>

											<div class="col-sm">
												<div class="form-group  ">
													<label class="form-label label lcolor">Minimum
														Expected Salary</label>
													<div class="">
														<input type="text" class="form-control cborder\border"
															id="expSalary" name="expSalary">
													</div>
												</div>
											</div>

										</div>
									</div>
									<div class="row mt-3">
										<div class="col-sm">
											<div class="row mt-3">
												<div class="col-sm-2 label lcolor">Soft Skills</div>
												<div class="col-sm">
													<div class="form-check form-check-inline ">
														<input class="form-check-input bcolor" type="checkbox"
															name="softSkills" value="Comunication"> <label
															class="form-check-label ">Communication</label>
													</div>
													<div class="form-check form-check-inline">
														<input class="form-check-input bcolor" type="checkbox"
															name="softSkills value ="TOM"> <label
															class="form-check-label ">TOM</label>
													</div>
													<div class="form-check form-check-inline">
														<input class="form-check-input bcolor" type="checkbox"
															name="softSkills" value="MS Office"> <label
															class="form-check-label " for="inlineCheckbox3">MS
															Office</label>

													</div>
													<div class="form-check form-check-inline">
														<input class="form-check-input bcolor" type="checkbox"
															name="softSkills" value="Emailing"> <label
															class="form-check-label " for="inlineCheckbox3">Emailing</label>

													</div>
												</div>
											</div>
										</div>

										<div class="row mt-3">
											<div class="col-sm-2 ">Technical Skills</div>
											<div class="col-sm">
												<div class="form-check form-check-inline ">
													<input class="form-check-input bcolor" type="checkbox"
														id="Front-endi" value="Front-end" name="technicalSkills">
													<label class="form-check-label" for="">Front-end</label>
												</div>
												<div class="form-check form-check-inline">
													<input class="form-check-input bcolor" type="checkbox"
														id="Back-endi" value="Back-end" name="technicalSkills">
													<label class="form-check-label" for="">Back-end</label>
												</div>
												<div class="form-check form-check-inline">
													<input class="form-check-input bcolor" type="checkbox"
														id="Full-stacki" value="Full-stack" name="technicalSkills">
													<label class="form-check-label" for="">Full-stack</label>

												</div>
												<div class="form-check form-check-inline">
													<input class="form-check-input bcolor" type="checkbox"
														id="" value="" name="technicalSkills"> <label
														class="form-check-label" for="">None</label>

												</div>
											</div>
											<div class = "row mt-3">
											<input class="bcolor mr-3" type="submit" 
												value="Submit" style="border:none ;border-radius:5px;"/></div>
										</div>
									</div>
								</form>
						</div>
					</div>
					
				</div>
			</div>
		</div>

	</div>

	
	<script>
		function validateForm() {
			let con = true;
			let a = document.forms["myForm"]["name"].value;
			if (a == "") {
				console.log('name');
				//document.getElementById('name').style.border = '2px solid red';
				con = false;
			}                                                      
			let b = document.forms["myForm"]["age"].value;
			if (b == "") {
				console.log('age');
				document.getElementById('age').style.border = '2px solid red';
				con = false;
			}

			let c = document.forms["myForm"]["Phone"].value;
			if (c == "") {
				console.log('no.');
				document.getElementById('Phone').style.border = '2px solid red';
				con = false;
			}
			let d = document.forms["myForm"]["email"].value;
			if (b == "") {
				document.getElementById('email').style.border = '2px solid red';
				con = false;
			}
			let e = document.forms["myForm"]["workExperience"].value;
			if (e == "") {
				document.getElementById('workExperience').style.border = '2px solid red';
				con = false;
			}
			let f = document.forms["myForm"]["expSalary"].value;
			if (f == "") {
				document.getElementById('expSalary').style.border = '2px solid red';
				con = false;
			}

			if (!$('.gender:checked').val()) {
		//		console.log('HELLO');
				$('.gender').css({
					border : '2px solid red'
				});
			}
			if (!$('.jobType:checked').val()) {
				console.log('HELLO');
				$('.jobType').css({
					border : '2px solid red'
				});
			}
			
			else {
				alert("record saved");
			}
			return con;
		}
		function selectQualification(event) {
			document.getElementById("selected_qualification").value = event.innerHTML;
			document.getElementById("qualification").innerHTML = event.innerHTML;
		}
		function selectLocation(event) {
			document.getElementById("selected_location").value = event.innerHTML;
			document.getElementById("location").innerHTML = event.innerHTML;
		}
	</script>
</body>
</html>