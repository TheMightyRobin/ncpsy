function nowDateToString() {
	var date = new Date();
	var year = date.getFullYear(); 
	var month =(date.getMonth() + 1).toString(); 
    var day = (date.getDate()).toString();  
	if (month.length == 1) { 
	    month = "0" + month; 
	} 
	if (day.length == 1) { 
	    day = "0" + day; 
	}
	var dateTime = year + "-" + month + "-" + day;
	return dateTime;
}