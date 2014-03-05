App.Views.Shipping.PriceBasedShippingRates.Show = Backbone.View.extend
  tagName: 'tr'

  events:
    "click .del": "destroy"

  initialize: ->
    @render()

  render: ->
    self = this
    template = Handlebars.compile $('#promotional-rate-item').html()
    attrs = _.clone @model.attributes
    attrs['max_order_subtotal'] = if @model.get('max_order_subtotal') then "- #{@model.get('max_order_subtotal')}" else "Start"
    $(@el).html template attrs
    $(@collection.view.el).append @el

  destroy: ->
    if confirm 'Are you sure you want to delete it'
      self = this
      @model.destroy
        success: (model, response) ->
          self.collection.remove self.model
          self.remove()
          msg 'Deleted successfully!'
    false
