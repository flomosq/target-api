ActiveAdmin.register Target do
  actions :index, :show

  permit_params :user_id, :topic_id, :title, :radius, :latitude, :longitude

  index do
    id_column
    column :title
    column :topic
    column('User') { |t| t.user.email }
    column :radius
    column :created_at
    actions
  end

  filter :topic

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
