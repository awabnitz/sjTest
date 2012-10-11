ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    div :class => "blank_slate_container", :id => "dashboard_default_message" do

    end

    # Here is an example of a simple dashboard with columns and panels.
    #
     columns do
       column do
         panel "Recent Posts" do
           ul do
             Post.last(10).sort_by{|t| - t.created_at.to_i}.map do |post|
               li link_to(post.title, admin_post_path(post))

             end
           end
         end

       end
       column do
         panel "Authors" do
           ul do
             Author.last(20).sort_by{|t| - t.created_at.to_i}.map do |author|
               li  link_to(author.name, admin_author_path(author))

             end
           end
         end

       end

     end
  end # content
end


ActiveAdmin.register Post do
  controller do

  end
end