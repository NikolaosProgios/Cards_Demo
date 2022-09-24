$(function () {	
	$('#loginBtn').click(login);	
});

function login(){
	//check if playerName is null
	if($('#playerName').val()=='') {
		alert('Please type a player name');
		return;
	}

	document.getElementById("loginBtn").disabled = true; //disable login button after successful login
	document.getElementById("playerName").disabled = true; //disable player name input field after succesful login

	draw_empty_board();
	var player = $('#playerName').val();
	$.post('lib/checkLogin.php', {playerName: player}, function(data){
		if (data.loggedin == "true"){
			$('#infoSQL').text(data.msg);
			loginbutton.hide();			
			SaveLoadOutput.show();					
		} else {
			register();
			login();		
		}
	},
   'json');
	

	fill_board();
}
function register(){
	var regusername = $("#playerName").val();
	$.post('lib/register.php',{regusername: regusername}, function(data){},'json');
}
