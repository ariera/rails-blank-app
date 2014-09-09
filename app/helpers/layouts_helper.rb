module LayoutsHelper
  def dev_tools
    if Rails.env.development? || Rails.env.staging?
      capture do
        render partial:"shared/dev_tools"
      end
    end
  end

  def body_css_classes
    "#{controller.controller_name} #{controller.action_name} #{controller.send(:_layout)}"
  end

  def bootstrap_data
    capture_haml do
      haml_tag :div, id:"bootstrap", class:"hidden" do
        haml_concat content_for(:bootstrap)
      end
    end
  end
end
