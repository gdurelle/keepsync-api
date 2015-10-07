class ListsController < ApplicationController
  def index
    lists = current_user.lists
    render json: lists.as_json
  end

  def show
    list = List.where(id: params[:id]).first
    head :not_found and return if list.nil?
    items = list.items
    render json: { _self: list.as_json, items: items.as_json }
  end
end