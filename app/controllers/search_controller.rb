class SearchController < ApplicationController
  require 'net/http'
  API_BASE_URL='https://app.rakuten.co.jp/services/api/BooksBook/Search/20170404'
  
  def search
    if keyword = params[:keyword]
      data = {
        'title'         => URI.encode(keyword),
        'format'        => 'json',
        'applicationId' => '1005768067187627415',
        'booksGenreId'  => '001',
        'hits'          => '20',
        'sort'          => 'sales',
        'size'          => '1'
      }
      uri = URI(API_BASE_URL + '?' + data.map{|k,v| "#{k}=#{v}"}.join('&'))
      response_json = Net::HTTP.get(uri)
      response_data = JSON.parse(response_json)
      @item = response_data["Items"]
    end
  end
  
end
