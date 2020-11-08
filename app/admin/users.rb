ActiveAdmin.register User do
  config.clear_action_items!

  index do
    id_column
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
