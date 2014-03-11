App.Views.Asset.Index.Panel = Backbone.View.extend
  el: '#current-asset'

  events:
    "click #open-button": 'open'
    "click #save-button": 'save'
    "click #asset-link-rollback a": 'versions'
    "click #asset-rollback-form a": 'cancelRollback'
    "change #asset-rollback-form select": 'updateAsset'
    "click #asset-link-rename a": 'showRename'
    "click #asset-rename-form a.update": 'rename'
    "click #asset-rename-form a.cancel": 'cancelRename'
    "click #asset-link-destroy a": 'destroy'

  initialize: ->
    self = this
    this.render()

  render: ->

  open: ->
    window.open("/admin/themes/#{theme_id}/assets/0/edit", "_blank", "menubar=no,location=no,resizable=yes,scrollbars=yes,status=no,width=900,height=700")

  save: ->
    model = TemplateEditor.current
    value = TemplateEditor.editor.getSession().getValue()
    $('#asset-info').html("Saving #{model.get('name')} &hellip;").show()
    $.post "/admin/themes/#{theme_id}/assets/0", key: model.get('key'), value: value, _method: 'put', ->
      $('#asset-info').html("Your file has been saved.").fadeOut(5000)
      model.view.setModified false

  versions: ->
    model = TemplateEditor.current
    $.get "/admin/themes/#{theme_id}/assets/0/versions", key: model.get('key'), (data) ->
      template = Handlebars.compile $('#rollback-selectbox-item').html()
      $('#asset-link-rollback').replaceWith template commits: data
    false

  updateAsset: ->
    model = TemplateEditor.current
    tree_id = $('#asset-rollback-form select').children('option:selected').attr('tree_id')
    $.get "/admin/themes/#{theme_id}/assets/#{tree_id}", key: model.get('key'), (data) ->
      editor = TemplateEditor.editor
      editor.getSession().setValue data
      editor.moveCursorTo(0,0)
    false

  showRename: -> # Show Rename Form
    model = TemplateEditor.current
    $('#asset-link-rename').replaceWith $('#asset-rename-form-item').html()
    $('#asset-basename-field').val(model.get('name')).focus()
    false

  rename: -> # Renaming
    self = this
    model = TemplateEditor.current
    basename = $('#asset-basename-field').val()
    new_key = model.get('key').replace model.get('name'), basename
    attrs = key: model.get('key'), new_key: new_key, _method: 'put'
    $.post "/admin/themes/#{theme_id}/assets/0/rename", attrs, ->
      model.set key: new_key, name: basename
      self.cancelRename()
    false

  cancelRename: ->
    $('#asset-rename-form').replaceWith $('#asset-link-rename-item').html()
    false

  destroy: ->
    self = this
    model = TemplateEditor.current
    if confirm("Are you sure you want to delete#{model.get('name')}吗?")
      attrs = key: model.get('key'), _method: 'delete'
      $.post "/admin/themes/#{theme_id}/assets/0", attrs, (data) ->
        $('#asset-buttons, #asset-info').hide()
        $('#asset-title').text('Do not select the file')
        $('#asset-links').css('visibility', 'hidden').html ''
        $('#asset-hint, #asset-hint-noselect').show()
        $('#asset-hint-liquid').hide()
        $('#template-editor').hide()
        $('#preview-image').hide()
        msg "#{model.get('key')} Has been deleted"
        model.view.remove()
        TemplateEditor.current = null
    false

  cancelRollback: ->
    $('#asset-rollback-form').replaceWith $('#asset-link-rollback-item').html()
    false
