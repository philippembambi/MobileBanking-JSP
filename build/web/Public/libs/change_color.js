var color = document.getElementById('idc');
var color_selected = document.getElementById('colorselected');
var classcolr=document.getElementsByClassName();
color.addEventListener('click',
function() {   
    color_selected.id = "idc";
    color_selected.style.backgroundColor = "red";
}, true);
