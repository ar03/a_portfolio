class PortfoliosController < ApplicationController
  before_action :portfolio_find_by_id, only: [:edit, :update, :show, :destroy]
  before_action :set_technologies, only: [:edit, :new]
  access all: [:show, :index, :angular, :ror], user: {except: [:destroy, :new, :create, :update, :edit]}, site_admin: :all
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
  end

  def update

    respond_to do |format|
      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to portfolios_path, notice: "The record was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy

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

  def set_technologies
    @portfolio_item = Portfolio.new
    3.times { @portfolio_item.technologies.build }
  end
end
