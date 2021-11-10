if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: '_body_parts_tracker', domain: 'fred-body-track-app-backend.herokuapp.com', :same_site => :none, :secure => :true, tld_length: 3
else
  Rails.application.config.session_store :cookie_store, key: 'body_parts_tracker'
end



