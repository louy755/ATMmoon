json.extract! account, :id, :balance, :account_number, :user_id, :active, :created_at, :updated_at
json.url account_url(account, format: :json)