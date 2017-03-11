class DetailsController < ApplicationController
    def show
      require 'open-uri'
      require 'openssl'
      require 'json'
      require 'time'
      require 'uri'
      
      @parameter = params[:id]
      
      #testJSON = 'public/health.json'
      # File is also saved locally in case of URL issues
      
      # Grab the remote JSON file and pass it to the view after parsing
      remoteJSON = URI.decode( params[:url] )
      @data = JSON.parse open(remoteJSON, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}).read
      
      @master = URI.decode( params[:id] )
    end
end
