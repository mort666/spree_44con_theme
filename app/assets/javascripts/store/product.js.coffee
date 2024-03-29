add_image_handlers = ->
  ($ '#main-image').data 'selectedThumb', ($ '#main-image img').attr('src')
  ($ 'ul.thumbnails li.tmb-all').eq(0).addClass 'selected'
  ($ 'ul.thumbnails li.tmb-all a').on 'click', (event) ->
    ($ '#main-image').data 'selectedThumb', ($ event.currentTarget).attr('href')
    ($ '#main-image').data 'selectedThumbId', ($ event.currentTarget).parent().attr('id')
    ($ this).mouseout ->
      ($ 'ul.thumbnails li.tmb-all').removeClass 'selected'
      ($ event.currentTarget).parent('li.tmb-all').addClass 'selected'
    false

  ($ 'ul.thumbnails li.tmb-all').on 'mouseenter', (event) ->
    ($ '#main-image img').attr 'src', ($ event.currentTarget).find('a').attr('href')

  ($ 'ul.thumbnails li.tmb-all').on 'mouseleave', (event) ->
    ($ '#main-image img').attr 'src', ($ '#main-image').data('selectedThumb')

show_variant_images = (variant_id) ->
  ($ 'li.vtmb').hide()
  ($ 'li.vtmb-' + variant_id).show()
  currentThumb = ($ '#' + ($ '#main-image').data('selectedThumbId'))
  if not currentThumb.hasClass('vtmb-' + variant_id) and not currentThumb.hasClass('tmb-all')
    thumb = ($ ($ 'ul.thumbnails li:visible').eq(0))
    newImg = thumb.find('a').attr('href')
    ($ 'ul.thumbnails li.tmb-all').removeClass 'selected'
    thumb.addClass 'selected'
    ($ '#main-image img').attr 'src', newImg
    ($ '#main-image').data 'selectedThumb', newImg
    ($ '#main-image').data 'selectedThumbId', thumb.attr('id')

update_variant_price = (variant) ->
  variant_price = variant.data('price')
  ($ '.price.selling').text(variant_price) if variant_price

$ ->
  add_image_handlers()
  show_variant_images ($ '#product-variants input[type="radio"]').eq(0).attr('value') if ($ '#product-variants input[type="radio"]').length > 0
  ($ '#product-variants input[type="radio"]').click (event) ->
    show_variant_images @value
    update_variant_price ($ this)