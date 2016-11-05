class Admin::DictionariesController < ApplicationController
  require "will_paginate/array"
  def show
    @dictionary = Dictionary.last
    @words  = @dictionary.words.paginate(:page => params[:page], :per_page => 50)
  end
end
