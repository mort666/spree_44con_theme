Deface::Override.new(:virtual_path => %q{spree/shared/_login},
                     :name => %q{add_classes_to_login_form},
                     :disabled => false,
                     :replace => %q{code[erb-loud]:contains('form_for')},
                     :text => '<%= form_for :user, :url => spree.user_session_path, :html => {:class => "form-inline"} do |f| %>',
                     :original => "<%= form_for :user, :url => spree.user_session_path do |f| %>")