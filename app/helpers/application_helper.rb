module ApplicationHelper
  MENU_ITEMS = {"admin"=> [{:title => "Users", :url => {:controller => :users}},
                           {:title => "Projects", :url => {:controller => :projects}},
                           {:title => "Logout", :url => {:controller => :login, :action => :logout}}],
                "developer" => [{:title => "Logout", :url => {:controller => :login, :action => :logout}}],
                "customer" => [{:title => "Logout", :url => {:controller => :login, :action => :logout}}] }
  def main_navigation
    items = MENU_ITEMS[session[:user][:role]]
    lis = items.collect do |item|
      content_tag(:li, :class => '') do
        link_to item[:title], item[:url]
      end
    end
    content_tag(:nav, content_tag(:ol, lis, {:class => "inner"}, false), :id => 'navigation')
  end
end