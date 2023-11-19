ActiveAdmin.register Theater do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :theater_name, :city, :theater_address, :movie_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:theater_name, :city, :theater_address, :movie_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  permit_params :theater_name, :city, :theater_address, :movie_id

  index do
    selectable_column
    id_column
    column :theater_name
    column :city
    column :theater_address
    column :movie_id
    column :created_at
    actions
  end

  filter :theater_name
  filter :city
  filter :theater_address
  filter :movie_id, as: :select, collection: Movie.all.map{ |m| [m.movie_title, m.id]}

  form do |f|
    f.inputs "Add Theater's Detail" do
      f.input :theater_name
      f.input :city
      f.input :theater_address
      f.input :movie_id, label: 'Movie', as: :select, collection: Movie.all.map{ |m| [m.movie_title, m.id]}
    end
    f.actions
  end
end