require "rails_helper"
require_relative '../../../../app/services/game_runner_service'
require_relative '../../../../spec/helpers'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe API::V1::GamesController do
  describe 'API Create new game' do
    # before {post '/api/v1/games'}

    it 'might return it players (min 2 & max 5)' do
      # Perform it
      # expect(JSON.parse(response.body).size).to eq(20)
      resp = perform_and_validate_request(:post, :new, params=nil)

      # Response attrs validations
      expect(resp).to_not be_nil
      expect(resp.length).to be_between(2, 5)
    end
  end
end