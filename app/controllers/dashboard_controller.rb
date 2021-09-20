# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @result = { items: [] }
    @page = 1
    @per_page = 10
    @suggestions = { items: [] }
  end

  def search
    @page = search_params[:page].to_i
    @per_page = search_params[:per_page].to_i
    if search_params[:term].blank?
      @result = { items: [] }
    else
      @success, @result = QueryGithubService.run(**search_params.to_h.deep_symbolize_keys)
    end
  end

  private

  def search_params
    params.require(:search).permit(:term, :page, :per_page)
  end
end
