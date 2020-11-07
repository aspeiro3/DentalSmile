ActiveAdmin.register Doctor do
  permit_params :name, :avatar, :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at

  index do
    id_column
    column :name
    column :email
    actions
  end

  filter :id
  filter :current_sign_in_at
  filter :sign_in_count

  filter :name
  filter :current_sign_in_at
  filter :sign_in_count

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count

end
