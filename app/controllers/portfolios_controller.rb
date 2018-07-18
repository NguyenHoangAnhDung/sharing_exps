class PortfoliosController < ApplicationController
  layout "portfolio"

  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def angular
    @angular_portfolio_items = Portfolio.angular_portfolio_items
  end

  def create
    @portfolio_item = Portfolio.new(portfolios_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: "Your portfolio item is now live." }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @portfolio_item = Portfolio.find params[:id]
  end

  def update
    @portfolio_item = Portfolio.find params[:id]

    respond_to do |format|
      if @portfolio_item.update(prortfolio_params)
        format.html { redirect_to portfolios_path, notice: "The record successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find params[:id]
  end

  def destroy
    @portfolio_item = Portfolio.find params[:id]
    @portfolio_item.destroy

    respond_to do |format|
      format.html { redirect_to portfolios_url, notice: "Record was removed." }
    end
  end

  private

  def prortfolio_params
    params.require(:portfolio)
      .permit(:title, :subtitle, :body, technologies_attributes: [:name])
  end
end
