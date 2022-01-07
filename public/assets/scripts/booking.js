var booking = function () {
    var base_url = window.location.origin;
    toastr.options = {
        "closeButton": true,
        "debug": false,
        "positionClass": "toast-bottom-left",
        "onclick": null,
        "showDuration": "2000",
        "hideDuration": "2000",
        "timeOut": "8000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }
   var handleDatePickers = function () {
       
        if (jQuery().datepicker) {
        

            $("#date").datepicker();
            
        }
    }

    // var submit = function(){
    //     $("#next").on('click', function(e){
    //         e.preventDefault();


    //     })
    // }

    return {

        //main function to initiate the module
        init: function () {
            handleDatePickers();
        }

    };

}();