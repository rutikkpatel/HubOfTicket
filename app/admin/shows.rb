ActiveAdmin.register Show do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :show_date, :show_time, :movie_id, :theater_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:show_date, :show_time, :movie_id, :theater_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  permit_params :show_date, :show_time, :movie_id, :theater_id

  index do
    selectable_column
    id_column
    column :show_date
    column :show_time
    column :movie_id
    column :theater_id
    column :created_at
    actions
  end

  filter :movie_id, as: :select, collection: Movie.all.map{ |m| [m.movie_title, m.id]}
  filter :theater_id, as: :select, collection: Theater.all.map{ |t| [t.theater_name, t.id]}

  form do |f|
    f.inputs "Add Movie's Show Details" do
      f.input :show_date, as: :date_picker
      f.input :show_time, as: :time_picker
      f.input :movie_id, label: 'Movie Name', as: :select, collection: Movie.all.map{ |m| [m.movie_title, m.id]}
      f.input :theater_id, label: 'Theater Name', as: :select, collection: Theater.all.map{ |t| [t.theater_name, t.id]}
    end
    f.actions
  end
end