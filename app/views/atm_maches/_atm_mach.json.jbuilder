json.extract! atm_mach, :id, :name, :state, :city, :zip_code, :street, :created_at, :updated_at
json.url atm_mach_url(atm_mach, format: :json)