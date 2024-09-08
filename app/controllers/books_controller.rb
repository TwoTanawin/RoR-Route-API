class BooksController < ApplicationController
  def index
    # books = Book.all
    books = Book.all.first(10)
    # render json: { books: books.as_json, count: books.count }
    render json: { books: books.map { |b| b.as_api_json }, count: books.count }
  end

  def show
    # raise "#{params[:id]}"
    book = Book.find(params[:id]) rescue nil
    if book.present?
      render json: book.as_api_json
    else
      render json: { status: 404, error: "Not Found" }, status: 404
    end
  end

  def create
    # raise "#{params.to_json}"
    book = Book.new(name: params[:name])
    if book.save
      render json: book.as_api_json
    else
      render json: { status: 400, error: book.error.as_json }, status: 400
    end
  end

  def update
    # raise "#{params.to_json}"
    book = Book.find(params[:id]) rescue nil
    if book.present?
      book.name = params[:name]
      if book.save
        render json: book.as_api_json
      else
        render json: { status: 400, error: book.error.as_json }, status: 400
      end
    else
      render json: { status: 404, error: "Not Found" }, status: 404
    end
  end

  def destroy
    book = Book.find(params[:id]) rescue nil
    if book.present?
      book.name = params[:name]
      if book.destroy
        render json: { status: 200, id: book.id }
      else
        render json: { status: 400, error: book.error.as_json }, status: 400
      end
    else
      render json: { status: 404, error: "Not Found" }, status: 404
    end
  end
end
