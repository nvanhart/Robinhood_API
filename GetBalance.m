function BuyingPower = GetBalance
%Returns a list of available OANDA accounts for the supplied token.
%% Input Organization
%% Api Call
RawBalance = GetBalance(api);
%%
%buyingPower = 0; %initializes buying power = 0 to add up
RawBalance = account.items;
BuyingPower = RawBalance

end