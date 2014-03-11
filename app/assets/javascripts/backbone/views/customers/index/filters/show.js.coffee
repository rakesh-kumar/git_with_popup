App.Views.Customer.Index.Filter.Show = Backbone.View.extend
  className: 'filter-tag'

  events:
    "click .close-filter-tag": 'destroy' # Delete the primary filter

  initialize: ->
    self = this
    _.bindAll this, 'render'
    this.render()

  # Remove Filter
  destroy: ->
    @model.collection.remove @model
    this.remove()
    false

  render: ->
    template = Handlebars.compile $('#customer-search_filters-item').html()
    $(@el).html template @model.attributes
    $('#customer-search_filters').append @el
