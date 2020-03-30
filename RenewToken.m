function NewToken = RenewToken(jsonBody)
%Requests new daily login token from RH API
%Reads json-formatted body input with login info
%% Assign initial URL, Headers
request = 'https://api.robinhood.com/oauth2/token/'; %define URL
Init_Header = [http_createHeader('Accept','*/*')...  %define Header
               http_createHeader('Accept-Encoding','gzip, deflate')... 
               http_createHeader('Accept-Language','en;q=1')...
               http_createHeader('Content-Type','application/x-www-form-urlencoded')...
               http_createHeader('X-Robinhood-API-Version','1.0.0')...
               http_createHeader('Connection','keep-alive')...
               http_createHeader('User-Agent','Robinhood/823 (iPhone; iOS 7.1.2; Scale/2.00)')];

%% Send Login Request to Receive Token
first_response = loadjson(urlread2(request,'POST',jsonBody,Init_Header)) 
token = first_response.access_token; %extracts returned access token from reply
formatSpec = 'Bearer %s'; %format for new structure value field
NewToken =  sprintf(formatSpec,token); 


