<div id="wizParDiv0">
   <head>
      <style type="text/css">
         <link rel="stylesheet" type="text/css" href="./css/video.css" />
      </style>
   </head>
   <body>
      <cfoutput>
         <div id="contentDiv" class="CT_Box"> 
            <div class="title">
               This portal leads to madness!
            </div>
            <div class="title">
               Start exploring the multiverse, get tickets today!
            </div>
            <div class="btn">
               x
            </div> 
            <p>
               <cfset variables.encrptKey = application.encrptKey>   
               <a href="./detail.cfm?id=#URLEncodedFormat(Encrypt(8, encrptKey))#" class="video-block"  target="_blank">
                  <img alt=""  src="https://assets-in.bmscdn.com/mailers/images/01052022/pn/web_popup_dr_strange.gif" class="video-gif">
               </a>
            </p>
         </div>
      </cfoutput>   
   </body>
</div>