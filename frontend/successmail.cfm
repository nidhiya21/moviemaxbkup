<cfif isDefined("session") and structKeyExists(session, 'cart')  and structKeyExists(session.cart, 'cartID')  >
    <cfset variables.cartID=session.cart.cartID />
</cfif>
<cfset moviesObj=CreateObject("component","components.movies")/>
<cfset result=moviesObj.getPaymentDetails(cartID)/>   
<cfdocument name="certificate" format="PDF" pagetype="custom" pageheight="5" pagewidth="6.5" margintop="0" marginbottom="0" marginright="0" marginleft="0" unit="in" fontembed="true" backgroundvisible="true" localurl="true">
    <cfoutput>
        <html> 
            <head>      
                <style>
                    <cfinclude template = "./css/thanks.css">  
                </style>
            </head>
            <body>
                <cfoutput>
                    <div id="container">
                        <div id="page-body" > 
                            <section id="session-overview">
                                <div class="main-container">
                                    <div class="check-container">   
                                        <div class="check-shadow"></div>
                                    </div>
                                </div>
                                <div class="cardWrap">
                                    <div class="cards cardLeft cardhgts">
                                        <h1>Movie Max <span>Digital</span></h1>
                                        <div class="title">
                                            <h2>#result.fld_moviename#</h2>
                                            <span>Movie</span>
                                        </div>
                                        <div class="name">
                                            <h2>#result.nameOnCard#</h2>
                                            <span>Name</span>
                                        </div>
                                        <div class="title">
                                            <h2>#result.seats#</h2>
                                            <span>Seat</span>
                                        </div>
                                        <div class="title">
                                            <h2>#result.bookedDate# #result.bookedTime#</h2>
                                            <span>Time</span>
                                        </div>
                                    </div>
                                    <div class="cards cardRight cardhgt">                                        
                                        <div class="number">
                                            <span></span>
                                        </div> 
                                        <div class=""> <img src="./images/bar.jpg" alt="" class="barImg"/></div>
                                    </div> 
                                </div>
                            </section> 
                        </div>
                    </div>  
                </cfoutput>
            </body>
        </html>
    </cfoutput>
</cfdocument> 
<cfmail
    to="#result.emailID#"
    from="rishiba.pp.niitclt@gmail.com"  
    subject="Thank you for booking movie #result.userName#!"
    type="html"> 
    <p>Thank you for booking movie with our system #result.userName#. Plese find the attachment.</p>
    <cfmailparam file="ticket.pdf" type="application/pdf" content="#certificate#"/>  
</cfmail>