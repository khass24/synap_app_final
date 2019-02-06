class Api::PeoplesController < ApplicationController

  def index
    @people = Person.all

    render 'index.json.jbuilder'
  end

  def show
  end

end
