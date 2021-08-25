 function myfunction()
  {
	  var r = confirm("Are you sure you want to cancel the Order?\n"+"Press Ok to confirm");
	  if (r == true) 
	  {
          window.location="index.html";
		  return true;
	  } 
	  else 
	  {
	      return false;
	  }
  }