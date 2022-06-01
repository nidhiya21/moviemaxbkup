<cfset moviesObj=CreateObject("component","components.movies")/>
<cfif structKeyExists(URL,'search')>
    <cfif URL.search NEQ "">        
        <cfset movieList=moviesObj.getSearchMovies(URL.search)/>
    </cfif>
<cfelse>    
    <cfset movieList=moviesObj.getPlayingMovies()/>    
</cfif>
<!DOCTYPE html>
<html>
    <head>
        <title>Now playing in  Movie Max Digital Cinemas</title>
        <meta name="description" content="Home home of great movies.">
        <cfinclude template="./common.cfm">
    </head>
    <body>
        <header>
            <cfinclude template="./header.cfm">	 
        </header>
        <section id="coming-soon">
            <cfoutput>
                <div class="main-content">
                    <cfif movieList.movieID NEQ ""> 
                        <h1>NOW PLAYING</h1>
                    <cfelse>
                        <h1>NO RECORDS FOUND</h1> 
                    </cfif>
                    <cfif movieList.movieID NEQ "">
                        <div id="movie-list" class="flex-container flex-container-wrap">
                            <!-- display list of movies here -->
                            <cfset variables.encrptKey = application.encrptKey>   
                            <cfloop query="movieList"> 
                                <div class="movie flex-item-stretch"> 
                                    <a href="./detail.cfm?id=#URLEncodedFormat(Encrypt(variables.movieList.movieID, encrptKey))#">
                                    <img src="../manage/movies/#movieList.fld_poster#" class="poster-portrait mobile-hide"></a>
                                    <div class="movie-info upcoming">
                                        <a href="./detail.cfm?id=#URLEncodedFormat(Encrypt(variables.movieList.movieID, encrptKey))#">
                                            <h2 class="filim">#movieList.fld_moviename#</h2>
                                        </a> 
                                        <cfif movieList.fld_ratings EQ 1> 
                                            <div class="small-ratings">
                                                <i class="fa fa-star rating-color"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                        <cfelseif movieList.fld_ratings EQ 2> 
                                            <div class="small-ratings">
                                                <i class="fa fa-star rating-color"></i>
                                                <i class="fa fa-star rating-color"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                        <cfelseif movieList.fld_ratings EQ 3> 
                                            <div class="small-ratings">
                                                <i class="fa fa-star rating-color"></i>
                                                <i class="fa fa-star rating-color"></i>
                                                <i class="fa fa-star rating-color"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                        <cfelseif movieList.fld_ratings EQ 4> 
                                            <div class="small-ratings">
                                                <i class="fa fa-star rating-color"></i>
                                                <i class="fa fa-star rating-color"></i>
                                                <i class="fa fa-star rating-color"></i>
                                                <i class="fa fa-star rating-color"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                        <cfelseif movieList.fld_ratings EQ 5> 
                                            <div class="small-ratings">
                                                <i class="fa fa-star rating-color"></i>
                                                <i class="fa fa-star rating-color"></i>
                                                <i class="fa fa-star rating-color"></i>
                                                <i class="fa fa-star rating-color"></i>
                                                <i class="fa fa-star rating-color"></i>
                                            </div>
                                        </cfif>  
                                        <p class="meta-data">#movieList.FLD_DETAILS#</p>       
                                    </div>
                                </div>
                            </cfloop>
                        </cfif>    
                        <div class="movie flex-item-stretch blank">&nbsp;</div>
                    </div>
                </div>
                <aside class="mobile-hide tablet-hide">
                    <cfinclude template="./bannerleftblock.cfm"> 	
                </aside>
            </cfoutput>       
        </section>
        <cfinclude template="./footer.cfm">	
        <script type="text/javascript" src="./js/main.js"></script>   
    </body>
</html>