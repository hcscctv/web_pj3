function move() {
    var s1 = document.getElementById("Filter_by_country");
    var s2 = document.getElementById("Filter_by_city");
    var add;
    if (s1.value == "City") {
        s2.disabled = true;
        add = new Array("choose country first");
    } else if (s1.value == "China") {
        s2.disabled = false
        add = new Array('Shanghai', 'Kunming', 'Beijing', 'Yantai');
    } else if (s1.value == "Italy") {
        s2.disabled = false
        add = new Array('Roma', 'Milan', 'Venice', 'Florence');
    } else if (s1.value == "Japan") {
        s2.disabled = false
        add = new Array('Tokyo', 'Osaka', 'Kamakura');
    } else if (s1.value == "America") {
        s2.disabled = false
        add = new Array('New York', 'San Francisco', 'Washington');
    } else if (s1.value == "others") {
        add = new Array("not required");
        s2.disabled = true;
    }
    s2.length = 0;
    // 添加选项
    for (var i = 0; i < add.length; i++) {
        var ss = new Option();
        ss.text = add[i];
        ss.value = add[i];
        s2.add(ss)
    }
}

var choices_1 = document.getElementsByClassName("choice")
var choices_2 = document.getElementsByClassName("choice_last")
var pics = document.getElementsByClassName("filter_result")
for (var i = 0; i < choices_1.length; i++) {
    choices_1[i].setAttribute("onclick", "filter()");
}
for (var i = 0; i < choices_2.length; i++) {
    choices_2[i].setAttribute("onclick", "filter()");
}

function filter() {
    for (var i = 0; i < pics.length; i++) {
        pics[i].setAttribute("src", "../../img/travel-images/normal/medium/pic (" + Math.floor(2 + Math.random() * 70) + ").jpg")
    }
}