App.Views.Customer.Index.Index = Backbone.View.extend
  el: '#main'

  events:
    "change .selector": 'changeCustomerCheckbox'
    "change #customer-select": 'changeCustomerSelect'
    "change #select-all": 'selectAll'

  initialize: ->
    self = this
    _.bindAll this, 'render'
    new App.Views.Customer.Index.Search collection: @collection
    this.render()
    @collection.bind 'refresh', -> self.render()
    $(document).click -> $('.display_message').fadeOut('slow') # Customers tip pops up

  render: ->
    $('#customer-search_msg').html("找到 #{@collection.total_count}位 顾客").css('background-image', 'none')
    $('#customer-table_list').html('')
    _(@collection.models).each (model) -> new App.Views.Customer.Index.Show model: model


  # Select the check boxes of goods operation
  selectAll: ->
    this.$('.selector').attr 'checked', (@$('#select-all').attr('checked') is 'checked')
    this.changeCustomerCheckbox()

  # Commodity box operation
  changeCustomerCheckbox: ->
    checked = @$('.selector:checked') is 'checked'
    all_checked = (checked.size() == this.$('.selector').size())
    $('#select-all').attr 'checked', all_checked
    if checked[0]
      this.$('#customer-count').text "已选中 #{checked.size()} 个顾客"
      $('#customer-table_status').show()
    else
      $('#customer-table_status').hide()

  # Modify the control panel
  changeCustomerSelect: ->
    operation = this.$('#customer-select').val()
    checked_ids = _.map this.$('.selector:checked'), (checkbox) -> checkbox.value
    $.post "/admin/customers/set", operation: operation, 'customers[]': checked_ids, ->
      document.location.href = document.location.href
    false
