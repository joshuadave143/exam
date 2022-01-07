var information = function () {
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


    var submit = function(){
        $("#info").on('submit', function(e){
            e.preventDefault();
            $(document.body).css({'cursor' : 'wait'});
            data = $( this ).serialize()
            $.ajax({
                method:'post',
                url: base_url+"/api/book",
                data:{
                    data:data
                },
                success: function (data) {
                    toastr['success'](data.messages.success, "Notifications")

                    // $('#new_delivery_rec')[0].reset();
                }
                ,error: function(data) {
                    data = JSON.parse(data.responseText)
                    toastr['error'](data.messages.error, "Notifications")
                },
                complete: function(){
                    $(document.body).css({'cursor' : 'default'}); // return to normal cursor 
                                     
                }
            });
        })
    }

    return {

        //main function to initiate the module
        init: function () {
            submit();
        }

    };

}();