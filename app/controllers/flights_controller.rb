class FlightsController < ApplicationController
  def index
    @flights = Flight.all.order({ :created_at => :desc })

    render({ :template => "flights/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @flight = Flight.where({:id => the_id }).at(0)

    render({ :template => "flights/show.html.erb" })
  end

  def create
    @flight = Flight.new
    @flight.user_id = params.fetch("user_id_from_query")
    @flight.description = params.fetch("description_from_query")
    @flight.departs_at = params.fetch("departs_at_from_query")
    @flight.message_sent = params.fetch("message_sent_from_query", false)

    if @flight.valid?
      @flight.save
      redirect_to("/flights", { :notice => "Flight created successfully." })
    else
      redirect_to("/flights", { :notice => "Flight failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @flight = Flight.where({ :id => the_id }).at(0)

    @flight.user_id = params.fetch("user_id_from_query")
    @flight.description = params.fetch("description_from_query")
    @flight.departs_at = params.fetch("departs_at_from_query")
    @flight.message_sent = params.fetch("message_sent_from_query", false)

    if @flight.valid?
      @flight.save
      redirect_to("/flights/#{@flight.id}", { :notice => "Flight updated successfully."} )
    else
      redirect_to("/flights/#{@flight.id}", { :alert => "Flight failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @flight = Flight.where({ :id => the_id }).at(0)

    @flight.destroy

    redirect_to("/flights", { :notice => "Flight deleted successfully."} )
  end
end
