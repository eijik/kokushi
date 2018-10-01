class SubjectsController < ApplicationController
  before_action :set_subject, only: [:show, :edit, :update, :destroy]

  def index
    @subjects = Subject.all
  end

  def show
  end

  def new
    @subject = Subject.new
  end

  def edit
  end

  def create
    @subject = Subject.new(subject_params)

    if @subject.save
      flash['notice'] = Subject.model_name.human + I18n.t('base.flash.created')
      redirect_to subjects_path
    else
      render :new
    end
  end

  def update
    if @subject.update(subject_params)
      flash['notice'] = Subject.model_name.human + I18n.t('base.flash.updated')
      redirect_to subjects_path
    else
      render :edit
    end
  end

  def destroy
    @subject.destroy
    flash['notice'] = Subject.model_name.human + I18n.t('base.flash.destroyed')
    redirect_to subjects_path
  end

  private
    def set_subject
      @subject = Subject.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subject_params
      params.fetch(:subject, {}).permit(:name)
    end
end
