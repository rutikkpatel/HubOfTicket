ActiveAdmin.register Booking do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :booking_date, :number_of_seats, :booking_status, :show_id, :user_id, :movie_id, :theater_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:booking_date, :number_of_seats, :booking_status, :show_id, :user_id, :movie_id, :theater_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  permit_params :booking_date, :number_of_seats, :booking_status, :show_id, :user_id, :movie_id, :theater_id

  index do
    selectable_column
    id_column
    column :booking_date
    column :number_of_seats
    column :booking_status
    column :show_id
    column :user_id
    column :movie_id
    column :theater_id
    actions
  end

  filter :booking_status
  filter :movie_id, as: :select, collection: Movie.all.map{ |c| [c.movie_title, c.id]}
  filter :theater_id, as: :select, collection: Theater.all.map{ |t| [t.theater_name, t.id]}
end