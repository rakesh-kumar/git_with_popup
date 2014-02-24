# encoding: utf-8
ActiveAdmin.register ShopDomain do

  index do
    column :id
    column :host
    column :record
    column :verified
    default_actions
  end

   form do |f| # 编辑页面
     f.inputs "Basic Information" do
       f.input :host
       f.input :record
       f.input :verified
     end
     f.buttons
   end

end
