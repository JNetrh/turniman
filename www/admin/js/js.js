// JavaScript Document
// $(function () {
//     $.nette.init();
//     // And you fly...
// });
//
$('#myWebForm2').jsonForm(
    {

        "schema": {
            "friends": {
                "type": "array",
                "maxItems": 3,
                "items": {
                    "type": "object",
                    "title": "Friend",
                    "properties": {
                        "nick": {
                            "type": "string",
                            "title": "Nickname"
                        },
                        "animals": {
                            "type": "array",
                            "maxItems": 2,
                            "items": {
                                "type": "string",
                                "title": "Animal name",
                                required: true
                            }
                        }
                    }
                }
            }
        },
        onSubmit: function (errors, values) {
            console.log(values);
            if (errors) {
                $('#res').html('<p>I beg your pardon?</p>');
            }
            else {
                $('#res').html('<p>ahoj</p>');
            }
        },
        "form": [
            {
                "type": "tabarray",
                "items": {
                    "type": "section",
                    "items": [
                        "friends"
                    ]
                }
            },
            {
                "type": "button",
                "title": "Click me",
                "onClick": function (evt) {

                    evt.preventDefault();
                    $("form").submit();
                    alert('Thank you!');
                }
            }
        ]
    });


$('#myWebForm').jsonForm({
    schema: {
        lang: {
            type: "string",
            title: "Translation language",
            enum: [ "cz", "en", "ru" ]
        },
        langLong: {
            type: "string",
            title: "Long text for the language to display in language selection"
        },
        welcomeTextFirstPart: {
            type: "string",
            title: "Welcome heading the first part (black) "
        },
        welcomeTextSecondPart: {
            type: "string",
            title: "Welcome heading the second part (red) "
        },
        welcomeTextThirdPart: {
            type: "string",
            title: "Welcome heading the third part (black) "
        },
        subHeading: {
            type: "string",
            title: "Subheading at main page"
        },
        subHeadingLink: {
            type: "string",
            title: "red link that points to a different section"
        },
        aboutHeading: {
            type: "string",
            title: "Heading 'About us'"
        },
        aboutSubHeading: {
            type: "string",
            title: "Red subheading (probably your name)"
        },
        aboutDescription: {
            type: "string",
            title: "Descriptive text for the section"
        },
        ourServicesHeading: {
            type: "string",
            title: "Heading 'Our services'"
        },
        redBlocks: {
            type: "array",
            items: {
                type: "object",
                properties: {
                    blockHeading: {
                        type: "string",
                        title: "Red block heading"
                    },
                    blockItems: {
                        type: "array",
                        title: "descriptive items",
                        items: {
                            type: "string",
                            title: "item {{idx}}"
                        }
                    }
                }
            }
        },
        welcomeTextServices: {
            type: "string",
            title: "welcome text for page 'Our services'"
        },
        blocks: {
            type: "array",
            items: {
                type: "object",
                properties: {
                    heading: {
                        type: "string",
                        title: "heading"
                    },
                    items: {
                        type: "array",
                        items: {
                            type: "object",
                            title: "subheading with items",
                            properties: {
                                itemHeading: {
                                    type: "string",
                                    title: "item heading"
                                },
                                itemDescription: {
                                    type: "string",
                                    title: "item description"
                                }
                            }
                        }
                    }
                }
            }
        },
        contact: {
            type: "array",
            items: {
                type: "object",
                title: "contact info",
                properties: {
                    heading: {
                        type: "string",
                        title: "heading"
                    },
                    adress: {
                        type: "array",
                        items: {
                            type: "object",
                            title: "adress",
                            properties: {
                                companyName: {
                                    type: "string",
                                    title: "Company name"
                                },
                                street: {
                                    type: "string",
                                    title: "street"
                                },
                                town: {
                                    type: "String",
                                    title: "town"
                                },
                                psc: {
                                    type: "string",
                                    title: "post code"
                                }
                            }
                        }
                    },
                    email: {
                        type: "string",
                        title: "email"
                    },
                    dataBox: {
                        type: "string",
                        title: "data box code"
                    },
                    ico: {
                        type: "string",
                        title: "business ID"
                    },
                }
            }
        }
    },
    form: [
        {
            type: "fieldset",
            title: "language settings",
            expandable: true,
            htmlClass: "level_1",
            items: [
                {
                    key: "lang",
                    htmlClass: "level_2",
                    title: "select the language of the translation",
                    type: "radios"
                },
                {
                    key: "langLong",
                    htmlClass: "level_2"
                }
            ]
        },
        {
            type: "fieldset",
            title: "main page ",
            expandable: true,
            items: [
                {
                    type: "fieldset",
                    title: "landing page main text",
                    expandable: true,
                    htmlClass: "level_2",
                    items: [
                        {
                            type: "fieldset",
                            title: "welcome text",
                            expandable: false,
                            htmlClass: "level_3",
                            items: [
                                "welcomeTextFirstPart",
                                "welcomeTextSecondPart",
                                "welcomeTextThirdPart"
                            ]
                        },
                        {
                            type: "fieldset",
                            title: "sub heading & link",
                            expandable: false,
                            htmlClass: "level_3",
                            items: [
                                "subHeading",
                                "subHeadingLink"
                            ]
                        }
                    ]
                },
                {
                    type: "fieldset",
                    title: "Section 'About us'",
                    expandable: true,
                    htmlClass: "level_2",
                    items: [
                        {
                            key: "aboutHeading",
                            htmlClass: "level_3"
                        },
                        {
                            key: "aboutSubHeading",
                            htmlClass: "level_3"
                        },
                        {
                            key: "aboutDescription",
                            htmlClass: "level_3",
                            type: "textarea",
                            width: "50%"
                        }
                    ]
                },
                {
                    type: "fieldset",
                    title: "Section 'Our services'",
                    expandable: true,
                    htmlClass: "level_2",
                    items: [
                        {
                            key: "ourServicesHeading",
                            htmlClass: "level_3"
                        },
                        {
                            type: "fieldset",
                            title: "Red blocks",
                            items: [
                                {
                                    type: "tabarray",
                                    items: {
                                        type: "section",
                                        items: [
                                            "redBlocks[].blockHeading",
                                            {
                                                type: "array",
                                                items: [
                                                    "redBlocks[].blockItems[]"
                                                ]
                                            }
                                        ]
                                    }
                                }
                            ]
                        }
                    ]
                }
            ]
        },
        {
            type: "fieldset",
            title: "services page ",
            expandable: true,
            items: [
                {
                    type: "fieldset",
                    title: "Services",
                    expandable: true,
                    htmlClass: "level_2",
                    items: [
                        {
                            key: "welcomeTextServices"
                        },
                        {
                            type: "array",
                            items: [
                                {
                                    key: "blocks[]",
                                    title: "service description {{idx}}",
                                    htmlClass: "level_3"
                                }
                            ]
                        }
                    ]
                }
            ]
        },
        {
            type: "submit",
            title: "OK Go - This Too Shall Pass"
        }
    ]
});












/*----------------------------------------------------------------------------*/
/* Flash messages: */

var position = $("#flashMessage").position();
var c = 0;
var t;
var timer_is_on = 0;
function flashMessage(message){
    startCount();
    c = 0
    ToggleMessage(true)
    $("#flashMessage").find('ul').append('<li>' + message + '</li>');
}

function ToggleMessage(bol) {
    if(bol) {
        $("#flashMessage").animate({
            top: '0px'
        }, 400);
    }
    else {
        $("#flashMessage").animate({
            top: '-400px'
        }, 400);
    }
}

function timedCount() {

    c = c + 1;
    t = setTimeout(function(){
        if(c > 3){
            stopCount()
            ToggleMessage(false)
            $("#flashMessage").find('ul').html('');
        }
        timedCount();
    }, 1000);
}


function startCount() {
    if (!timer_is_on) {
        timer_is_on = 1;
        timedCount();
    }
}

function stopCount() {
    clearTimeout(t);
    timer_is_on = 0;
}


























