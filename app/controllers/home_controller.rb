class HomeController < ApplicationController
  def index
    require 'open-uri'
      require 'openssl'
      require 'json'
      require 'uri'
    
    @clusters = Array({
      'conjur-master.itp.conjur.net' => 'https://conjur-master.itp.conjur.net/health',
      'example-partial-down' => 'public/partial-down.json', 
      'example-all-down' => 'public/all-down.json'
    })
    
  end
end
