# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
#

post 'as-issues/change', :to => 'ai_setup#change'
get 'as-issues', :to => 'ai_setup#index'
post 'as-issues/:id/delete', :to => 'ai_setup#delete'