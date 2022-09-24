var me={};
var game_status={};
$(function () {	
	$('#loginBtn').click(login);	
});

//clears player name input when refreshing page
window.onload = function(){
        document.getElementById("playerName").value = '';}

function draw_empty_board() {
	var table;
	/*
	<table id="cards_table">
			<th colspan="7">Opponent</th>
			<tr id="opponent">
				<td id="opponent1">Card1</td>
				<td id="opponent2">Card2</td>
				<td id="opponent3">Card3</td>
				<td id="opponent4">Card4</td>
				<td id="opponent5">Card5</td>
				<td id="opponent6">Card6</td>
				<td id="opponent7">Cards Taken</td>
			</tr>
			<tr id="ground">
				<td colspan="6" id="groundCell">Ground</td>
				<td id="cardsPile">CardsPile <img src="images/1_Back2.png"</td>
			</tr>
			<th colspan="7">My Cards</th>
			<tr id="me">
				<td id="me1">Card1</td>
				<td id="me2">Card2</td>
				<td id="me3">Card3</td>
				<td id="me4">Card4</td>
				<td id="me5">Card5</td>
				<td id="me6">Card6</td>
				<td id="me7">Cards Taken</td>
			</tr>
		</table>
	*/			
	table='<table id="cards_table">';	
	// opponent
	table+='<th colspan="7">Opponent</th>';
	table+='<tr id="opponent"><td id="opponent1">Card1</td><td id="opponent2">Card2</td><td id="opponent3">Card3</td><td id="opponent4">Card4</td><td id="opponent5">Card5</td><td id="opponent6">Card6</td><td id="opponent7">Cards Taken</td></tr>';
	// ground
	table+='<tr id="ground"><td id="groundCell" colspan="6">Ground</td><td id="cardsPile">CardsPile <img src="images/1_Back2.png"</td></tr>';
	// me
	table+='<th colspan="7">My Cards</th><tr id="me"><td id="me1">Card1</td><td id="me2">Card2</td><td id="me3">Card3</td><td id="me4">Card4</td><td id="me5">Card5</td><td id="me6">Card6</td><td id="me7">Cards Taken</td></tr>';	
	table+='</table>';	
	$('#cards_board').html(table);
}

// Για να γεμίσουμε το board διαβάζουμε δεδομένα από τον server μέσω του API. 

function fill_board() {
	$.ajax({url: "card.php/board/", success: fill_board_by_data });
}
/*
γράφοντας fill_board_by_data, είναι reference προς την συνάρτηση, και ορίζουμε ότι όταν ολοκληρωθεί 
επιτυχώς το κατέβασμα του αρχείου "chess.php/board/« να κληθεί η συνάρτηση fill_board_by_data.
*/

var table1=["2","3","4","5","6","7","8","9","ace","jack","king","queen" ];
var table2 = ["clubs" , "diamons", "hearts", "spades"] ; 
int m=0;
function fill_board_by_data(data) {
// Το data είναι ένας array που αντιστοιχεί στα στοιχεία του πίνακα board από την βάση. 
	$(id).addClass(o.b_color+'_square').html(im);	
	//for player1 [ My cards] 
	//Try to fill the board with radmon cards
/*
		m++;
		var id = '#me' + m ;
		int z1=Math.floor(Math.random() * 11);
		int z2=Math.floor(Math.random() * 3);
		
		var im = '<img id="' + table1[z1] + '_of_'+ table2[z2] " src="images/'+c+'.png">':'';
		$(id).addClass('My Cards'+'_square').html(im);
*/
	
	for(var i=0;i<data.length;i++) {
		var o = data[i];
		var id = '#square_'+ o.x +'_' + o.y; // red or black , papas or koupa
		var c = (o.piece!=null)?o.piece_color + o.piece:'';
		var im = (o.piece!=null)?'<img class="piece" src="images/'+c+'.png">':'';
		$(id).addClass(o.b_color+'_square').html(im);		
	}

	
}

/*
Το data είναι τα δεδομένα που κατέβηκαν. Επειδή επιστράφηκαν σε json μορφή, 
και δεδομένου ότι ορίσαμε στο Content-Type της απάντησης το σωστό Content-Type: application/json, 
η jquery μετατρέπει αυτόματα την απάντηση (που είναι string) σε object.
*/
/*
Το data είναι ένας array που αντιστοιχεί στα στοιχεία του πίνακα board από την βάση. 
Το διατρέχουμε. Κάθε στοιχείο του έχει .x και .y
Βρίσκουμε το id στο οποίο αντιστοιχεί το κάθε element του πίνακα
*/
