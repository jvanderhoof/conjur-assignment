/* global $ */
/* global Cookies */

function checkCookie() {
    var hidden = [];
    
    if ( Cookies.get('hiddenAlerts') ) {
        hidden = Cookies.getJSON('hiddenAlerts');
        $.unique(hidden);
    };
    return hidden;
};

document.addEventListener("turbolinks:load", function() {
    $(".alert").each(function() {
        var getHidden = checkCookie();
        if ( $.inArray( $(this).attr("data-alert-type"), getHidden) === -1) {
            $(this).removeClass("hide").addClass("show");
        };
    });
    
    $('.alert').on('closed.bs.alert', function () {
        var getHidden = checkCookie();
        getHidden.push( $(this).attr("data-alert-type") );
        Cookies.set('hiddenAlerts', getHidden);
    });
    
    $('.panel-group').on('hide.bs.collapse', function (e) {
        $(".glyphicon.glyphicon-collapse-up").removeClass("glyphicon-collapse-up").addClass("glyphicon-collapse-down");
    });
    
    $('.panel-group').on('show.bs.collapse', function (e) {
        $(".glyphicon.glyphicon-collapse-down").removeClass("glyphicon-collapse-down").addClass("glyphicon-collapse-up");
    });
    
});

