class QnsController < ApplicationController
  before_action :set_subject
  before_action :set_section
  before_action :set_section_id, only: [:update, :create]
  before_action :set_qn, only: [:show, :edit, :update, :destroy, :answer, :result]

  def index
    @qns = Qn.all
  end

  def show
  end

  def new
    @qn = Qn.new
  end

  def edit
  end

  def create
    @qn = Qn.new(qn_params)

    if @qn.save
      flash['notice'] = Qn.model_name.human + I18n.t('base.flash.created')
      redirect_to subject_section_path(subject_id:@subject.id, id:@section.id)
    else
      render :new
    end
  end

  def update
    if @qn.update(qn_params)
      flash['notice'] = Qn.model_name.human + I18n.t('base.flash.updated')
      redirect_to subject_section_path(subject_id:@subject.id, id:@section.id)
    else
      render :edit
    end
  end

  def destroy
    @qn.destroy
    flash['notice'] = Qn.model_name.human + I18n.t('base.flash.destroyed')
    redirect_to subject_section_path(subject_id:@subject.id, id:@section.id)
  end

  def answer
    qs_attr = (qn_params.to_h)['qs_attributes']

    # あとで追加予定
    # deviceのユーザなら登録する
    # if @user.user?
    An.create(qn_id:@qn.id,correct_flg: @qn.check(qs_attr))

    qn_ids = qs_attr.map{|k,v|v['id'] if v['an_flg']=='1'}.compact.join(',')
    redirect_to result_subject_section_qn_path(subject_id:@subject.id, section_id:@section.id, id:@qn.id, qn_ids:qn_ids)
  end

  def result
  end

  private

    def set_subject
      @subject = Subject.find(params[:subject_id])
    end

    def set_section
      @section = Section.find(params[:section_id])
    end

    def set_section_id
      params[:qn][:section_id] = @section.id
    end

    def set_qn
      @qn = Qn.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def qn_params
      params.fetch(:qn, {}).permit(:name, :description, :section_id, :from, :qs_attributes => {})
    end
end
