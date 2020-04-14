class Books::ApiConnectService
  attr_accessor :uri

  def initialize(uri)
    @uri = uri
  end

  def execute
    connect_api
  end

  private

  def connect_api
    https = Net::HTTP.new(@uri.host, @uri.port)
    https.use_ssl = true
    request = Net::HTTP::Get.new(@uri.request_uri)
    response = https.request(request)
    JSON.parse(response.body)
  end
end
