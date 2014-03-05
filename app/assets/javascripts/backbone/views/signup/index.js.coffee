App.Views.Signup.Index = Backbone.View.extend
  el: '#wrapper'

  events:
    "submit #shop_new": "save"
    "click #check_phone": "get_verify_code"

  initialize: ->
    self = this
    this.render()
    Utils.Region.init()
    $("#shop_name").focus()
    inputFields = $("input.input-text")
    setInterval ->
      inputFields.each -> $("label[for='#{@id}']").addClass "has-text"  unless @value is ""
    , 200
    $("input.input-text").each ->
      $(this).focus -> $("label[for='#{@id}']").addClass "focus"
      $(this).keypress -> $("label[for='#{@id}']").addClass("has-text").removeClass 'focus'
      $(this).blur -> $("label[for='#{@id}']").removeClass("has-text").removeClass('focus') if @value is ""
    last_domain = this.get_domain()
    template = Handlebars.compile $('#available-item').html()
    setInterval -> # 定时检测域名有效性
      domain = self.get_domain()
      subdomain = $('#domain_subdomain').val()
      if subdomain isnt ''
        if subdomain.length >= 4
          if domain isnt last_domain
            last_domain = domain
            $('#spinner').css('display', '') # show方法会导致移位
            $.get '/services/signup/check_availability', domain: domain, (data) ->
              attrs = available: (data is 'true'), domain: domain
              $('#spinner').hide()
              $('#domain-available').html template attrs
        else
          $('#domain-available').html "<span class='negative'>Subdomain requires a minimum of 4 characters<span>"
    , 2000

  render: ->
    self = this
    new App.Views.Signup.Theme.Index collection: App.themes

  save: ->
    $('#shop_submit').attr('disabled', true).val '正在创建您的商店...'
    self = this
    if this.validate()
      attrs = _.reduce $('form').serializeArray(), (result, obj) ->
        name = obj.name.replace('shop\[', 'user[shop_attributes][')
        name = name.replace('domain\[', 'user[shop_attributes][domains_attributes][][')
        result[name] = obj.value
        result
      , {}
      $.post '/services/signup/user', attrs, (data) ->
        if data.token
          window.location = "http://#{$('#domain_subdomain').val()}#{App.redirect_url}?login_token=#{data.token}"
        else # 有错误
          data = data.errors
          errors = {}
          errors['shop.domains.host'] = "Store Web address already exists" if data['shop.domains.host']?
          errors['email'] = "Email address is already registered" if data.email?
          errors['password'] = "Password and Confirm Password need to be consistent，Length can not be less than six characters" if data.password?
          errors['verify_code'] = "Mobile checksum is incorrect" if data.verify_code?
          errors['shop.address'] = "Address #{data['shop.address']}" if data['shop.address']?
          self.message errors
          self.reset()
    else # 校验不通过
      self.reset()
    false

  ###### private methods #####
  validate: ->
    check_list =
      shop_name: 'Please give your store a name'
      domain_subdomain: 'Please choose a Web address for your store'
    errors = {}
    _(check_list).each (msg, key) ->
      errors[key] = msg if $("##{key}").val() is ''
    if _.isEmpty errors
      empty_check_list = ['user_name', 'shop_province', 'shop_city', 'shop_district', 'shop_address', 'shop_zipcode', 'shop_phone', 'user_email', 'user_password', 'user_password_confirmation', 'user_phone']
      _(empty_check_list).each (key) ->
        if $("##{key}").val() is ''
          text = switch $("##{key}")[0].type
            when 'select-one'
              $("##{key}").children('option:first').text().substr(2,2)
            else #'text'
              $("label[for='#{key}']").text()
          errors[key] = "#{text} Can not be empty"
      if $('#shop_terms_and_conditions').attr('checked') isnt 'checked'
        errors['shop_terms_and_conditions'] = "Please read and accept the terms of service"
    this.message errors
    _.isEmpty errors

  message: (errors) -> # 显示错误提示
    result = _.isEmpty errors
    $('#errorExplanation p').remove()
    _(errors).each (msg, key) -> $('#errorExplanation').append "<p>#{msg}</p>"
    $('#errorExplanation').toggle(!result)
    Utils.Effect.scrollTo("#errorExplanation") unless result

  reset: ->
    $('#shop_submit').prop('disabled', false).val '创建我的ShopQi商店'

  get_domain: ->
    "#{$('#domain_subdomain').val()}#{$('#domain_domain').val()}"

  get_verify_code: ->
    phone = $('#user_phone').val()
    if this.is_mobile phone
      $('#check_phone').attr('disabled', true).val "正在发送，请稍候..."
      $('#user_phone_hint').hide()
      $.post '/services/signup/verify_code', phone: phone, ->
        i = 60
        timerId = setInterval ->
          if i is 0
            clearInterval timerId
            $('#check_phone').attr('disabled', false).val "获取验证码"
          else
            $('#check_phone').val "已发送,请检查短信(如未收到,#{i--}秒后可重新获取)"
        , 1000
    else
      $('#user_phone_hint').hide().fadeIn()

  is_mobile: (phone) ->
    patten= /^[1]([3][0-9]{1}|59|58|88|89)[0-9]{8}$/
    return false if !patten.exec(phone)
    true
