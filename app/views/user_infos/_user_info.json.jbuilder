json.extract! user_info, :id, :first_name, :last_name, :email, :phone, :city, :state, :zip_code, :street, :user_id, :created_at, :updated_at
json.url user_info_url(user_info, format: :json)