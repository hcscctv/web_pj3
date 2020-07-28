function postdelete(id){
    var tempform = document.createElement("form");
    tempform.action = "deleteServlet";
    tempform.method = "get";
    tempform.style.display="none"
    var opt = document.createElement("input");
    opt.name = "imgid";
    opt.value = id;
    tempform.appendChild(opt);
    var opt = document.createElement("input");
    opt.type = "submit";
    tempform.appendChild(opt);
    document.body.appendChild(tempform);
    var r=confirm("Are you sure delete the pic?")
    if (r) tempform.submit();
    document.body.removeChild(tempform);
}


function postchange(id){
    var tempform = document.createElement("form");
    tempform.action = "changeServlet";
    tempform.method = "get";
    tempform.style.display="none"
    var opt = document.createElement("input");
    opt.name = "imgid";
    opt.value = id;
    tempform.appendChild(opt);
    var opt = document.createElement("input");
    opt.type = "submit";
    tempform.appendChild(opt);
    document.body.appendChild(tempform);
    tempform.submit();
    document.body.removeChild(tempform);
}