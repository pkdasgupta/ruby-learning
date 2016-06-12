class GarageController < ApplicationController
  def clients
      @clients = Client.all
  end

  def projects
      @projects = Project.all
  end

  def tasks
  end
end
