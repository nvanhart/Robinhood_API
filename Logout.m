function status = Logout(rhapi)
%Requests refresh token to logout from RH API (previously
%Logout(clientID,refreshToken))
%% API Call
RawLogout = Logout(rhapi);

%% Print Results
status = RawLogout;

%RawLogout = Logout(rhapi.Client_ID,rhapi.refreshToken);
%% Assign initial URL, Headers
%request = 'https://api.robinhood.com/oauth2/revoke_token/'; %define URL
%params = {'client_id'};
%params = [params,{clientID}];
%params = [params,{'refresh_token'}];
%params = [params,{refreshToken},{'expires_in'},{'3600'}];
%[Logout_Body,unusedHeaderOutput] = http_paramsToString(params,1); %correct urlread2 header already added

%Logout_Header = [http_createHeader('Accept','*/*')...  %define Header
%               http_createHeader('Accept-Encoding','gzip, deflate')... 
%               http_createHeader( 'Accept-Language','en;q=1')...
%               http_createHeader('Content-Type','application/x-www-form-urlencoded')...
%               http_createHeader('X-Robinhood-API-Version','1.0.0')...
%               http_createHeader('Connection','keep-alive')...
%               http_createHeader('User-Agent','Robinhood/823 (iPhone; iOS 7.1.2; Scale/2.00)')];

%% Send Logout Request
%status = loadjson(urlread2(request,'POST',Logout_Body,Logout_Header)) 


