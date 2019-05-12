// JavaScript Document

//watchify main.js -o bundle.js -v

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
}

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