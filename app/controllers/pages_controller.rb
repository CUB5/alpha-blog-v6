class PagesController < ApplicationController

  def home

  end

  def about

  end

  def imagen
    @number = rand(100)
  end

end
