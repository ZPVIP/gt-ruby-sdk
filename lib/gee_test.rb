require 'net/http'
require 'gee_test/version'
require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/core_ext/object/to_query'

module GeeTest
  autoload :Configure, File.expand_path('../gee_test/configure', __FILE__)

  class << self
    include Configure

    def validate(params = {})
      challenge = params[:geetest_challenge] || ''
      validate = params[:geetest_validate] || ''
      seccode = params[:geetest_seccode] || ''

      md5 = Digest::MD5.hexdigest(app_key + 'geetest' + challenge)

      if validate == md5
        response = post(validate_url, seccode: seccode)
        response == Digest::MD5.hexdigest(seccode)
      end
    rescue => e
      puts "Exception is happened, It is #{e}"
    end

    def post(uri, data)
      uri = URI(uri)
      res = Net::HTTP.post_form(uri, data)
      res.body
    end

    def gee_test_tag(config = {})
      config.merge! gt: app_id
      
      "<script type='text/javascript' src='//api.geetest.com/get.php?#{config.to_query}'></script>".html_safe
    end
  end
end
