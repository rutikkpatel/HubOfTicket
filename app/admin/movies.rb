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
  
  permit_params :movie_title, :movie_description, :movie_duration, :movie_language, :movie_release_date, :movie_rating, :image, :category_id, :theater_id

  index do
    selectable_column
    id_column
    column :movie_title
    column :movie_description
    column :movie_duration
    column :movie_language
    column :movie_release_date
    column :movie_rating
    column :category_id
    column :theater_id
    actions
  end

  filter :movie_title
  filter :movie_description
  filter :movie_duration
  filter :movie_language
  filter :movie_release_date
  filter :movie_rating
  filter :category_id, as: :select, collection: Category.all.map{ |c| [c.category_name, c.id]}
  filter :theater_id, as: :select, collection: Theater.all.map{ |t| [t.theater_name, t.id]}

  form do |f|
    f.inputs "Add Movie's Detail" do
      f.input :movie_title
      f.input :image, as: :file
      f.input :movie_description
      f.input :movie_duration
      f.input :movie_language
      f.input :movie_release_date
      f.input :movie_rating
      f.input :category_id, label: 'Category Name', as: :select, collection: Category.all.map{ |c| [c.category_name, c.id]}
      f.input :theater_id, label: 'Theater Name', as: :select, collection: Theater.all.map{ |t| [t.theater_name, t.id]}
    end
    f.actions
  end
end