class SectionsController < ApplicationController
  before_action :set_subject
  before_action :set_subject_id, only: [:update, :create]
  before_action :set_section, only: [:show, :edit, :update, :destroy]

  # GET /sections
  def index
    @sections = Section.all
  end

  # GET /sections/1
  def show
    # あとで追加: 
    #  ユーザで絞り込む
    #  sectionで絞り込む
    @ans_count = An.group(:qn_id).count
    #@ans_percent = An
  end

  # GET /sections/new
  def new
    @section = Section.new
  end

  # GET /sections/1/edit
  def edit
  end

  # POST /sections
  def create
    @section = Section.new(section_params)

    if @section.save
      flash['notice'] = Section.model_name.human + I18n.t('base.flash.created')
      redirect_to subject_path(id: @subject.id)
    else
      render :new
    end
  end

  # PATCH/PUT /sections/1
  def update
    if @section.update(section_params)
      flash['notice'] = Section.model_name.human + I18n.t('base.flash.updated')
      redirect_to subject_path(id: @subject.id)
    else
      render :edit
    end
  end

  # DELETE /sections/1
  def destroy
    @section.destroy
    flash['notice'] = Section.model_name.human + I18n.t('base.flash.destroyed')
    redirect_to subject_path(id: @subject.id)
  end

  private
    def set_subject
      @subject = Subject.find(params[:subject_id])
    end

    def set_subject_id
      params[:section][:subject_id] = @subject.id
    end

    def set_section
      @section = Section.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def section_params
      params.fetch(:section, {}).permit(:name, :subject_id)
    end
end
