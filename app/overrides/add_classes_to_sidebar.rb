Deface::Override.new(:virtual_path => %q{spree/shared/_filters},
                     :name => %q{add_classes_to_sidebar},
                     :disabled => false,
                     :add_to_attributes => %q{ul},
                     :attributes =>{:class =>'unstyled'})
                     
Deface::Override.new(:virtual_path => %q{spree/shared/_filters},
                     :name => %q{add_classes_to_sidebar_form},
                     :disabled => false,
                     :replace => %q{code[erb-loud]:contains('form_tag')},
                     :text => "<%= form_tag '', :method => :get, :id => 'sidebar_products_search', :html => {:class => 'form-inline'} do %>",
                     :original => "<%= form_tag '', :method => :get, :id => 'sidebar_products_search' do %>")
