# frozen_string_literal: true

require 'uri'
require 'net/http'

class QueryGithubService
  def self.run(term:, page: 1, per_page: 10)
    query_params = {
      q: "#{term} in:name",
      page: page,
      per_page: per_page
    }

    uri = URI('https://api.github.com/search/repositories')
    uri.query = URI.encode_www_form(query_params)

    res = Net::HTTP.get_response(uri)

    res.is_a?(Net::HTTPSuccess) ? [true, JSON.parse(res.body).deep_symbolize_keys] : [false, { items: [] }]
  end
end
