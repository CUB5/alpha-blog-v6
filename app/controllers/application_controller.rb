class ApplicationController < ActionController::Base

helper_method :current_user, :logged_in?

  def current_user
    # Para no acceder a la base de datos constantemente, guardamos el resultado
    # de la busqueda en @current_user mediante ||= , el resto es un if else normal escrito de otra manera 
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # Devuelve True o False dependiendo del metodo current_user
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "Necesitas iniciar sesion para realizar esta accion"
      redirect_to login_path
    end
  end

end
