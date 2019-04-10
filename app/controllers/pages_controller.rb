class PagesController < ApplicationController
	def home
	end
	def about
    if request.env['HTTP_X_FORWARDED_FOR'].present?
    logger.debug "request.env['HTTP_X_FORWARDED_FOR']: "
    logger.debug request.env['HTTP_X_FORWARDED_FOR']
    @env_http = request.env['HTTP_X_FORWARDED_FOR']
    @env_http_first = request.env["HTTP_X_FORWARDED_FOR"].try(:split, ',').try(:first)
    end

    if request.headers['HTTP_X_FORWARDED_FOR'].present?
    logger.debug "request.headers['X-Forwarded-For']: " 
    logger.debug request.headers['X-Forwarded-For']
    @header_http = request.headers['X-Forwarded-For']
    end

    @user_ip_addr = request.env["HTTP_X_FORWARDED_FOR"].try(:split, ',').try(:first) || request.env["REMOTE_ADDR"]
    logger.debug " request.env[HTTP_X_FORWARDED_FOR].try(:split, ',').try(:first) || request.env[REMOTE_ADDR]"
    logger.debug request.env["HTTP_X_FORWARDED_FOR"].try(:split, ',').try(:first) || request.env["REMOTE_ADDR"]
    
    logger.debug "request.env[REMOTE_ADDR]: "
    logger.debug request.env["REMOTE_ADDR"]
    @remote_addr = request.env["REMOTE_ADDR"]
    
    logger.debug "request.remote_ip "
    logger.debug request.remote_ip
    @remote_ip = request.remote_ip
	end
end
