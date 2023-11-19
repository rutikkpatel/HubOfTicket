ActiveAdmin.register Movie do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :movie_title, :movie_description, :movie_duration, :movie_language, :movie_release_date, :movie_country, :movie_rating, :category_id, :theater_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:movie_title, :movie_description, :movie_duration, :movie_language, :movie_release_date, :movie_country, :movie_rating, :category_id, :theater_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
  permit_params :movie_title, :movie_description, :movie_duration, :movie_language, :movie_release_date, :movie_country, :movie_rating, :image, :category_id, :theater_id

end
