module PostsHelper
  def post_form_data(books)
    content_tag :div, id: "post-form", data: { books: books.map{ |book| { id: book.last, title: book.first } } }.to_json do end
  end
end
