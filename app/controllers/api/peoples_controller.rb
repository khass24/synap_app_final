class Api::PeoplesController < ApplicationController

  def index
    @people = Person.all

    render 'index.json.jbuilder'
  end

  def show
    @person = Person.find(params[:id])
    render 'show.json.jbuilder'
  end

end
