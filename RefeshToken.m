function LogoutToken = RefeshToken(jsonBody)
%Requests new daily login token from RH API
%Reads json-formatted body input with login info
%% Assign initial URL, Headers
request = 'https://api.robinhood.com/oauth2/token/'; %define URL
Init_Header = [http_createHeader('Accept','*/*')...  %define Header
               http_createHeader('Accept-Encoding','gzip, deflate')... 
               http_createHeader( 'Accept-Language','en;q=1')...
               http_createHeader('Content-Type','application/x-www-form-urlencoded')...
               http_createHeader('X-Robinhood-API-Version','1.0.0')...
               http_createHeader('Connection','keep-alive')...
               http_createHeader('User-Agent','Robinhood/823 (iPhone; iOS 7.1.2; Scale/2.00)')];

%% Send Login Request to Receive Token
second_response = loadjson(urlread2(request,'POST',jsonBody,Init_Header)); 
token = second_response.refresh_token; %extracts returned refresh token from reply
formatSpec = '%s'; %format for new structure value field
LogoutToken =  sprintf(formatSpec,token);