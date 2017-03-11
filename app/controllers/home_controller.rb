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
    
    @clusterData = Hash.new
    
    @clusters.each do |cluster, url|
      data = JSON.parse open(url, {ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE}).read
      status = data["services"]["ok"]
      statuses = data["services"]
      
      allOkay = true
      anyOkay = false
      statuses.each do |key, status| 
        if status != "ok" && status != true
          allOkay = false
        end
        if status == "ok" || status == true
          anyOkay = true
        end
      end
        
      statusClass = "success"
      if !allOkay && anyOkay
          statusClass = "warning"
          flash[:warning] = "The <strong>" + cluster + "</strong> cluster is experiencing a few service errors."
      end
      if !allOkay && !anyOkay
          statusClass = "danger"
          flash[:danger] = "The <strong>" + cluster + "</strong> cluster is experiencing significant errors!"
      end
        
      @clusterData[cluster] = Hash({
        'status' => status,
        'statuses' => statuses,
        'allOkay' => allOkay,
        'anyOkay' => anyOkay,
        'statusClass' => statusClass
      })
    end
    
  end
end
