class TagController < ApplicationController
  def show
    @entries = Entry.tagged_with(params[:name]).order('created_at DESC').paginate(page: params[:page])
    @entries_all = Entry.order('created_at DESC')
  end
end
