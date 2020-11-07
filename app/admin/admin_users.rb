ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation

  index do
    id_column
    column :email
    column :created_at
    actions
  end

  filter :id
  filter :current_sign_in_at
  filter :sign_in_count

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
