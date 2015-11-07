ActiveAdmin.register Comment, :as => "PhotoComment" do

  permit_params :user_id, :photo_id, :text, :rating


  form do |f|
    f.inputs do
      f.input :text
      f.input :rating
    end
    f.actions
  end

  index do
    selectable_column
    column 'Comment Text', :text
    column :user
    column :rating
    actions
  end

  show do
    attributes_table do
      row :text
      row :rating
      row :user
    end
    active_admin_comments
  end

end
