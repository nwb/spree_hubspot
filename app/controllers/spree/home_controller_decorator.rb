Spree::HomeController.class_eval do

  def subscribenewsletter

    #redirect_to "/meetexperts"
    #render :js =>'alert("Our server temperarily busy, please try again later.")'
    render body: nil
  end

  #accept list lists to signup
  def subscribenewsletters

    #render :js =>'alert("Our server temperarily busy, please try again later.")'
    render body: nil
  end

  # sign up compaign flexible form, like the one for newsletter.
  def subscribecampaign
    render body: nil

  end

  # sign up sms keyworkd to get transaction email or marketing email claimed by the keyword.
  def subscribekeyword
    render body: nil
  end

  # sign up compaign flexible form, like the one for newsletter.
  def subscribecampaign_with_ops
    render body: nil
  end

end