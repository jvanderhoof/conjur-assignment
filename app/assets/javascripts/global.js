/* global $ */

$(document).ready( function() {
    
    $('.panel-group').on('hide.bs.collapse', function (e) {
        $(".glyphicon.glyphicon-collapse-up").removeClass("glyphicon-collapse-up").addClass("glyphicon-collapse-down");
    });
    
    $('.panel-group').on('show.bs.collapse', function (e) {
        $(".glyphicon.glyphicon-collapse-down").removeClass("glyphicon-collapse-down").addClass("glyphicon-collapse-up");
    });
    
});