class QsController < ApplicationController
  before_action :set_subject
  before_action :set_section
  before_action :set_qn
  before_action :set_qn_id, only: [:update, :create]
  before_action :set_q, only: [:show, :edit, :update, :destroy]

  # GET /qs
  def index
    @qs = Q.all
  end

  # GET /qs/1
  def show
  end

  # GET /qs/new
  def new
    @q = Q.new
  end

  # GET /qs/1/edit
  def edit
  end

  # POST /qs
  def create
    @q = Q.new(q_params)

    if @q.save
      flash['notice'] = Q.model_name.human + I18n.t('base.flash.created')
      redirect_to edit_subject_section_qn_path(subject_id:@subject.id, section_id:@section.id, id:@qn.id)
    else
      render :new
    end
  end

  # PATCH/PUT /qs/1
  def update
    if @q.update(q_params)
      flash['notice'] = Q.model_name.human + I18n.t('base.flash.updated')
      redirect_to edit_subject_section_qn_path(subject_id:@subject.id, section_id:@section.id, id:@qn.id)
    else
      render :edit
    end
  end

  # DELETE /qs/1
  def destroy
    @q.destroy
    flash['notice'] = Q.model_name.human + I18n.t('base.flash.destroyed')
    redirect_to edit_subject_section_qn_path(subject_id:@subject.id, section_id:@section.id, id:@qn.id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject
      @subject = Subject.find(params[:subject_id])
    end

    def set_section
      @section = Section.find(params[:section_id])
    end

    def set_qn
      @qn = Qn.find(params[:qn_id])
    end

    def set_qn_id
      params[:q][:qn_id] = @qn.id
    end

    def set_q
      @q = Q.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def q_params
      params.fetch(:q, {}).permit(:name, :qn_id)
    end
end
