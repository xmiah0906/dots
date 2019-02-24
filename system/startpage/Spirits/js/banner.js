$("#banner").css('background-image', localStorage.getItem("#banner"));
$("#container").css('background-image', localStorage.getItem("#container"));
	$("#my-button").click(function () {
			var myData = {
		1: {
			image: "banner/banner1.jpg",
			landscape:"background/background01.jpg",
			
		}, 
		2: {
			image: "banner/banner2.jpg",
			landscape:"background/background02.jpg",
			
		}, 
		3: {
			image: "banner/banner3.jpg",
			landscape:"background/background03.jpg",
			
		}, 
	};
	var randomNumber = Math.floor((Math.random() * 3) + 1);
	var URL = myData[randomNumber].image;
	$("#banner").css('background-image', "url("+URL+")");
	var status = $("#banner").css('background-image');
	localStorage.setItem("#banner", status);
	var URLB = myData[randomNumber].landscape;
	$("#container").css('background-image', "url("+URLB+")");
	var status2 = $("#container").css('background-image');
	localStorage.setItem("#container", status2);
})
