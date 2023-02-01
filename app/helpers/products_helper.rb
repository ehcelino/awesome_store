module ProductsHelper

  def return_img(product_description)
    content = rich_text(product_description)
    img_tags = content.scan(/<img.*?src=["'](.*?)["'].*?>/)
    if !img_tags[0].nil?
      Rails.logger.debug("img #{img_tags[0][0]}")
      image_url = img_tags[0][0]
      image_tag(image_url, class: "resize")
    end
  end

  def rich_text(rich_text_object)
    rich_text_object.to_s
  end

end