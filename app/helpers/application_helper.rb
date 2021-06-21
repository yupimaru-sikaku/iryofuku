module ApplicationHelper

  # 登録時にエラーがでた場合、チェックボックスのcheckedを保持
  def is_checked?(model, column, value)
    if params.dig(model, column)
      return params[model][column].include?(value.to_s)
    else
    end
  end

  def is_checked_edit?(model, column, content)
    return true if model[column].include?(content)
  end


end