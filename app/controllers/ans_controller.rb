class AnsController < ApplicationController
  before_action :set_an, only: [:show, :edit, :update, :destroy]

  # GET /ans
  def index
    @ans = An.all
  end

  # GET /ans/1
  def show
  end

  # GET /ans/new
  def new
    @an = An.new
  end

  # GET /ans/1/edit
  def edit
  end

  # POST /ans
  def create
    @an = An.new(an_params)

    if @an.save
      redirect_to @an, notice: 'An was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /ans/1
  def update
    if @an.update(an_params)
      redirect_to @an, notice: 'An was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /ans/1
  def destroy
    @an.destroy
    redirect_to ans_url, notice: 'An was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_an
      @an = An.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def an_params
      params.fetch(:an, {})
    end
end
