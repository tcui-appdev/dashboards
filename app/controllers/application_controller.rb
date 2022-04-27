class ApplicationController < ActionController::Base
  def home
    render({ :template => "templates/home.html.erb" })
  end

end
