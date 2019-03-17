Spree::Core::Engine.routes.draw do
  # Add your extension routes here
  #   post "/subscribenewsletter", :to => 'home#subscribenewsletter'
  post "/subscribenewsletters", :to => 'home#subscribenewsletters'
  post "/subscribecampaign", :to => 'home#subscribecampaign'
  post "/subscribecampaign_with_ops", :to => 'home#subscribecampaign_with_ops'

  post "/subscribekeyword", :to => 'home#subscribekeyword'
end
