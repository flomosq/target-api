ActiveAdmin.register Target do
  includes :user

  actions :index, :show

  index do
    id_column
    column :title
    column :topic
    column('User') { |t| t.user.email }
    column :radius
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :title
      row :topic
      row('User') { |t| t.user.email }
      row :radius
      row :latitude
      row :longitude
      row :created_at
      row :updated_at
    end
  end
end
