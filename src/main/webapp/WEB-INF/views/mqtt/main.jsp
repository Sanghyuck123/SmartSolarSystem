<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>MQTT</title>
<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- MetisMenu CSS -->
<link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">
<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<!-- Three.js 추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"></script>
<style>
    #threejs-container canvas {
    width: 400px; /* 원하는 가로 길이 */
    height: 400px; /* 원하는 세로 길이 */
}

</style>

</style>

</style>

</head>

<body>
	<div class="container">
	    <h1>MQTT</h1>
	    <div class="row">
	        <div class="col-sm-3" style="background-color:white;">
	            <div class="panel panel-default">
	                <div class="panel-heading">
	                    <h3 class="panel-title">AUTOMODE</h3>
	                </div>
	                   <div class="panel-body">
	                       <div class="row">
	                           <div class="col-sm-12" style="background-color:white;">
	                           <a id="command" data-value="1" class="btn btn-lg btn-success btn-block">ON</a>
	                       		</div>
	                       </div>
	                       <br>
	                       <div class="row">
	                   
	                           <div class="col-sm-12" style="background-color:white;">
	                           <a id="command" data-value="0" class="btn btn-lg btn-success btn-block">OFF</a></div>
	                       </div>
			       	 </div>
		        </div>
		        
		        <div class="panel panel-default">
	                <div class="panel-heading">
	                    <h3 class="panel-title">MOVE by 2 degrees</h3>
	                </div>
			       	 <div class="panel-body">
	                       <div class="row">
	                           <div class="col-sm-12" style="background-color:white;">
	                           <a id="command" data-value="up" class="btn btn-lg btn-success btn-block">UP</a>
	                           </div>
	   
	                       </div>
	                       <br>
	                       <div class="row">
	                   
	                           <div class="col-sm-12" style="background-color:white;">
	                           <a id="command" data-value="down" class="btn btn-lg btn-success btn-block">DOWN</a></div>
	                       </div>
			       	 </div>
			       	 <div class="panel-body">
	                       <div class="row">
	                           <div class="col-sm-6" style="background-color:white;">
	                           <a id="command" data-value="left" class="btn btn-lg btn-success btn-block">LEFT</a></div>
	                           <div class="col-sm-6" style="background-color:white;">
	                           <a id="command" data-value="right" class="btn btn-lg btn-success btn-block">RIGHT</a></div>
	                       </div>
			       	 </div>
		        </div>
	            
	   		</div>
	   		
	   			      
	            
	            
	   	
		    <div class="col-sm-9" style="background-color:white;">
		        <div class="row">
		        	<div class="col-sm-3" style="background-color:white;">
		        		<div class="panel panel-default">
			        		<div class="panel-heading">
		                       <h3 class="panel-title">AUTOMODE</h3>
		                   </div>
		                   <div class="panel-body">
		                       <div class="form-group">
		                           <input id="s_automode" class="form-control" type="text" readonly="readonly">
		                       </div>
	                   		</div>
	                   </div>
		        	</div>
		        	<div class="col-sm-3" style="background-color:white;">
		        		<div class="panel panel-default">
			        		<div class="panel-heading">
		                       <h3 class="panel-title">VOLT</h3>
		                   </div>
		                   <div class="panel-body">
		                       <div class="form-group">
		                           <input id="s_volt" class="form-control" type="text" readonly="readonly">
		                       </div>
	                   		</div>
	                   </div>
		        	</div>
		        	<div class="col-sm-3" style="background-color:white;">
		        		<div class="panel panel-default">
			        		<div class="panel-heading">
		                       <h3 class="panel-title">HORIZONTAL</h3>
		                   </div>
		                   <div class="panel-body">
		                       <div class="form-group">
		                           <input id="s_horizontal" class="form-control" type="text" readonly="readonly">
		                       </div>
	                   		</div>
	                   </div>
		        	</div>
		        	<div class="col-sm-3" style="background-color:white;">
		        		<div class="panel panel-default">
			        		<div class="panel-heading">
		                       <h3 class="panel-title">VERTICAL</h3>
		                   </div>
		                   <div class="panel-body">
		                       <div class="form-group">
		                           <input id="s_vertical" class="form-control" type="text" readonly="readonly">
		                       </div>
	                   		</div>
	                   </div>
		        	</div>
    			    
		        	
		        </div>
		        <div class="row">
			        <div class="col-lg-12">
			  	    <!-- /.panel -->
			            <div class="panel panel-default">
				    	    <div class="panel-heading">
				    		    <i class="fa fa-database fa-fw"></i> Database
			    		    </div> 
			      		    <!-- /.panel-heading -->
			      		    <div class="panel-body">
					            <ul class="chat"></ul>
				      	    </div>
			      		    <!-- /.panel-body -->
			      		    <div class="panel-footer"></div>
			    	    </div>
			  	    </div>
		        </div>
		        <!-- Three.js Canvas -->
		        <div class="row">
		            <div class="col-lg-12">
		                <div id="threejs-container" style="background-color:black; height:400px;"></div>
		            </div>
		        </div>
		    </div>
	    </div>
	</div>
	
<!-- jQuery -->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<link href="/resources/css/main.css" rel="stylesheet" type="text/css">
<!-- Bootstrap Core JavaScript -->
<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
<!-- Metis Menu Plugin JavaScript -->
<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>
<!-- Custom Theme JavaScript -->
<script src="/resources/dist/js/sb-admin-2.js"></script>
<script type="text/javascript" src="/resources/js/reply.js"></script>

<!-- Three.js Script -->
<script>
$(function() {
	alert("test")
	let pageNum = 1;
	showList(pageNum);
	$(".panel-footer").on("click", 'li a', function(e) {
		e.preventDefault(); 
		pageNum=$(this).attr("href");
		showList(pageNum);
		console.log(pageNum)
	});
	startTimer() 
	
	function startTimer() {
	    timer = setInterval(
	        function() {
	        	$.getJSON("/mqtt/getSmartSolarSystemState",
	        	    function(iot){
	        		    console.log(iot);
	        		    $("#s_horizontal").attr("value", iot.horizontal+"°");
	        		    $("#s_vertical").attr("value", iot.vertical+"°");
	        		    $("#s_volt").attr("value", iot.volt+"V");
	        		    if (iot.automode != null) {
	        		    	$("#s_automode").attr("value", iot.automodeState);
	        		    }
	        		   
	        	});
	        	
            }, 3000);
    }
	let group;
	function showList(pageNum) {
		$.getJSON("/mqtt/list"+"/"+pageNum,
		    function(list) {
			console.log(list);
			let Cnt = list.cnt
			let val = list.list
				var str="";
			    if(list == null || list.length == 0){
			    	replyUL.html(str);
			    	return;
			    }
			    for (var i = 0, len = val.length || 0; i < len; i++) {
			    	str += "<li class='left clearfix' data-no='"+val[i].id+"'>";
			    	str += "  <div><div class='header'><strong class='primary-font'>["+val[i].id;
			    	str += "] AUTOMODE " + val[i].automodeState + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + "HORIZONTAL " + val[i].horizontal +"°";
			    	str += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VERTICAL " + val[i].vertical +"°";
			    	str += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;VOLT " + val[i].volt + "V";
			    	str += "<small class='pull-right text-muted'>";
			    	str += displayTime(val[i].time)+"</small></div></div></li>";
    			}
			    $(".chat").html(str);
			    showPaging(Cnt, pageNum)
		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}
});

function showPaging(Cnt, pageNum) {
	console.log(pageNum);
	let endNum = Math.ceil(pageNum/10.0) * 10;
	let startNum = endNum -9;
	let prev = (startNum !=1);
	let next = false;
	let str = "";
	let replyPageFooter = $('.panel-footer');
	if (endNum * 10 >= Cnt) {
		endNum = Math.ceil(Cnt/10.0);
	}
	if (endNum * 10 < Cnt) {
		next = true;
	}
	str += '<ul class="page_ul" id="reply-page">'
	if(prev == true) {
		str += '  <li>'
			str += '     <a href="'+(startNum -1) +'">Prev</a>'
		str += '  </li>'
	}
	for (let i = startNum; i <= endNum; i++) {
        str += '<li>';
        str += '<a class="page-link ' + (pageNum == i ? 'active' : '') + '" href="' + i + '">' + i + '</a>';
        str += '</li>';
    }
	if(next == true) {
		str += '  <li>'
			str += '     <a href="'+(endNum  +1) +'">Next</a>'
		str += '  </li>'
	}
	replyPageFooter.html(str);
}  

function displayTime(timeValue) {
	var today = new Date();
	var gap = today.getTime() - timeValue;
	var dateObj = new Date(timeValue);
	var str = "";
	var yy = dateObj.getFullYear();
	var mm = dateObj.getMonth() + 1; 
	var dd = dateObj.getDate();
	var hh = dateObj.getHours();
	var mi = dateObj.getMinutes();
	var ss = dateObj.getSeconds();
	return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/', (dd > 9 ? '' : '0') + dd + "&nbsp;&nbsp;&nbsp;"
		+ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi, ':', (ss > 9 ? '' : '0') + ss ].join('');
}

$(".btn-success").on("click", function(e) {
	let command = $(this).data("value")
	console.log(command)
	$.get("/mqtt/pubish/", {"command":command} ,
			function(result) {
		})
})


function initThreeJS() {
    var scene = new THREE.Scene();

    var camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
    camera.position.set(0, 0, 20);

    var renderer = new THREE.WebGLRenderer();
    /* renderer.setSize(window.innerWidth, window.innerHeight); */
     renderer.setSize(800, 400);
    document.getElementById("threejs-container").appendChild(renderer.domElement);

  
    var group = new THREE.Group();

    
    var cylinderWidth = 1;
    var cylinderHeight = 10;
    var cylinderDepth = 1;


    var cylinderGeometry = new THREE.BoxGeometry(cylinderWidth, cylinderHeight, cylinderDepth);
    var cylinderMaterial = new THREE.MeshBasicMaterial({color: 0x00ff00});
    var cylinder = new THREE.Mesh(cylinderGeometry, cylinderMaterial);
    group.add(cylinder); 


    var rectangleWidth = 12;
    var rectangleHeight = 4; 
    var rectangleDepth = 0.1;

    var rectangleGeometry = new THREE.BoxGeometry(rectangleWidth, rectangleHeight, rectangleDepth);
    var rectangleMaterial = new THREE.MeshBasicMaterial({color: 0xff0000});
    var rectangle = new THREE.Mesh(rectangleGeometry, rectangleMaterial);

    rectangle.position.y = cylinderHeight / 2 + rectangleHeight / 2;
    rectangle.rotation.x = Math.PI / 12; 
    group.add(rectangle);

    scene.add(group); 

    function render() {
        renderer.render(scene, camera);
    }

    render();

    var isDragging = false;
    var previousMousePosition = {
        x: 0,
        y: 0
    };

    document.addEventListener('mousedown', onMouseDown);
    document.addEventListener('mouseup', onMouseUp);
    document.addEventListener('mousemove', onMouseMove);

    function onMouseDown(event) {
        isDragging = true;
        previousMousePosition = {
            x: event.clientX,
            y: event.clientY
        };
    }

    function onMouseUp() {
        isDragging = false;
    }

    function onMouseMove(event) {
        if (isDragging) {
            var deltaMove = {
                x: event.clientX - previousMousePosition.x,
                y: event.clientY - previousMousePosition.y
            };

            group.rotation.x += deltaMove.y * 0.01;
            group.rotation.y += deltaMove.x * 0.01;

            previousMousePosition = {
                x: event.clientX,
                y: event.clientY
            };

            render();
        }
    }
    $("a[data-value='up']").on("click", function(e) {
        e.preventDefault();
        var currentRotationX = group.children[1].rotation.x;
        if (currentRotationX > Math.PI / 12) {
        	var rotateAngle = Math.PI / 90; 
            group.children[1].rotation.x -= rotateAngle;
            render();
        }
    });

    $("a[data-value='down']").on("click", function(e) {
        e.preventDefault();
        var currentRotationX = group.children[1].rotation.x;
        if (currentRotationX < Math.PI * 5 / 12) { 
            var rotateAngle = Math.PI / 90; 
            group.children[1].rotation.x += rotateAngle;
            render();
        }
    });

    $("a[data-value='right']").on("click", function(e) {
        e.preventDefault();
        var rotateAngle = Math.PI / 90; 
        var currentRotation = group.rotation.y;
        var newRotation = currentRotation - rotateAngle;
        if (newRotation <= -Math.PI / 2) {
            newRotation = -Math.PI / 2;
        }
        group.rotation.y = newRotation;
        render();
    });

    $("a[data-value='left']").on("click", function(e) {
        e.preventDefault();
        var rotateAngle = Math.PI / 90; 
        var currentRotation = group.rotation.y;
        var newRotation = currentRotation + rotateAngle;
        if (newRotation >= Math.PI / 6) {
            newRotation = Math.PI / 6;
        }
        group.rotation.y = newRotation;
        render();
    });
}

window.onload = initThreeJS;








</script>
</body>
</html>
