module API::Concerns
  class HttpTestHelper
    extend ActiveSupport::Concern

    def self.post(url, hash_params)
      uri = URI.parse(url)
      return Net::HTTP.post_form(uri, hash_params)
    end
  end
end