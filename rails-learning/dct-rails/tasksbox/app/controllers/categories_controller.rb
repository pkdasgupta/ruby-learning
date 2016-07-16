class CategoriesController < ApplicationController

	def index 
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(params[:category].permit(:name))
		@category.save
	end

	def destroy
		@category = Category.find(params[:id])
		@category.delete
	end

end
