Spree::OrderMailer.class_eval do
  def confirm_email(order_id, resend = false)

    #email_id = 12803349359

    order = Spree::Order.find(order_id)

    contact_properties = []

    domain = 'http://' + order.store.url + '/'

    lineitems_properties =[]
    #for each product
    #line_items
    order.line_items.each do |line_item|
      product_image = line_item.variant.images.length>0 ? line_item.variant.images.first.attachment.url(:original) : 'https://www.naturalwellbeing.com/assets/noimage/product.jpg'
      lineitems_properties <<{
          :product_name => line_item.variant.product.name,
          :image_url => product_image,
          :sku => line_item.variant.sku,
          :quantity => line_item.quantity,
          :product_url => domain + 'products/' + line_item.variant.product.slug,
          :price => sprintf("%0.2f",line_item.price.to_s)
      }
    end

    shipping_cost = 0
    order.shipments.each do |shipment|
      shipping_cost += shipment.discounted_cost
    end

    adjustment_total = 0
    if order.line_item_adjustments.promotion.eligible.count > 0
      order.line_item_adjustments.promotion.eligible.each do |line_item_adjustment|
        adjustment_total += line_item_adjustment.amount
      end
    end
    if order.adjustments.eligible.count > 0
      order.adjustments.eligible.each do |order_adjustment|
        adjustment_total += order_adjustment.amount
      end
    end


    custom_properties = [
     { name: "order_number", value: order.number },
     { name: "contact_email", value: order.email },
     { name: "contact_firstname", value: order.bill_address.first_name },
     { name: "contact_lastname", value: order.bill_address.last_name },
     { name: "contact_store", value: order.store.code },

     { name: "billing_address1", value: order.bill_address.address1 },
     { name: "billing_address2", value: order.bill_address.address2 },
     { name: "billing_city", value: order.bill_address.city },
     if order.bill_address.state_id.blank?
        { name: "billing_state", value: order.bill_address.state_name }
     else
       { name: "billing_state", value: order.bill_address.state.abbr }
     end,
     { name: "billing_country", value: order.bill_address.country.name },
     { name: "billing_zip", value: order.bill_address.zipcode },

     { name: "shipping_first_name", value: order.ship_address.first_name },
     { name: "shipping_last_name", value: order.ship_address.last_name },

     { name: "shipping_address1", value: order.ship_address.address1 },
     { name: "shipping_address2", value: order.ship_address.address2 },
     { name: "shipping_city", value: order.ship_address.city },
     if order.ship_address.state_id.blank?
       { name: "shipping_state", value: order.ship_address.state_name }
     else
       { name: "shipping_state", value: order.ship_address.state.abbr }
     end,
     { name: "shipping_country", value: order.ship_address.country.name },
     { name: "shipping_zip", value: order.ship_address.zipcode },

     { name: "line_item", value: lineitems_properties },

    #order level
     { name: "discount", value: sprintf("%0.2f",adjustment_total.to_s)},
     { name: "taxes", value: sprintf("%0.2f",order.all_adjustments.tax.eligible.sum(:amount).to_s) },
     { name: "shipping", value: sprintf("%0.2f",shipping_cost.to_s) },
     { name: "total", value: sprintf("%0.2f",order.total.to_s) },

    #marketing placeholders
    { name: "store_url", value: "" },
    { name: "store_currency_symbol", value: ""},
    { name: "store_email", value: "" },
    { name: "store_free_shipping", value: "" },
    { name: "store_phone_number", value: "" },
    { name: "store_address", value: "" }

    ]

    notify_customer("order_confirmation_email_id",order.store.code, order.email,contact_properties, custom_properties)

  end

  def cancel_email(order_id, resend = false)
    #email_id = 12802493185

    order = Spree::Order.find(order_id)

    contact_properties = []

    domain = 'http://' + order.store.url + '/'

    lineitems_properties =[]
    #for each product
    #line_items
    order.line_items.each do |line_item|
      product_image = line_item.variant.images.length>0 ? line_item.variant.images.first.attachment.url(:original) : 'https://www.naturalwellbeing.com/assets/noimage/product.jpg'
      lineitems_properties <<{
          :product_name => line_item.variant.product.name,
          :image_url => product_image,
          :sku => line_item.variant.sku,
          :quantity => line_item.quantity,
          :product_url => domain + 'products/' + line_item.variant.product.slug,
          :price => sprintf("%0.2f",line_item.price.to_s)
      }
    end

    shipping_cost = 0
    order.shipments.each do |shipment|
      shipping_cost += shipment.discounted_cost
    end

    adjustment_total = 0
    if order.line_item_adjustments.promotion.eligible.count > 0
      order.line_item_adjustments.promotion.eligible.each do |line_item_adjustment|
        adjustment_total += line_item_adjustment.amount
      end
    end
    if order.adjustments.eligible.count > 0
      order.adjustments.eligible.each do |order_adjustment|
        adjustment_total += order_adjustment.amount
      end
    end


    custom_properties = [
        { name: "order_number", value: order.number },
        { name: "contact_email", value: order.email },
        { name: "contact_firstname", value: order.bill_address.first_name },
        { name: "contact_lastname", value: order.bill_address.last_name },
        { name: "contact_store", value: order.store.code },

        { name: "billing_address1", value: order.bill_address.address1 },
        { name: "billing_address2", value: order.bill_address.address2 },
        { name: "billing_city", value: order.bill_address.city },
        if order.bill_address.state_id.blank?
          { name: "billing_state", value: order.bill_address.state_name }
        else
          { name: "billing_state", value: order.bill_address.state.abbr }
        end,
        { name: "billing_country", value: order.bill_address.country.name },
        { name: "billing_zip", value: order.bill_address.zipcode },

        { name: "shipping_first_name", value: order.ship_address.first_name },
        { name: "shipping_last_name", value: order.ship_address.last_name },

        { name: "shipping_address1", value: order.ship_address.address1 },
        { name: "shipping_address2", value: order.ship_address.address2 },
        { name: "shipping_city", value: order.ship_address.city },
        if order.ship_address.state_id.blank?
          { name: "shipping_state", value: order.ship_address.state_name }
        else
          { name: "shipping_state", value: order.ship_address.state.abbr }
        end,
        { name: "shipping_country", value: order.ship_address.country.name },
        { name: "shipping_zip", value: order.ship_address.zipcode },

        { name: "line_item", value: lineitems_properties },

        #order level
        { name: "discount", value: sprintf("%0.2f",adjustment_total.to_s) },
        { name: "taxes", value: sprintf("%0.2f",order.all_adjustments.tax.eligible.sum(:amount).to_s) },
        { name: "shipping", value: sprintf("%0.2f",shipping_cost.to_s)  },
        { name: "total", value: sprintf("%0.2f",order.total.to_s)  },

        #marketing placeholders
        { name: "store_url", value: "" },
        { name: "store_currency_symbol", value: ""},
        { name: "store_email", value: "" },
        { name: "store_free_shipping", value: "" },
        { name: "store_phone_number", value: "" },
        { name: "store_address", value: "" }

    ]

    notify_customer("order_canceled_email_id",order.store.code, order.email,contact_properties, custom_properties)

  end

  def out_of_stock_email(order_id, out_of_stock_products)
    #email_id = 12802493157

    order = Spree::Order.find(order_id)

    contact_properties = []


    custom_properties = [
        { name: "order_number", value: order.number },
        { name: "contact_email", value: order.email },
        { name: "contact_firstname", value: order.bill_address.first_name },
        { name: "contact_lastname", value: order.bill_address.last_name },
        { name: "contact_store", value: order.store.code },

        { name: "line_item", value: out_of_stock_products },

        #marketing placeholders
        { name: "store_url", value: "" },
        { name: "store_currency_symbol", value: ""},
        { name: "store_email", value: "" },
        { name: "store_free_shipping", value: "" },
        { name: "store_phone_number", value: "" },
        { name: "store_address", value: "" }
    ]

    notify_customer("out_of_stock_email_id",order.store.code, order.email,contact_properties, custom_properties)

  end

  private

    def from_address
      "no-reply@example.com"
    end

    def from_store
      @store ||= Spree::Store.current
    end

end


