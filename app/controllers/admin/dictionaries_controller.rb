class Admin::DictionariesController < ApplicationController
  def show
    @dictionary = Dictionary.last
  end
end
