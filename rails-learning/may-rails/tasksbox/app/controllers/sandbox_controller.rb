class SandboxController < ApplicationController
  def clients
      @clients = Client.all
      @client = Client.find(1)
  end

  def projects
  end
end
