ActiveAdmin.register DoctorSpecialization do
  permit_params :doctor_id, :specialization_id

  index do
    id_column
    column :doctor
    column :specialization
    actions
  end

  filter :doctor
  filter :current_sign_in_at
  filter :sign_in_count

  filter :specialization
  filter :current_sign_in_at
  filter :sign_in_count
end
