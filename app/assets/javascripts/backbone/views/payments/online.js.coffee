App.Views.Payment.Online = Backbone.View.extend # 在线支付

  events:
    'change .gateway-id'  : 'select'
    'click .payment_edit' : 'edit'     # 编辑
    'submit form'         : 'save'     # 保存
    "click .cancel"       : "cancel"   # 取消
    "click .destroy"      : "destroy"  # 删除

  initialize: ->
    @render()

  render: ->
    configed = @model.get('id')?
    @$('.activate_payment_provider strong').html "Paypal#{@model.get('service_name')}Service"
    @$('.payment_select').toggle !configed
    @$('.activate_payment_provider').toggle configed
    @$('.account_payment_provider').hide()

  select: -> # 显示表单
    selected = @$('.gateway-id').val() is '1'
    @edit() if selected
    @$('.account_payment_provider').toggle(selected)

  edit: -> # 编辑
    self = this
    template = Handlebars.compile @$('script').html()
    @$('.payment-gateway-form').html template @model.attributes
    @$('.account_payment_provider form select').each -> $(this).val self.model.get($(this).attr('name')) # 显示下拉框
    @$('.account_payment_provider').show()
    @$('.activate_payment_provider').hide()
    false

  save: ->
    self = this
    @model.save {
        account: self.$("input[name='account']").val(),
        key: self.$("input[name='key']").val(),
        service: self.$("select[name='service']").val(),
        email: self.$("input[name='email']").val(), # 支付宝才有
        payment_type_id: self.$("input[name='payment_type_id']").val()
      },
      success: (model, resp) ->
        msg 'Successfully modified!'
        self.render()
    false

  cancel: ->
    @$('.account_payment_provider').hide()
    if @model.get('id')? # 编辑时
      @$('.activate_payment_provider').show()
      @$('.payment_select').hide()
    else # 新增时
      @$('.gateway-id').val 0
    false

  destroy: ->
    self = this
    if confirm 'Are you sure you want to delete it'
      @model.destroy
        success: (model, response) ->
          self.$('.payment_select').show()
          self.$('.account_payment_provider').hide()
          self.$('.activate_payment_provider').hide()
          msg 'Deleted successfully!'
          model.clear()
          model.id = null
    return false
