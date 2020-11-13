module API
  module V1
    class GamesController < API::BaseAPIController
      def new
        game = ::GameRunnerService.setup
        players_names = ::GameRunnerService.players_names game
        render json: players_names
      end
    end
  end
end