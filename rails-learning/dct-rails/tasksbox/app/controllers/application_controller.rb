class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    protect_from_forgery with: :exception

    # Receommended for dealing with ForbiddenAttributesError : http://stackoverflow.com/questions/17450185/forbidden-attributes-error-in-rails-4-when-encountering-a-situation-where-one-wo
    before_filter do
      resource = controller_name.singularize.to_sym
      method = "#{resource}_params"
      params[resource] &&= send(method) if respond_to?(method, true)
    end

    helper_method :current_project

    def current_project
        #instance variable caching
        session[:project] ||= Project.order("RANDOM()").first
    end

    rescue_from CanCan::AccessDenied do
        redirect_to root_path, notice: "Oops!! You are Not allowed to access This Page."
    end

    #session[:user] = User.find_by_email_and_password(params[:email], params[:password])
end
