# DadController for all others API Controllers
module API
  SUCCESS = 200
  INTERNAL_ERROR = 500

  # remember: after_action is called after the Page was rendered to the user (response closed)
  class BaseAPIController < ApplicationController
    # respond_to :json

    # Actions & Filters callbacks config
    # TODO uncomment on production when on SSL before_filter :validate_ssl, unless: :post_back_action?
    # before_filter :register_it_request
    # before_action :set_access_control_headers # Open/Enable Cross-Domain for JS
    # before_filter :authenticate, unless: :skip_auth? # Skip authenticity token

    # Aux Controller Attributes
    # attr_accessor :api_request
    #
    # # Permit cross-domain
    # def set_access_control_headers
    #   headers['Access-Control-Allow-Origin'] = '*'
    #   headers['Access-Control-Request-Method'] = '*'
    #   headers['Access-Control-Allow-Headers'] = 'Content-Type'
    #   headers['content-type: application/json; charset=utf-8']
    # end
    #
    # # Test if is necessary to Skip Auth validations
    # def skip_auth?
    #   # Controller without Auth
    #   return true if controller_name == 'status'
    #   # Actions without Auth
    #   return true if action_name == 'post_back' || action_name == 'global_app'
    #
    #   false
    # end
    #
    # # Refuse requests which are not HTTPS
    # def validate_ssl
    #   # Validation only for Production environment
    #   return unless Rails.env.production?
    #   head :forbidden, json: {error: 'Request denied. Receiving only HTTPS requests.'} unless request.ssl?
    # end
    #
    # def authenticate
    #   # TODO set params_aux which have the card infos structure passed, but not it values
    #   # SetUp objs like it current ClientApp
    #   begin
    #     # App auth
    #     if params[:auth].nil? || params[:auth].empty?
    #       params[:auth] = {
    #           app_id:     request.headers['Auth-App-Id'],
    #           secret_key: request.headers['Auth-Secret-Key']
    #       }
    #     end
    #
    #     app_params = params.require(:auth).permit(:app_id, :secret_key)
    #     @app = App.where(id:app_params[:app_id], secret_key:app_params[:secret_key]).take unless app_params[:app_id].nil? || app_params[:secret_key].nil?
    #     return render json: {error:'Auth error. Invalid AppID or SecretKey.'} if @app.nil?
    #   rescue => e
    #     msg = e.to_s
    #     msg = 'Missing Params, check the documentation.' if params[:debug].nil?
    #     return render json: {request_id:api_request.id, error:msg}
    #   end
    # end
    #
    # protected
    # def post_back_action?
    #   action_name == 'post_back'
    # end
    #
    # def login_not_required
    #   true
    # end
    #
    # def to_logic_array_from(http_array)
    #   logic_array = []
    #   http_array.each {|element| logic_array << element}
    #   logic_array
    # end
    #
    # # save APIRequest
    # def register_it_request
    #   # Prevent to persist the Client Card infos
    #   params_json = params.clone
    #   ip = request.remote_ip
    #
    #   unless params[:transaction].nil?
    #     transaction = params[:transaction].clone
    #     if transaction.is_a?Hash
    #       card = transaction[:card]
    #
    #       if card.is_a?Hash
    #         params_json[:transaction][:card] = {}
    #         card_values = card.values
    #         card.keys.each_with_index {|key, i| if card_values[i].is_a?String then params_json[:transaction][:card][:"#{key}"] = card_values[i].length end }
    #         params_json = params_json.to_json
    #       end
    #     end
    #   end
    #
    #   params_json = params_json.to_json unless params_json.is_a?String
    #   self.api_request = APIRequest.new(controller:params[:controller], action:params[:action], app_id:params[:app_id], params:params_json, ip:ip)
    #   render json: api_request.errors.messages unless api_request.save
    # end
    #
    # # Callbacks
    # private
    # # def setup_locale
    # #   # TODO check if it is really necessary, it is useful when internationalized!
    # #   user = User.joins(:apps).where("apps.id = #{@app.id} AND human_resources.owner=true").take
    # #   I18n.locale = user.locale || I18n.default_locale
    # # end
    #
    # def render(*args)
    #   # If the request wasn't registered abort it method
    #   return if self.api_request.nil?
    #
    #   # Find the JSON to append the RequestID
    #   args.each do |arg|
    #     json = arg[:json]
    #     if json.is_a?Hash
    #       arg[:json] = {request_id: self.api_request.id}.merge json
    #       break
    #     end
    #   end
    #
    #   # Exec the parent
    #   super
    # end
  end
end