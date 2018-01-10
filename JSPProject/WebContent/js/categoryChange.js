function categoryChange(e) {
    var clothes = ["상의", "하의", "한벌 옷", "아우터"];
    var value_clothes = ['top', 'bottom', 'overall', 'outerwear'];

    var accessory = ["가방", "신발", "모자", "기타 액세서리"];
    var value_accessory = ['bag', 'shoes', 'hat', 'etc-accessory'];

    var sports = ['스포츠'];
    // var value_sports = [];

    var etc = ['기타'];
    // var value_etc = [];

    var electronics = ['디지털/가전'];
    // var value_electronics = [];
    var auction = ["1시간", "6시간", "12시간", "24시간"];
    var value_auction = ['1hour', '6horus', '12hours', '24hours'];

    var value_empty = ['empty'];
    var none_select = ['대분류를 선택해 주세요'];
    var target = document.getElementById("small-category");
    if (e.value == "clothes") {                 //의류
        var d = clothes;
        var v = value_clothes;
    }
    else if (e.value == "accessory") {          //패션/잡화
        var d = accessory;
        var v = value_accessory;
    }
    else if (e.value == "sports") {             //스포츠
        var d = sports;
        var v = value_empty;
    } else if (e.value == 'etc') {              //기타
        var d = etc;
        var v = value_empty;
    } else if (e.value == 'electronics') {
        var d = electronics;
        var v = value_empty;

    } else if (e.value == 'auction') {          //경매
        var d = auction;
        var v = value_auction;
    } else if( e.value==''){
        var d = none_select;
        var v = value_empty;
    }
    target.options.length = 0;

    for (x in d) {
        var opt = document.createElement("option");
        opt.value = v[x]; // value값 넣는부분
        opt.innerHTML = d[x];
        target.appendChild(opt);
    }
}