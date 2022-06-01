<cfcomponent output="false">
    <cfset this.name = 'CF Online Movie Booking'/>
	<cfset this.datasource = 'cf_task_employee'/>  
	<cfset this.applicationTimeout = createtimespan(0,2,0,0) />    
	<cfset this.sessionManagement = true />
	<cfset this.sessionTimeout = createTimespan(0,0,30,0) />  
	<cfset this.clientManagement = true>
	<cfset this.setClientCookies = true /> 
	<cfset this.ormenabled = "true">
	<cfset this.ormsettings={datasource="cf_task_employee", logsql="true"}>
	<cfset This.scriptProtect="all"/> 
	<cffunction name="onApplicationStart" returntype="boolean" >		
		<cfreturn true />
	</cffunction>
	<cffunction name="onRequestStart" returntype="boolean" >
		<cfargument name="targetPage" type="string" required="true" />	 
		<cfif structKeyExists(URL,'logout')>
			<cfset structdelete(session,'stLoggedInUser') />			
		</cfif>	
		<cfset variables.whiteList = "booking.cfm,home.cfm,index.cfm,movies.cfm,password.cfm,users.cfm,times.cfm,theaters-list.cfm">   
		<cfif ListContains(variables.whiteList, GetFileFromPath(CGI.CF_TEMPLATE_PATH)) AND session.stLoggedInUser.loggedin EQ false >
			<cflocation url = "./login.cfm" addtoken="false" />  
		</cfif>
		<cfreturn true />
	</cffunction>
	<cffunction name="onSessionStart" access="public" output="false" returntype="void">
     	<cflock timeout=20 scope="Session" type="Exclusive">      
			<cfset session.stLoggedInUser = {'loggedin'=false,'emailID' = '',
			'userID' = 0} />   
     	</cflock>  
	</cffunction> 
	<cffunction name="onError" returnType="void" output="true"> 
		<cfargument name="exception" required="true">
		<cfargument name="eventname" type="string" required="true">
		<cfset var errortext = "">
		<cflog file="myapperrorlog" text="#arguments.exception.message#">
		<cfsavecontent variable="errortext">
			<cfoutput>
				An error occurred: http://#cgi.server_name##cgi.script_name#?#cgi.query_string#<br />
				Time: #dateFormat(now(), "short")# #timeFormat(now(), "short")#<br />
				<cfdump var="#arguments.exception#" label="Error">
				<cfdump var="#form#" label="Form">
				<cfdump var="#url#" label="URL">
			</cfoutput>
		</cfsavecontent> 
		<cflocation url="404error.cfm" addtoken="no"> 
	</cffunction>     
	<cffunction name="onMissingTemplate" returntype="Boolean" output="false">
		<cfargument name="templateName" required="true" type="String" />
		<!--- Put your home page file name here --->
		<cflocation url="./login.cfm" /> 
    <cfreturn true />
	</cffunction>
</cfcomponent> 