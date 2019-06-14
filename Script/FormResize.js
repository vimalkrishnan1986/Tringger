var ActualWindowWidth = 0;
var ActualWindowHeight = 0;
var aryDoumentObjects = new Array();
var aryParentWidth = new Array();
var aryParentHeight = new Array();
var aryCalcWidth = new Array();
var aryCalcHeight = new Array();
var strDetails = "";
//document.onreadystatechange = fnStartInit;
function fnStartInit(objThis) {

   



    //  if (document.readyState == "complete") {
    FnGetScreenWidth();
    FnGetScreenHeight();
   // alert(document.getElementById("tdLeft").style.width);
    //document.getElementById("spanHeight").innerHTML = ActualWindowWidth + "/" + ActualWindowHeight;
    FnPageResize(document.body, 100, 100, ActualWindowWidth, ActualWindowHeight);
    window.onresize = function () {
        fnOnResize();
    }
   // alert(strDetails);
   
  // document.getElementById("tdLeft").innerHTML = strDetails;
    // }
}
function fnOnResize() {
    FnGetScreenWidth();
    FnGetScreenHeight();
   // document.getElementById("spanHeight").innerHTML = ActualWindowWidth + "/" + ActualWindowHeight;
    FnPageResize(document.body, 100, 100, ActualWindowWidth, ActualWindowHeight);
}

//document.body.onload = fnStartInit;


function FnGetScreenWidth() {

    ActualWindowWidth = document.getElementsByTagName("HTML")[0].clientWidth//((window.innerWidth == undefined) ? document.body.clientWidth : window.innerWidth);
    // alert(ActualWindowWidth);

}

function FnGetScreenHeight() {

    ActualWindowHeight = document.getElementsByTagName("HTML")[0].clientHeight - 2; //((window.innerHeight == undefined) ? document.getElementsByTagName("HTML")[0].clientHeight : document.getElementsByTagName("HTML")[0].clientHeight);
}

function FnPageResize(obj, intParentWidth, intParentHeight, intCalcWidth, intCalcHeight) {


    try {
        if (obj) {

            if (obj.tagName.toUpperCase() == "IMG") {
                   return;
            }
        }
        var intCurrentWidth = 1;
        var intCurrentHeight = 1;
        if (obj.getAttribute("ActualWidth", 2) == undefined) {
           var intAvailWidth = intParentWidth;
            if (obj.style.width != "") {
                intAvailWidth = obj.style.width.replace("px", "").replace("%", "");
            }
            obj.setAttribute("ActualWidth", intAvailWidth);
        }

        if (obj.getAttribute("ActualHeight", 2) == undefined) {
            var intAvailHeight = 0;
            if (obj.style.height != "") {
                intAvailHeight = obj.style.height.replace("px", "").replace("%", "");
            }
            obj.setAttribute("ActualHeight", intAvailHeight);
        }

        if (((obj.getAttribute("ActualWidth", 2) / 100) * ActualWindowWidth).toString() != "0") {
            intCurrentWidth = ((obj.getAttribute("ActualWidth", 2) / 100) * intCalcWidth).toString() ;
            obj.style.width = intCurrentWidth + "px";
            if (obj.getAttribute("ActualHeight", 2) != "0") {
                intCurrentHeight = ((obj.getAttribute("ActualHeight", 2) / 100) * ActualWindowHeight).toString()
                obj.style.height = intCurrentHeight + "px";
            }
            aryDoumentObjects[aryDoumentObjects.length] = obj;
            aryParentWidth[aryParentWidth.length] = obj.getAttribute("ActualWidth", 2);
            aryParentHeight[aryParentHeight.length] = obj.getAttribute("ActualHeight", 2);
            aryCalcWidth[aryCalcWidth.length] = intCurrentWidth;
            aryCalcHeight[aryCalcWidth.length] = intCurrentHeight;
            strDetails += obj.tagName + intCurrentWidth + "*" + intCurrentHeight +"AllcatedH"+ obj.getAttribute("ActualHeight", 2) + +"AllcatedW"+ obj.getAttribute("ActualWidth", 2)+" <br />";
        }

        for (var intLoop = 0; intLoop < obj.childNodes.length; intLoop++) {
            FnPageResize(obj.childNodes[intLoop], obj.getAttribute("ActualWidth", 2), obj.getAttribute("ActualHeight", 2), intCurrentWidth, intCurrentHeight);
        }
    }
    catch (err) {


    }

}

function FnResizeControl() {
 
    for (var intLoop = 0; intLoop < aryDoumentObjects.length; intLoop++) {
        if (typeof (aryDoumentObjects[intLoop]) == "object") {
            aryDoumentObjects[intLoop].style.width = ((aryParentWidth[intLoop] / 100) * aryDoumentObjects[intLoop].parentNode.style.width).toString() + "px";
         //   if (aryParentHeight[intLoop] != 0)
              //  aryDoumentObjects[intLoop].style.height = ((aryParentHeight[intLoop] / 100) * aryDoumentObjects[intLoop].parentNode.style.height).toString() + "px";
        }
    }

}
