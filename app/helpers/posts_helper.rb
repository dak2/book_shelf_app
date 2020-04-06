module PostsHelper
  def post_infos(books)
    content_tag :div, id: "post", data: { title: books.map(&:first), id: books.map(&:last) }.to_json do end
  end
end
