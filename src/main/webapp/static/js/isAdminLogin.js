$(function() {
	var id = localStorage.getItem("id");
	if(!id) {
		window.location.href="/ncpsy/admin/login";
	}
})