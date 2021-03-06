class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format == 'application/json' }

  before_action :configure_devise_permitted_parameters, if: :devise_controller?
  helper_method :user_admin?,:user_usuario?

  protected

    def user_admin?
     current_user.admin?
    end
    
    def user_usuario?
     current_user.usuario?
    end  


=begin
    def configure_devise_permitted_parameters
      registration_params = [:name, :direction_id, :email, :avatar, :password, :password_confirmation]

      if params[:action] == 'update'
        devise_parameter_sanitizer.for(:account_update) { 
          |u| u.permit(registration_params << :current_password)
        }
      elsif params[:action] == 'create'
        devise_parameter_sanitizer.for(:sign_up) { 
          |u| u.permit(registration_params) 
        }
      end
    end
=end

    def configure_devise_permitted_parameters
      registration_params = [:name, :direction_id, :email, :avatar, :password, :password_confirmation]

      if params[:action] == 'update'
        devise_parameter_sanitizer.permit(:account_update) { 
          |u| u.permit(registration_params << :current_password)
        }
      elsif params[:action] == 'create'
        devise_parameter_sanitizer.permit(:sign_up) { 
          |u| u.permit(registration_params) 
        }
      end
    end

    def after_sign_in_path_for(resource)
       super
       flash.now[:notice] = 'Signed in as Super Admin'

       if current_user.role.name == "Administrador"
        assistance_index_path

       elsif  current_user.role.name == "Usuario"
        supports_path
       end
    end

    
end
