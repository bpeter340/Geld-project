class HomeController < ApplicationController
ENV['PLAID_CLIENT_ID'] = '5a92f26d8d9239244b8061e0'
ENV['PLAID_SECRET'] = '2ecc1b9c97ee73f967d90586a5af7a'
ENV['PLAID_PUBLIC_KEY'] = '11ed3e225b8e10a435dc449dca8d51'

  def index
  end

  def access_token
    $client = Plaid::Client.new(env: :sandbox,
                               client_id: ENV['PLAID_CLIENT_ID'],
                               secret: ENV['PLAID_SECRET'],
                               public_key: ENV['PLAID_PUBLIC_KEY'])

    access_token = nil
    logger.info params[:public_token]
    exchange_token_response = $client.item.public_token.exchange(params[:public_token])
    $access_token = exchange_token_response['access_token']
    $item_id = exchange_token_response['item_id']
    puts "access token: #{$access_token}"
    puts "item id: #{$item_id}"
    exchange_token_response.to_json
  end

  def accounts
    auth_response = $client.auth.get($access_token)
    render json: auth_response.to_json
  end

  def item
    item_response = $client.item.get($access_token)
    institution_response = $client.institutions.get_by_id(item_response['item']['institution_id'])
    render json: { item: item_response['item'], institution: institution_response['institution'] }.to_json
  end

  def transactions
    now = Date.today
    thirty_days_ago = (now - 30)
    transactions_response = $client.transactions.get($access_token, thirty_days_ago, now)

    render json: transactions_response.to_json
  end
end
