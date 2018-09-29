# # FormBuilder
# 前提: gem 'hashie'
#
# こんな感じで使います
# form_form @user do |f|
#
#   = f.text_parts :program_id, message: '【アプリ・動画】紐づく番組IDになります。紐付きは名称から自動的に連携しますが、完璧ではありません。また、この項目はEPG連携で上書きされません。', input: { class: 'typeahead-program form-control' }
#   = f.select_parts :over_state, select: { include_blank: nil }, message: '【アプリ・動画】放送単位での放送するしないを定義できます。'
#
#
class ActionView::Helpers::FormBuilder
  include ActionView::Helpers::TagHelper

  CONTROLLER = ApplicationController.new
  CONTROLLER.instance_eval{@_request=Hashie::Mash.new}
  attr_accessor :output_buffer

  %w(text double_text triple_text textarea email password error textarea check checkbox radio select file image video submit date datetime label select_check url).each do |file|
    define_method "#{file}_parts" do |name,opts={}|
      CONTROLLER.render_to_string(:partial => "form_builder/#{file}", locals: {col: name, f: self, opts: opts})
    end
  end

end
