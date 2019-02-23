$(function() {
	var qyid = localStorage.getItem("qyid");
	if(!qyid) {
		window.location.href="/ncpsy/login";
	}
})