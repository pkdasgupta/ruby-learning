class SandboxController < ApplicationController
  def clients
      @clients = Client.all
  end

  def projects
  end
end
