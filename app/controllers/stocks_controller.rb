class StocksController < ApplicationController

  def index
    # @stocksymbol = params[:stocksymbol]
    # render('index')
    puts "index"
    puts params[:stocksymbol]
  end

  def show
    # @stocksymbol = params[:stocksymbol]
    puts "show"
    puts params[:stocksymbol]
  end

  # TODO:AJ: need to research why the get is going to CREATE instead of SHOW.  It's probably simple.
  def create
    # Clean out our visuals
    flash[:notice] = nil
    flash[:error] = nil

    puts "create"
    puts @stocksymbol
    @stocksymbol = params[:stocksymbol].upcase.strip
    puts "upcase:"
    puts @stocksymbol

    # TODO:AJ There has to be a better way to handle this
    # Handle null string
    if @stocksymbol.nil?
      puts "nil"
      flash[:error] = "I'm sorry, but you have to enter a stock symbol."
      render('index') and return
    end

    # Handle empty string
    if @stocksymbol.empty?
      flash[:error] = "I'm sorry, but you didn't enter a stock symbol."
      render('index') and return
    end

    # so we have a symbol!
    @stock = StockQuote::Stock.quote(@stocksymbol)

    # TODO:AJ The api lets you enter multiple comma separated symbols.  This will cause an error.  Need to handle user when they do bad things like: " Google, GOOG,    AAPL, "
    if @stock.success?
      # TODO:AJ:  Stock::currency is showing as a undefined method.  Figure this out
      # TODO:AJ hard coding $
      flash[:notice] = "#{@stock.name} stock, symbol #{@stocksymbol}, has a stock price of $ #{@stock.ask}.  Last Traded on #{@stock.last_trade_date}"
      render('index') and return
    else
      # maybe we don't have a symbol
      flash[:error] = "I'm sorry, but #{@stocksymbol} is not a known symbol}."
      render('index') and return
    end
  end

end
