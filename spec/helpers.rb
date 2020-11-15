module Helpers
  # Just for Controller tests
  def perform_and_validate_request(method, action, params)
    # Perform it
    send(method, action)
    # send(method, action, params)
    # post "/widgets", :params => { :widget => {:name => "My Widget"} }

    # Test Success request & response
    expect(response).to have_http_status(200)

    resp_obj = JSON.parse(response.body)
    resp_obj = resp_obj.it_keys_to_sym! if resp_obj.is_a?Hash

    expect(resp_obj).to_not be_nil

    # return it hash mapped
    resp_obj
  end
end