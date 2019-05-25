(function(){function r(e,n,t){function o(i,f){if(!n[i]){if(!e[i]){var c="function"==typeof require&&require;if(!f&&c)return c(i,!0);if(u)return u(i,!0);var a=new Error("Cannot find module '"+i+"'");throw a.code="MODULE_NOT_FOUND",a}var p=n[i]={exports:{}};e[i][0].call(p.exports,function(r){var n=e[i][1][r];return o(n||r)},p,p.exports,r,e,n,t)}return n[i].exports}for(var u="function"==typeof require&&require,i=0;i<t.length;i++)o(t[i]);return o}return r})()({1:[function(require,module,exports){
// JavaScript Document

//watchify funkce.js -o bundle.js -v

$(document).ready(function() {

    $("#isEditable").click(e => {
        if(document.getElementById("isEditable").checked) {
            $('.editableTextfield').editable("enable");
            $('.editableTextarea').editable("enable");
        }
        else {
            $('.editableTextfield').editable("disable");
            $('.editableTextarea').editable("disable");
        }

    });


});



setEditable = () => {

    $('.editableTextarea').editable(postData, {
        // indicator : "<img src='img/spinner.svg' />",
        type: "autogrow",
        cancel : 'Cancel',
        submit : 'Save',
        cssclass : 'textareaEditable',
        cancelcssclass : 'button-error',
        submitcssclass : 'button-success',
        showfn : function(elem) { elem.fadeIn('slow') },
        tooltip : "Click to edit...",
        width : 400
    });

    $('.editableTextfield').editable(postData, {
        // indicator : "<img src='img/spinner.svg' />",
        type: "text",
        cancel : 'Cancel',
        submit : 'Save',
        cssclass : 'textfieldEditable',
        cancelcssclass : 'button-error',
        submitcssclass : 'button-success',
        showfn : function(elem) { elem.fadeIn('slow') },
        tooltip : "Click to edit...",
        width : 400
    });
};

addRowToRedBlock = (e, lang, callback) => {

    var previous = $(e.target).prev();
    var previousId = 1 + parseInt(previous.attr('order'));
    var path = previous.attr('path');
    var suffix = path.match(/[\/][0-9]+$/)[0];
    path = path.substr(0, (path.length - suffix.length)) + '/' + previousId;
    var result = "";
    result += "<p class='pSluzby' path='" + path + "' order='" + previousId + "'> <a class='aRightless editableTextfield' href='#' path='";
    result += path;
    result += "' lang='" + lang + "'>click to insert new text</a>\n</p>";
    previous.after(result);
    callback();
};


addRowToServiceBlock = (e, lang, callback) => {

    var previous = $(e.target).prev(); // previous black that looks the same
    var previousId = 1 + parseInt(previous.attr('order'));
    var path = previous.attr('path');
    var suffix = path.match(/[\/][0-9]+$/)[0];
    path = path.substr(0, (path.length - suffix.length)) + '/' + previousId;
    var result = "";

    result += "<div  path='" + path + "' order='" + previousId + "'>";
    result += "<h3 class='h3TypSluzby editableTextfield' path='" + path + "/subHeading' lang='" + lang + "'>click to insert new text</h3>";
    result += "<p class='editableTextfield' path='" + path + "/description' lang='" + lang + "'>click to insert new text</p> </div>";

    previous.after(result);
    callback();
};

addServiceBlock = (e, lang, callback) => {

    var previous = $(e.target).prev();
    console.log(previous);
    var newId = 1 + parseInt(previous.attr('higherOrder'));
    var path = previous.attr('higherPath');
    var suffix = path.match(/[\/][0-9]+$/)[0];
    path = path.substr(0, (path.length - suffix.length)) + '/' + newId;
    var result = "";

    result += "<div higherOrder='" + newId + "' higherPath='" + path + "' class='divBlock'> <div class=\"divBlockLeft_4\">";
    result += "<h2 class='h2TypSluzby editableTextfield' path='" + path + "/heading' lang='" + lang + "'>click to insert new text</h2>";
    result += "</div> <div class='divBlockRight_6'>";
    result += "<div  order='0' path='" + path + "/items/0'>";
    result += "<h3 class='h3TypSluzby editableTextfield' path='" + path + "/items/0/subHeading' lang='" + lang + "'>click to insert new text</h3>";
    result += "<p class='editableTextfield' path='" + path + "/items/0/description' lang='" + lang + "'>click to insert new text</p>";
    result += "</div>";
    result += "</div>";

    previous.after(result);
    callback();
};

function postData(value, settings) {
    var objectToSend = {};
    objectToSend.lang = $(this).attr('lang');
    objectToSend.path = $(this).attr('path');
    objectToSend.content = value;
    console.log(this);
    console.log(value);
    console.log(settings);
    $.nette.ajax({
        type: 'POST',
        'url': handleSubmitLanguageUrl,
        'data': {data: JSON.stringify(objectToSend)},
        'success': function(e) {
            console.log('e', e)
        }
    });
    return(value);
}

$(document).ready(function() {

    $(".toggleNewLang").click(() => {
        $('#openSettings').slideToggle(400);


        $( "#iToggleTopSettings" ).animate({ "top": "+=50px" }, 200, "linear", function() {
            if($('#iToggleTopSettings').hasClass('fa-angle-up')){
                $('#iToggleTopSettings').removeClass('fa-angle-up');
                $('#iToggleTopSettings').addClass('fa-angle-down');
            }
            else {
                $('#iToggleTopSettings').addClass('fa-angle-up');
                $('#iToggleTopSettings').removeClass('fa-angle-down');
            }
            $( "#iToggleTopSettings" ).animate({ "top": "-=50px" }, 200, "linear");
        });

    });

    $('input').focus(function (e) {
        if(e.target.value.length <= 0) {
            $('label[for=contact-' + e.target.name + ' ]').animate({
                top: -25 + 'px'
            }, 300, function() {
                // Animation complete.
            });
        }
    });
    $('input').focusout(function (e) {
        if(e.target.value.length <= 0) {
            $('label[for=contact-' + e.target.name + ' ]').animate({
                top: 0 + 'px'
            }, 300, function() {
                // Animation complete.
            });
        }
    });



    $('textarea').focus(function (e) {
        if(e.target.value.length <= 0) {
            $('label[for=contact-' + e.target.name + ' ]').animate({
                top: -25 + 'px'
            }, 300, function() {
                // Animation complete.
            });
        }
    });
    $('textarea').focusout(function (e) {
        if(e.target.value.length <= 0) {
            $('label[for=contact-' + e.target.name + ' ]').animate({
                top: 0 + 'px'
            }, 300, function() {
                // Animation complete.
            });
        }
    });

});
},{}]},{},[1]);
