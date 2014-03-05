App.Views.Comment.Show = Backbone.View.extend
  tagName: 'tr'

  events:
    "change .selector": 'select'
    "click .destroy" : 'destroy'
    "click .spam"    : 'spam'
    "click .approve" : 'approve'

  initialize: ->
    self = this
    this.render()

    @model.bind 'remove', (model) ->
      self.remove()
    @model.bind 'change:status', (model) ->
      attrs = model.attributes
      attrs['is_spam'] = attrs['is_published'] = attrs['is_unapproved'] = false
      switch attrs['status']
        when 'spam' then attrs['is_spam'] = true
        when 'published' then attrs['is_published'] = true
        when 'unapproved' then attrs['is_unapproved'] = true
      template = Handlebars.compile $('#show-comment-handle').html()
      self.$('.comment-actions').html template attrs

  render: ->
    attrs = @model.attributes
    switch attrs['status']
      when 'spam' then attrs['is_spam'] = true
      when 'published' then attrs['is_published'] = true
      when 'unapproved' then attrs['is_unapproved'] = true
    template = Handlebars.compile $('#show-comment-item').html()
    $(@el).html template attrs
    position = _.indexOf @model.collection.models, @model
    cycle = if position % 2 == 0 then 'odd' else 'even'
    $(@el).addClass "row #{cycle}"
    if $('.more-comments').size() > 0
      $('.more-comments').before @el
    else
      $('#comments-list > tbody').append @el

  select: ->
    $(@el).toggleClass 'active', (@$('.selector').attr('checked') is 'checked')

  destroy: ->
    if confirm 'Are you sure you want to delete it'
      self = this
      this.model.destroy
        success: (model, response) ->
          self.remove()
          msg 'Deleted successfully!'
    false

  spam: ->
    self = this
    this.model.save {status: 'spam'},

  approve: ->
    self = this
    this.model.save {status: 'published'},
