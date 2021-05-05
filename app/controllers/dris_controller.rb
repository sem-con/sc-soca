class DrisController < ApplicationController
    include ApplicationHelper

    # respond only to JSON requests
    respond_to :json
    respond_to :html, only: []
    respond_to :xml, only: []

    def read
       puts "DRI: " + params[:dri].to_s
       puts "Name: " + params[:name].to_s 
       @item = Store.find_by_schema_dri(params[:dri]) rescue nil
       if @item.nil?
            rendern json: {"error": "not found"},
                    status: 404
            return
        end
       render json: JSON.parse(@item.item),
              status: 200
    end
end