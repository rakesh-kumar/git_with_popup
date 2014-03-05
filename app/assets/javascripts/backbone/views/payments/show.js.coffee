App.Views.Payment.Show = Backbone.View.extend
  tagName: 'dd'
  className: 'item-payment'

  events:
    "click .destroy" : 'destroy'
    "click .edit-custom-payment" : 'edit'
    "click .cancel" : 'cancel'
    "submit form#custom-payment" : 'save'

  initialize: ->
    self = this
    this.render()
    @model.bind 'remove', (model) ->
      self.remove()

  render: ->
    attrs = @model.attributes
    template = Handlebars.compile $('#show-custom-payment-item').html()
    $(@el).html template attrs
    $('#manual_payment_gateways').before @el

  destroy: ->
    if confirm 'Are you sure you want to delete it'
      self = this
      this.model.destroy
        success: (model, response) ->
          self.remove()
          msg 'Deleted successfully!'
    false

  edit: ->
    attrs = _.clone @model.attributes
    this.$("#account_manual_payment_gateway_#{this.model.id}").show()
    this.$("#activate_manual_payment_gateway_#{this.model.id}").hide()
    this.$("input[name='payment[name]']").val attrs.name
    this.$("textarea[name='payment[message]']").val attrs.message
    false

  cancel: ->
    this.$("#account_manual_payment_gateway_#{this.model.id}").hide()
    this.$("#activate_manual_payment_gateway_#{this.model.id}").show()
    false

  save: ->
    this.$('.submit').attr('disabled', true).val '正在保存...'
    self = this
    if true
      attrs =_.reduce this.$('form').serializeArray(), (result,obj) ->
        name = obj.name.replace(/payment\[|\]/g,"")
        result[name] = obj.value
        result
      ,{}
      @model.save {
          name: attrs.name
          message: attrs.message
        },
        success: (model, resp) ->
          msg 'Successfully modified!'
          $("#account_manual_payment_gateway_#{model.id}").hide()
          $("#activate_manual_payment_gateway_#{model.id}").show()
          $('.submit').attr('disabled', false).val '保存'
          false
        error: (model,error)  ->
          error_msg error
          $('.submit').attr('disabled', false).val '保存'
