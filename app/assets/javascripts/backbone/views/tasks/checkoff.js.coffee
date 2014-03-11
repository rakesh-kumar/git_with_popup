App.Views.Task.Checkoff = Backbone.View.extend
  el: '#task-checkoff'

  events:
    "click #complete-task-button": "complete" # 完成任务
    "click #skip-task-button": "skip" # 选择其他任务

  initialize: ->
    this.render()

  render: ->
    name = @model.get('name')
    incomplete_tasks = @collection.select (model) -> !model.get('completed')
    template = Handlebars.compile $("#checkoff-item").html()
    $(@el).html template name: this.step_name(), incomplete_task_count: (incomplete_tasks.length - 1) # 除去launch任务
    template = Handlebars.compile $("##{name}-desc-item").html()
    this.$('.desc').html template

  complete: ->
    self = this
    $('#complete-task-button').addClass 'task-checked'
    next_task = @collection.get(@model.id + 1)
    $.post "/admin/dashboard/complete_task/#{@model.get('name')}", ->
      if next_task.get('name') is 'launch'
        window.location = '/admin' # 下一步为"启用商店"，则转至首页，显示详细信息
      else
        self.model.set completed: true
        $(self.el).fadeOut 500, ->
          $('#progress-bar').fadeIn 500, ->
            $.guide $("##{next_task.get('name')}"), self.next_step_message(next_task), 'top'
    false

  skip: ->
    self = this
    $(@el).fadeOut 500, -> $('#progress-bar').fadeIn 500
    link = $(@model.view.el).find('a')
    unless link.data('reverted') # 避免多次绑定click事件
      link.data('reverted', true)
      link.click -> # 再次点击当前任务时重新显示checkoff面板
        $('#progress-bar').fadeOut 500, -> $(self.el).fadeIn 500
        false
    false

  next_step_message: (task) ->
    message = "The next step is "
    name = task.get('name')
    desc = switch name
      when 'customize_theme'
        'Customize your theme settings'
      when 'add_content'
        'Modify your web content'
      when 'setup_payment_gateway'
        'Set your most commonly used payment gateway'
      when 'setup_shipping'
        'Set your shipping'
      when 'setup_domain'
        'Bind your domain'
      when 'launch'
        'Enable Store'
    "#{message} #{desc}"

  step_name: ->
    switch @model.get('name')
      when 'add_product'
        'Add a product'
      when 'customize_theme'
        'Appearance settings'
      when 'add_content'
        'Additions'
      when 'setup_payment_gateway'
        'Payment Gateway'
      when 'setup_shipping'
        'Freight'
      when 'setup_domain'
        'Domain name'
      when 'launch'
        'Enable Store'
