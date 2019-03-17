Spree::ShipmentHandler.class_eval do

    private
    def send_shipped_email
      #ShipmentMailer.shipped_email(id).deliver_later
    end

end