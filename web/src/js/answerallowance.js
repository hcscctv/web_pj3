function postanswer(id,whether){
    var tempform = document.createElement("form");
    tempform.action = "answerAllowanceServlet";
    tempform.method = "get";
    tempform.style.display="none"
    var opt = document.createElement("input");
    opt.name = "imgid";
    opt.value = id;
    tempform.appendChild(opt);
    var opt1 = document.createElement("input");
    opt1.name = "whether";
    opt1.value = whether;
    tempform.appendChild(opt1);
    var opt = document.createElement("input");
    opt.type = "submit";
    tempform.appendChild(opt);
    document.body.appendChild(tempform);
    tempform.submit();
    document.body.removeChild(tempform);
}

function postapply(id){
    var tempform = document.createElement("form");
    tempform.action = "applyfriendServlet";
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

function postuserid(id) {
    var tempform = document.createElement("form");
    tempform.action = "otherfavorServlet";
    tempform.method = "get";
    tempform.style.display="none"
    var opt = document.createElement("input");
    opt.name = "id";
    opt.value = id;
    tempform.appendChild(opt);
    var opt = document.createElement("input");
    opt.type = "submit";
    tempform.appendChild(opt);
    document.body.appendChild(tempform);
    tempform.submit();
    document.body.removeChild(tempform);
}

function postchat(id) {
    var tempform = document.createElement("form");
    tempform.action = "chatServlet";
    tempform.method = "get";
    tempform.style.display="none"
    var opt = document.createElement("input");
    opt.name = "id";
    opt.value = id;
    tempform.appendChild(opt);
    var opt = document.createElement("input");
    opt.type = "submit";
    tempform.appendChild(opt);
    document.body.appendChild(tempform);
    tempform.submit();
    document.body.removeChild(tempform);
}