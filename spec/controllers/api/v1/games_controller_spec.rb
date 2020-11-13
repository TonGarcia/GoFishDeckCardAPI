require 'spec_helper'

describe API::V1::GamesController do
  describe 'API Create new game' do
    it 'might return it players (min 2 & max 5)' do
      # Perform it
      resp = perform_and_validate_request(:post, :new, params=nil)

      # Response attrs validations
      expect(resp).to_not be_nil
      # expect(services_status[:request_id]).to_not be_nil
      # expect(services_status[:since].to_datetime).to be_a_kind_of DateTime
    end
  end
end