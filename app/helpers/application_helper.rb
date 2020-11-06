module ApplicationHelper
  def bootstrap_class_for(flash_type)
    {
      success: "alert-success",
      error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-success"
    }.stringify_keys[flash_type.to_s] || flash_type.to_s
  end

  def bootstrap_flash(opts = {})
    flash.each do |msg_type, message|
      concat(
        content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)}", role: "alert") do
          concat content_tag(:button, '×', class: "close", data: { dismiss: 'alert' })
          concat message
        end
      )
    end
    return
  end

  def avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_pack_path('media/images/user.png')
    end
  end

  def avatar_thumb(user)
    if user.avatar_url.present?
      user.avatar.thumb.url
    else
      asset_pack_path('media/images/user.png')
    end
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class} ml-2"
  end

  def appointments_all_comments_nil(doctor)
    doctor.appointments.where(comment: nil).order(created_at: :asc)
  end

  def appointments_comments_nil_limit_10(doctor)
    doctor.appointments.where(comment: nil).order(created_at: :asc).first(10)
  end

  def user_appointments_comments_nil(user)
    user.appointments.where(comment: nil).order(created_at: :asc)
  end

  def user_appointments_comments_not_nil(user)
    user.appointments.where.not(comment: nil).order(created_at: :asc)
  end

  def specialization_all
    Specialization.all
  end

  def doctors_all
    Doctor.all
  end
end
