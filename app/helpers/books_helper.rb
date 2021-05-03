module BooksHelper

  def availability(book)
    if book.almaty_out_of_stock? && book.shymkent_out_of_stock?
      return content_tag :span, 'не в наличии', class: 'out-of-stock'
    end

    if !book.almaty_out_of_stock? && !book.shymkent_out_of_stock?
      return content_tag :span, 'в наличии (Алматы и Шымкент)', class: 'in-stock'
    end

    if book.almaty_out_of_stock? && !book.shymkent_out_of_stock?
      return content_tag :span, 'в наличии (Шымкент)', class: 'in-stock'
    end

    if !book.almaty_out_of_stock? && book.shymkent_out_of_stock?
      return content_tag :span, 'в наличии (Алматы)', class: 'in-stock'
    end

    content_tag :span, ''
  end

  def cover(book)
    image_tag book.image_src, 
      alt: "Обложка книги #{book.name}",
      class: 'absolute inset-0 w-full h-full object-cover rounded-lg'
  end

end
