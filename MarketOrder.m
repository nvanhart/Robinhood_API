function RawOrder = MarketOrder(rhapi,symbol,quantity,side)
% Opens a new order and return it's details
%    :param symbol: The stock ticker of the stock to purchase.
%    :type symbol: string
%    :param quantity: The number of stocks to buy.
%    :type quantity: integer
%    :param side: Buy or sell
%    :type side: string
%    :param timeInForce: Changes how long the order will be in effect for. 'gtc' = good until cancelled. \
%    'gfd' = good for the day. 'ioc' = immediate or cancel. 'opg' execute at opening.
%    :type timeInForce: Optional[str]
%    :param extendedHours: Premium users only. Allows trading during extended hours. Should be true or false.
%    :type extendedHours: str
%    :returns: Dictionary that contains information regarding the purchase of stocks, \
%    such as the order id, the state of order (queued,confired,filled, failed, canceled, etc.), \
%    the price, and the quantity.
%% Input Organization
%% API Call
RawOrderInfo = MarketOrder(rhapi,symbol,quantity,side);
%% Output Assignment
RawOrder = RawOrderInfo;