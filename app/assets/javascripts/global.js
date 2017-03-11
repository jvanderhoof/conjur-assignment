
$(document).ready( function() {
    
    $('.panel').on('hide.bs.collapse', function (e) {
        $(".glyphicon.glyphicon-collapse-up").removeClass("glyphicon-collapse-up").addClass("glyphicon-collapse-down");
    });
    
    $('.panel').on('show.bs.collapse', function (e) {
        $(".glyphicon.glyphicon-collapse-down").removeClass("glyphicon-collapse-down").addClass("glyphicon-collapse-up");
    });
    
});