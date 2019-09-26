Spree::Order.class_eval do

    def deliver_order_confirmation_email
      #OrderMailer.confirm_email(id).deliver_later  # we replace OrderMailer with DelayedSend
    end

    private
    def send_cancel_email
      Spree::OrderMailer.cancel_email(id).deliver_later
    end

end