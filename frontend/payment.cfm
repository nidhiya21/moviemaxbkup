<cfif isDefined("session") and structKeyExists(session, 'cart')  and structKeyExists(session.cart, 'cartID')  >
    <cfset variables.cartID=session.cart.cartID />
    <cfset moviesObj=CreateObject("component","components.movies")/>
    <cfset result=moviesObj.getPaymentDetails(cartID)/>  
</cfif>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width">
        <title>Payment - Movie Max Digital</title>
        <link rel="stylesheet" type="text/css" href="./css/site.css" />
        <link rel="stylesheet" type="text/css" href="./css/purchase.css" />
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <link type="text/css" href="./css/custom.css" rel="stylesheet" />
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="./js/jquery-1.12.4.min.js"  crossorigin="anonymous"></script>
        <script src="./js/bootstrap.min.js"></script>
        <script src="./js/bootstrap-datepicker.min.js"></script> 
        <script src="./js/jquery.validate.min.js"></script>
        <script src="./js/checkout.js"></script>
        <script src="./js/jquery-ui.js"></script> 
    </head>
    <body>
        <cfoutput> 
            <img class="body-background film-poster"></img> 
            <img class="body-background film-backdrop"></img>
            <cfset variables.paymentKey = application.paymentKey>    
            <div id="container">
                <header>
                    <a href="./index.cfm">
                        <img src="./images/banner.jpg" alt="" />
                    </a>
                </header>
                <div id="page-body" > 
                    <section id="session-overview">
                        <div class="container">
                            <div id="Checkout-left" class="inline">
                                <h3>Booking Summary</h3>
                                <div class="form-group summary">
                                    <div class="name">   
                                       <span class="text-title">Movie : #result.fld_moviename#</span>
                                    </div>
                                    <div class="name">
                                        <span>Seat</span> : #result.seats#   
                                    </div>
                                    <div class="name">
                                        <span>Time</span> : #result.bookedDate# #result.bookedTime#
                                    </div>
                                    <hr>
                                    <div class="summary-blk">          
                                        <label for="PaymentAmount">Amount Payable : </label> <span> &##x20b9;</span>  #result.ORDERAMOUNT#
                                    </div>
                                </div>
                            </div>
                            <div id="Checkout" class="inline">
                                <h1>Pay Invoice</h1>
                                <div class="card-row">
                                    <span class="visa"></span>
                                    <span class="mastercard"></span>
                                    <span class="amex"></span>
                                    <span class="discover"></span>
                                </div>
                                <cfparam name="form.nameOnCard" default="" > 
                                <cfparam name="form.creditCardNumber" default="" >  
                                <cfparam name="form.expiryDate" default="" > 
                                <cfparam name="form.securityCode" default=""> 
                                <cfparam name="form.zipCode" default="">   
                                <input type="hidden" id="cartID" name="cartID" value=#session.cart.cartID#>   
                                <input type="hidden" id="userID" name="userID" value=#session.stLoggedInFrUser.userID#>  
                                <form name="payment" method="post" id="payment">
                                    <div class="form-group">
                                        <label for="PaymentAmount">Payment amount</label>
                                        <div class="amount-placeholder">
                                            <span> &##x20b9;</span> 
                                            <span>#result.ORDERAMOUNT#</span>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label or="NameOnCard">Full Name</label>
                                        <input id="nameOnCard" name="nameOnCard" class="form-control" type="text" maxlength="255"></input>
                                    </div>
                                    <div class="form-group">
                                        <label for="CreditCardNumber">Phone Number</label>
                                        <input id="creditCardNumber" name="creditCardNumber" class="null card-image form-control" type="text"></input>
                                    </div>
                                    <div class="expiry-date-group form-group">
                                        <label for="ExpiryDate">Address 1</label>
                                        <input id="expiryDate" class="form-control"  name="expiryDate" type="text"></input>
                                    </div>
                                    <div class="security-code-group form-group">
                                        <label for="SecurityCode">Address 2</label>
                                        <div class="input-container" >
                                            <input id="securityCode" name="securityCode" class="form-control" type="text" ></input>
                                            <i id="cvc" class="fa fa-question-circle"></i>
                                        </div>
                                        <div class="cvc-preview-container two-card hide">
                                            <div class="amex-cvc-preview"></div>
                                            <div class="visa-mc-dis-cvc-preview"></div>
                                        </div>
                                    </div>
                                    <div class="zip-code-group form-group">
                                        <label for="ZIPCode">ZIP/Postal code</label> 
                                        <div class="input-container">
                                            <input id="zipCode"  name="zipCode" class="form-control" type="text" maxlength="10"></input>
                                            <a tabindex="0" role="button" data-toggle="popover" data-trigger="focus" data-placement="left" data-content="Enter the ZIP/Postal code for your credit card billing address."><i class="fa fa-question-circle"></i></a>
                                        </div> 
                                    </div>                     
                                    <cfset variables.orderamnt = result.ORDERAMOUNT * 100> 
                                    <button id="rzp-button1" class="checkout-button btn btn-block btn-success submit-button paymentBtn" name="PayButton" >  <span class="submit-button-lock"></span>
                                        <span class="align-middle">Pay   <span> &##x20b9;</span>  
                                        <span>#result.ORDERAMOUNT#</span>
                                    </button> 
                                </form>
                            </div>
                        </div>
                    </section>  
                </div>
                <div id="dialog" title="Terms &amp; Conditions">
                    <p>1. As per the State Government Guidelines, In order to enter the cinema, It is mandatory to have Covid 19 Vaccine (One dose at least), for patrons above 18 years old. Vaccination certificate will be verified at the cinema entry, no entry will be permitted for non-vaccinated patrons and tickets will not be refunded</p>
                    <p>2. Tickets once purchased cannot be cancelled, exchanged or refunded.</p>
                    <p>3. Tickets purchased online are not eligible for discounts, schemes or promotions of any kind.</p>
                   
                </div>
            </div>
            <script> 
                var options = { 
                    "key": "#variables.paymentKey#", // Enter the Key ID generated from the Dashboard 
                    "amount": "#orderamnt#",  // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
                    "currency": "INR", 
                    "name": "Moviemax Digital",
                    "description": "Test Transaction",
                    "image": "http://localhost:8500/moviemax/frontend/images/logo.png", 
                    "handler": function (response){
                        
                            if (typeof response.razorpay_payment_id == 'undefined' ||  response.razorpay_payment_id < 1) {
                                redirect_url = '/error.cfm';
                            } else {
                                redirect_url = './paymentthanks.cfm';
                            }
                                location.href = redirect_url;  
                    },
                    "prefill": {
                        "name": "#result.userName#",
                        "email": "#result.emailID#",
                        "contact": "#result.phoneNumber#"
                    },
                    "notes": {
                        "address": "Razorpay Corporate Office"
                    },
                    "theme": {
                        "color": "##3399cc"
                    }
                }; 
                var rzp1 = new Razorpay(options);
                rzp1.on('payment.failed', function (response){
                });
                window.onload = function(){
                    document.getElementById('rzp-button1').onclick = function(e){
                        rzp1.open();
                        e.preventDefault(); 
                    } 
                }
            </script>
        </cfoutput>
        <script type="text/javascript" src="./js/payment.js"></script>
    </body>
</html>
