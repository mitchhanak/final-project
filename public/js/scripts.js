$(document).ready(function() {
    $('#adselect').change(function () {
        $('#imageToSwap').attr("src", $( this ).find( "option:selected" ).data( "img-src" ));
    });
});