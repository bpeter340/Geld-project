class HomeController < ApplicationController

  def index
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

end
