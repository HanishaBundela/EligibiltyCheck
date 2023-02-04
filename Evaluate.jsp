<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EvaluateForm</title>

<link href="./Static resources/css/bootstrap.min.css" rel="stylesheet" />
<script src="./Static resources/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.slim.min.js"
	integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI="
	crossorigin="anonymous"></script>
<style>
body {
	display: flex;
	height: 100vh;
	justify-content: center;
	align-items: center;
	background: linear-gradient(135deg, #1d67a8, #71b7e6)
}

.gradient {
	display: flex;
	justify-content: center;
	align-items: center;
	background: linear-gradient(135deg, #71b7e6, #1e70b9);
	color:white;
}
/* #image{
width:120px;
 height:120px;
} */

.card {
	background-color: rgba(255, 255, 255, 0.9);
}
</style>
</head>
<body>
	<div class="container ">
		<form name="vinform">
			<div class="card ">
				<div class="row m-4">
					<div class="col-md-8 ">
						<div class="row m-4">
							<div class="col-md-4">
								<label> Job post</label>
								<div class="dropdown">
									<button type="button"
										class="btn dropdown-toggle form-control gradient"
										data-bs-toggle="dropdown" id="jobPost">--Select--</button>
									<input id="selected_jobPost" name="jobPost" type="hidden"></input>
									<ul class="dropdown-menu ">
										<li><a class="dropdown-item" id="HR"
											onclick="selectJobPost(this);searchJobPost();" href="#">HR</a></li>
										<li><a class="dropdown-item" id="SDE"
											onclick="selectJobPost(this);searchJobPost();" href="#">SDE</a></li>
										<li><a class="dropdown-item" id="Project Manager"
											onclick="selectJobPost(this);searchJobPost();" href="#">Project Manager</a></li>
									</ul>
								</div>
							</div>
							<div class="col-md-8">
								<div class="form-group">
									<label>Name</label> <input type="text" class="form-control"
										name="name" id="name" onkeyup="sendInfo()">
								</div>
							</div>
						</div>
						<div class="row m-4">
							<div class="col-md-5">
								<div class="form-group">
									<label>Eligibility formulae</label> <input type="text"
										class="form-control" id="ElgFormulae" name="elgFormulae">
								</div>
							</div>
							<div class="col-md-3">
								<input type="Submit" value="Check Eligiblity"
									class="btn btn-primary mt-4 gradient"
									onclick="checkEligibilty(event)" id="elgbutton" />
							</div>
							<div class="col-md "> <img src="" id="image" class = "image-responsive"/></div>
						</div>
						<div class="row">
							<div class="col-md"></div>
							<div class="col-md-11">


								<table class="table table-striped table-hover " id="mylocation">
								</table>
							</div>
							<div class="col-md"></div>
						</div>


					</div>

					<div class="col-md-4 mt-4 ">
						<h3 class="gradient">Other details</h3>
						<div class="form-group row mr-2 mt-3">
							<label class="col-md-4 col-form-label">Age</label>
							<div class="col-sm-8">
								<input type="number" class="form-control bg-light" id="age"
									placeholder="" value="" readonly>
							</div>
						</div>
						<div class="form-group row mt-3 ">
							<label class="col-sm-4 col-form-label ">Qualification</label>
							<div class="col-sm-8">
								<input type="text" class="form-control bg-light ml-4"
									id="qualification" readonly>
							</div>
						</div>
						<div class="form-group row mt-3">
							<label class="col-sm-4 col-form-label">Gender</label>
							<div class="col-sm-8">
								<input type="text" class="form-control bg-light" id="gender"
									placeholder="" value="" readonly>
							</div>
						</div>
						<div class="form-group row mt-3">
							<label class="col-sm-4 col-form-label">Phone No.</label>
							<div class="col-sm-8">
								<input type="text" class="form-control bg-light" id="phoneNo"
									placeholder="" readonly>
							</div>
						</div>
						<div class="form-group row mt-3">
							<label class="col-sm-4 col-form-label">Min Salary</label>
							<div class="col-sm-8">
								<input type="number" class="form-control bg-light"
									id="minSalary" placeholder="" value="" readonly>
							</div>
						</div>
						<div class="form-group row mt-3">
							<label class="col-sm-4 col-form-label">Work Experience</label>
							<div class="col-sm-8">
								<input type="number" class="form-control bg-light"
									id="workExperience" placeholder="" value="" readonly>
							</div>
						</div>
						<div class="form-group row mt-3">
							<label class="col-sm-4 col-form-label">Soft Skills</label>
							<div class="col-sm-8">
								<textarea class="form-control bg-light" id="softSkills" readonly></textarea>
								<!-- <input type="text" class="form-control bg-light"  placeholder="" value="" readonly> -->
							</div>
						</div>
						<div class="form-group row mt-3">
							<label class="col-sm-4 col-form-label">Technical Skills</label>
							<div class="col-sm-8">
								<textarea class="form-control bg-light " id="technicalskills"></textarea>
								<!-- <input type="text" class="form-control bg-light" id="technicalskills" placeholder="" value="technicalskills" readonly> -->
							</div>
						</div>

					</div>
				</div>
			</div>
		</form>
	</div>

</body>
<script>
	function selectJobPost(event) {
		document.getElementById("selected_jobPost").value = event.innerHTML;
		document.getElementById("jobPost").innerHTML = event.innerHTML;
	}

	var request;
	function sendInfo() {
		var vi = document.vinform.name.value;
		var url = "FetchDatajsp.jsp?val=" + vi;

		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {
			request.onreadystatechange = getInfo;
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}

	}
	function getInfo() {
		if (request.readyState == 4) {
			var val = JSON.parse(request.responseText);
			//	const obj = JSON.parse(val);
			//	console.log("hi");
					console.log(val.WorkExperince);
			document.getElementById("age").value = val.Age;
			document.getElementById("qualification").value = val.HighestQualification;
			document.getElementById("gender").value = val.Gender;
			document.getElementById("phoneNo").value = val.PhoneNo;
			document.getElementById("minSalary").value = val.MinExpectedSalary;
			document.getElementById("technicalskills").value = val.TechnicalSkills;
			document.getElementById("softSkills").value = val.SoftSkills;
			document.getElementById("workExperience").value = val.WorkExperince;
		}
	}

	var request = new XMLHttpRequest();
	function searchJobPost() {
		var post = document.getElementById("selected_jobPost").value;
		//		console.log(post);
		//	var name=document.vinform.jobPost.value;  
		var url = "showTable.jsp?val=" + post;
		//	console.log("hi in");

		try {
			request.onreadystatechange = function() {
				if (request.readyState == 4) {
					var json = JSON.parse(request.responseText);

					console.log("post");
					document.getElementById('mylocation').innerHTML = json.table;
					document.getElementById('ElgFormulae').value = json.EligibilityFormulae;
				}
			}
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");

		}
	}

	function checkEligibilty(event) {
		event.preventDefault();
		var name = document.vinform.name.value;

		var elgFormulae = document.vinform.ElgFormulae.value;
		var post = document.getElementById("selected_jobPost").value;
		console.log(elgFormulae);
		 var json = {
			"name" : name,
			"elgFormulae" : elgFormulae,
			"post" : post
		};
		console.log(json);
		const myJSON = JSON.stringify(json); 

		console.log(myJSON);

		var url = "CheckEligibility.jsp";

		if (window.XMLHttpRequest) {
			reequest = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {

			request.onreadystatechange = getText;
			request.open("POST", url, true);
			request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			request.send("strJson="+myJSON);
		} catch (e) {
			alert("Unable to connect to server");
		}
	}

	function getText() {
		if (request.readyState == 4) {
			var val2 = request.responseText;
			console.log(val1);
		var val1 = val2.replace(/^\s+|\s+$/gm,'');;
		
			if(val1 == "True"){
				document.getElementById('image').src = './Static resources/image/eligible.jpeg';

				console.log("OK");
				
			}
			else if(val1 == "False"){
				document.getElementById('image').src = './Static resources/image/notEligible.jpeg';
				console.log(".....");
			}
			else{
				alert("Incorrect Formulae");
				console.log("Incorrect ");
			}
			var imagesToResize = document.getElementsByClassName("image-responsive");
		     for(i=0;i<imagesToResize.length;i++){
		       imagesToResize[i].style.width = "160px";
		       imagesToResize[i].style.height = "100px";
		     }
			//console.log(val1);
			console.log("DONE");

		}
	}
</script>
</html>