ActiveAdmin.register User do
  index do
    column :name
    column :email
  end

  filter :name
  filter :current_sign_in_at
  filter :sign_in_count

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
end
