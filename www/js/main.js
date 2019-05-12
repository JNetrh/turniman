$(function () {
	$.nette.init();
	// And you fly...
});

function drzAktivni(page)  {
    page != null ? document.getElementById(page).className = 'aMenuActive' : null;
}