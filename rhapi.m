%% Initialize every 55 minutes to generate new authorization token. Only functions should be run regularly.
classdef rhapi
       properties (Constant)
%% Initial setup
           username = 'xxxxxxx';

           password = 'xxxxxxxx';

           server = 'https://api.robinhood.com/'; %the URL to which the requests will be ammended
           Client_ID = 'fkjdflkdsjfldsfjdlfjdskfdsf';
           Json_Body = jsonBodyFormatRH(rhapi.username,rhapi.password,rhapi.Client_ID) %formats jsonbody string
           newToken = RenewToken(rhapi.Json_Body); %renews authorization token
           %LogoutToken = RefreshToken(rhapi.Json_Body); %renews refresh token to log out
           Auth_Header = [http_createHeader('Accept','*/*')... %unsure if these need to be in a particular order..
                          http_createHeader('Accept-Encoding','gzip, deflate')... 
                          http_createHeader( 'Accept-Language','en;q=1')...
                          http_createHeader('Content-Type','application/x-www-form-urlencoded; charset=utf-8')... %necessary header for urlread2 POST
                          http_createHeader('X-Robinhood-API-Version','1.0.0')...
                          http_createHeader('Connection','keep-alive')...
                          http_createHeader('User-Agent','Robinhood/823 (iPhone; iOS 7.1.2; Scale/2.00)')...
                          http_createHeader('Authorization',rhapi.newToken)] %creates & concatenates headers into structure array 
                      
       end
       methods
%% Logout                    logout of robinhood. Under construction. Current token expires in 1 hour.
        %function RawLogout = Logout(rhapi)
        %    request = 'oauth2/revoke_token/';
        %    body = ['client_id=',rhapi.Client_ID,'&refresh_token=',rhapi.LogoutToken,'&expires_in=30'];                
        %    RawLogout = loadjson(urlread2([rhapi.server,request],'POST',body,rhapi.Auth_Header));
        %end

%% GetBalance             returns available account balance UNDER CONSTRUCTION
        function RawBalance = GetBalance(rhapi)
            request = 'account/';
            RawBalance = loadjson(urlread2([rhapi.server,request],'GET','',rhapi.Auth_Header));
        end
%% MarketOrder            place market order
        function RawMarketOrder = MarketOrder(rhapi,symbol,quantity,side)
            request = 'orders/'
            accountUrl = AccountURL(dfsdf); %NEED TO BUILD THIS - LOOKS UP URL FOR PROFILE
            symbolUrl = InstrumentURL(symbol); %NEED TO BUILD THIS - LOOKS UP RH URL FOR SYMBOL
            Body = ['account=',accountUrl,'&instruments=',symbolUrl,...
                    '&symbol=',symbol,'&quantity=',quantity,'&type=market',...
                    '&time_in_force=timeInForce&side=',side,'&trigger=immeadiate', ...
                    '&extendd_hours=extendedHours'];
            RawMarketOrder = loadjson(urlread2([rhapi.server,request],'POST',Body,rhapi.Auth_Header));
        end
%% ModifyOrder            modifies existing order
        function RawModifyOrder = ModifyOrder(rhapi)
            request = 'orders/{}/'
            RawModifyOrder = loadjson(urlread2([rhapi.server,request],'GET','',rhapi.Auth_Header));
        end
%% CancelOrder            cancels existing order
        function RawCancelOrder = CancelOrder(rhapi)
            request = 'orders/{}/cancel/'
            RawCancelOrder = loadjson(urlread2([rhapi.server,request],'GET','',rhapi.Auth_Header));
        end
%% FutureFunctions
       end
end
