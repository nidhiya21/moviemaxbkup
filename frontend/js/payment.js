$( function() {
  $( "#dialog" ).dialog();
  
} );
$(function () {
    $('[data-toggle="popover"]').popover();   
    $('#cvc').on('click', function(){
      if ( $('.cvc-preview-container').hasClass('hide') ) {
        $('.cvc-preview-container').removeClass('hide');
      } else {
        $('.cvc-preview-container').addClass('hide');
      }    
    });  
  });
$(document).on("click", ".paymentBtn", function () {
    var nameOnCard = $('#nameOnCard').val();
    var creditCardNumber = $('#creditCardNumber').val();
    var expiryDate = $('#expiryDate').val();
    var securityCode = $('#securityCode').val();
    var zipCode      = $('#zipCode').val();
    var cartID       = $('#cartID').val();
    var userID       = $('#userID').val(); 
    $.ajax({ 
        type:"POST",   
        url: 'components/movies.cfc',  
        dataType: "json",
        data: {
                method: "insertPayment",
                nameOnCard: nameOnCard,
                creditCardNumber: creditCardNumber,
                expiryDate: expiryDate,
                securityCode: securityCode,
                zipCode: zipCode,
                cartID: cartID,
                userID: userID  

            },
            success: function(objResponse ){  
                if (objResponse.SUCCESS){
                       // window.location = './paymentthanks.cfm'; 
                } else {  
                    
                }
            } 
        }); 
});
$("#payment").validate({
errorClass: "fail-alert",
rules: {
    nameOnCard: "required"
   
},
messages: { 
    nameOnCard: "Please enter your Name "
} 
});   
