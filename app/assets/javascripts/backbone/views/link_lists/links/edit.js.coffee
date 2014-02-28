App.Views.LinkList.Links.Edit = Backbone.View.extend
  tagName: 'li'
  className: 'link link-edit'

  events:
    "click .delete": "destroy"
    "change .selector": "select" # 选择链接类型

  initialize: ->
    @render()
    @options.parent.append @el
    @$('.selector').val(@model.get('link_type')).change()
    @$('.subject').val @model.get('subject_handle')

  render: ->
    template = Handlebars.compile $('#edit-link-item').html()
    attrs = _.clone @model.attributes
    $(@el).html template attrs
    index = _.indexOf @model.collection.models, @model
    cycle = if index % 2 == 0 then 'odd' else 'even'
    $(@el).addClass cycle

  destroy: ->
    if confirm 'Are you sure you want to delete it?'
      self = this
      collection = @model.collection
      this.model.destroy
        success: (model, response) ->
          collection.remove self.model
          self.remove()
          msg 'Deleted successfully!'
    false

  select: ->
    toggle_subject_handle = toggle_subject_params = toggle_subject_http = false
    switch @$('.selector').val()
      when 'blog', 'page', 'product'
        @$('select.subject').html($("#selector-#{@$('.selector').val()}-item").html())
        toggle_subject_handle = true
      when 'collection'
        @$('select.subject').html($('#selector-collection-item').html())
        toggle_subject_handle = toggle_subject_params = true
      when 'http'
        toggle_subject_http = true
    @$('select.subject').toggle(toggle_subject_handle)
    @$('input.subject_params').toggle(toggle_subject_params)
    @$('input.subject_http').toggle(toggle_subject_http)
