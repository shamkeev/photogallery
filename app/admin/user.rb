ActiveAdmin.register User do

  permit_params :name, :email, :password

  index do
    selectable_column
    id_column
    column :email
    column :name
    actions
  end

  show do
    attributes_table do
      row :name
      row :email
    end
    active_admin_comments
  end

  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
