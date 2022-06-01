<cfset moviesObj=CreateObject("component","components.movies")/>
<cfif URL.id NEQ "">
    <cfset variables.cartID = URL.id/>
</cfif>
<cfset result=moviesObj.getPaymentDetails(cartID)/> 
<cfcontent type="application/pdf">
<cfdocument format="PDF" filename="ticket.pdf"  overwrite="Yes">
    <cfdocumentsection> 
        <cfdocumentitem type="header"> 
            <font size="16px"><i>Ticket</i></font> 
        </cfdocumentitem> 
        <cfdocumentitem type="footer">  
            <cfoutput> <font size="-3">Page #cfdocument.currentpagenumber#</font>  </cfoutput>
        </cfdocumentitem>  
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
        </cfdocumentsection>  
    </cfdocument>
<cfheader name="Content-Disposition" value="attachment; filename=ticket.pdf"> 
<cfcontent type="application/pdf"  file="#expandPath('.')#\ticket.pdf"><cfdocument format="PDF">Some text.</cfdocument>

