module HumaneRails::FlashMessagesHelper
  DEFAULTS = {
    baseCls:          nil,
    waitForMove:      nil,
    clickToClose:     nil,
    timeoutAfterMove: nil,
    timeout:          nil
  }

  def humane_flash_messages(options={})
    options = DEFAULTS.merge(options)
    content = ""

    unless flash[:notice].blank?
      content << javascript_tag("humane.notice(\"#{escape_javascript(flash[:notice])}\", #{options.to_json});")
    end

    unless flash[:error].blank?
      content << javascript_tag("humane.error(\"#{escape_javascript(flash[:error])}\", #{options.to_json});")
    end

    unless flash[:alert].blank?
      content << javascript_tag("humane.alert(\"#{escape_javascript(flash[:alert])}\", #{options.to_json});")
    end

    content
  end
end
