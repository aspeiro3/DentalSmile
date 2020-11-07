ActiveAdmin.register Specialization do
  permit_params :title

  index do
    id_column
    column :title
    actions
  end

  filter :title
  filter :current_sign_in_at
  filter :sign_in_count
end
