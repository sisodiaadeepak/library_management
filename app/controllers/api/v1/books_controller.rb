# app/controllers/api/v1/books_controller.rb
# frozen_string_literal: true

module Api
  module V1
    # Controller for handling API requests related to books.
    class BooksController < ApplicationController
      before_action :authorize_request
      
      def index
        library = Library.find(params[:library_id])
        books = library.books
        render json: { library: library.name, books: books }
      end
    end
  end
end
