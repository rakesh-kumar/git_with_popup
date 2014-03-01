App.Views.Customer.Index.Filter.Index = Backbone.View.extend
  el: '#order-filters'

  events:
    "click #customer-search_field": 'showFilter' #Display filter
    "change #search-filter_primary": 'selectPrimary' # Select the main filter
    "click #search-filter_apply": 'addFilter' # Add Filter
    "click #search-filter_summary .remove": 'removeFilters' # Remove all filters

  initialize: ->
    self = this
    @collection = new App.Collections.CustomerGroupFilters @model.filters()
    @collection.bind 'all', (collection) -> self.update()
    this.render()
    $('#search-filter_primary').change()

  render: ->
    self = this
    this.showFilter() if @collection.length > 0
    $('#search-filter_summary .filter-message').text "Has#{@collection.length}Filters"
    $('#search-filter_summary').toggle(@collection.length > 0)
    margin_top = if @collection.length > 0 then '10' else '0'
    $('#customer-search_filters').html('').css('margin-top', "#{margin_top}px")
    @collection.each (model) -> new App.Views.Customer.Index.Filter.Show model: model

  update: ->
    @model.setQuery @collection
    this.render()

  showFilter: ->
    $('#customer-search_add_filters').show()

  # Select the main filter
  selectPrimary: ->
    clazz = $('#search-filter_primary').children(':selected').attr('clazz')
    filter_html = _(secondary_filters[clazz]).map (text, value) -> "<option value='#{value}'>#{text}</option>"
    $('#search-filter_secondary').html(filter_html.join(''))
    $('#search-filter_value').val('').toggle(clazz is 'integer') #Only numerical filter only requires additional input box

  # Add Filter
  addFilter: ->
    primary = $('#search-filter_primary').children(':selected')
    secondary = $('#search-filter_secondary').children(':selected')
    text = $('#search-filter_value').val()
    is_integer = primary.attr('clazz') is 'integer'
    return false if is_integer and !text
    if is_integer
      [condition, value] = ["#{primary.val()}_#{secondary.val()}", text]
      [condition_name, value_name] = ["#{primary.text()} #{secondary.text()}", text]
    else
      [condition, value] = [primary.val(), secondary.val()]
      [condition_name, value_name] = [primary.text(), secondary.text()]
    new_filter = condition: condition, value: value, condition_name: condition_name, value_name: value_name
    exist_filter = @collection.find (model) -> model.get('condition') is new_filter.condition
    if exist_filter # Avoid duplication
      exist_filter.set value: new_filter.value, value_name: new_filter.value_name
    else
      @collection.add new_filter

  # Remove all filters
  removeFilters: (e) ->
    @collection.refresh []
    false
