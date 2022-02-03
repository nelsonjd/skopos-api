
class PortfoliosController < ActionController::API

  def show
    @portfolio = Portfolio.first
    
    render json: @portfolio, include: :weightings
  end

  def create
    @portfolio = Portfolio.first

    if @portfolio
      save_porfolio(@portfolio)
      render status: 200, json: @portfolio and return
    end

    @portfolio = Portfolio.create
    save_porfolio(@portfolio)
    render status: 201, json: @portfolio
  end

  def update
  end

  private 

  def save_porfolio(portfolio)
    existing_tickers = portfolio.weightings.pluck(:ticker)
    screened_weightings = portfolio_params[:weightings].reject do |weighting|
      existing_tickers.include? weighting[:ticker]
    end
    for weighting in screened_weightings
      portfolio.weightings.find_or_initialize_by(weighting)
    end
    portfolio.save
  end

  def portfolio_params
    params.require(:portfolio).permit(:weightings => [:ticker, :weight])
  end
end