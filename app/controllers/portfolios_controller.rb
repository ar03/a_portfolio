class PortfoliosController < ApplicationController
  layout "portfolio"
  def index
    @portfolio_items = Portfolio.all
  end

  def angular
    @angular = Portfolio.angular
  end

  def ror
    @ror = Portfolio.ruby_on_rails
  end

  def new
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end

  def create
    @portfolio_item = Portfolio.new(portfolio_params)
    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolios_path, notice: "Your portfolio item is now live" }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    portfolio_find_by_id
  end

  def update
    portfolio_find_by_id

    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: "The record was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    portfolio_find_by_id
  end

  def destroy
    portfolio_find_by_id

    @portfolio_item.destroy
      respond_to do |format|
        format.html { redirect_to portfolios_url, notice: "The record was successfully deleted." }
      end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(
      :title,
      :subtitle,
      :body,
      technologies_attributes: [:name])
  end

  def portfolio_find_by_id
    @portfolio_item = Portfolio.find(params[:id])
  end
end
