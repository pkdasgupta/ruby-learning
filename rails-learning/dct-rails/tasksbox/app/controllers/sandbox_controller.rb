class SandboxController < ApplicationController
  #require 'json'
  #require 'httparty'

  def clients
      @clients = Client.all
  end

  def projects
  end

  def product_categories
  	@product_categories = ProductCategory.all
  end

	def job_search

	end

	def search_results
		location = params[:location]
		job_type = params[:job_type]
		response = HTTParty.get("http://api.indeed.com/ads/apisearch?publisher=7277146494571922&q=#{job_type}&co=india&l=#{location}&format=json&v=2")
		@jobs = JSON.parse(response.parsed_response)
	end



end
