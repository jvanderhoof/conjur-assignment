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
      
      # Pulling just the specific nodes and data
      @nodes = @data["database"]["replication_status"]["pg_stat_replication"]
      
      # Sort the nodes according to application name backwards, so "standby" comes first, and then sort by backend_start for date.
      @nodes.sort! { |a, b|  [b["application_name"], a['backend_start']] <=> [a["application_name"], b['backend_start']] }
    
    end
end