# encoding: utf-8
module KeyValues

  class Base < ActiveHash::Base
    def self.options
      all.map {|t| [t.name, t.code]}
    end

    # {code1: name1, code2: name2}
    def self.hash
      Hash[*(all.map{|t| [t.code, t.name]}.flatten)]
    end

    def self.find_by_code(code)
      super(code.to_s)
    end
  end

  class CancelReason < KeyValues::Base
    self.data = [
      {id: 1, name: 'Difficult to use'    , code: 'difficulty_to_use' },
      {id: 2, name: 'Other features needed', code: 'need_new_feature'  },
      {id: 3, name: 'Help is not detailed'  , code: 'cant_find_help'    },
      {id: 4, name: 'Too expensive'    , code: 'plan_are_expensive'},
      {id: 5, name: 'Other'        , code: 'difficulty_to_use' },
    ]
  end

  class Resource < KeyValues::Base
    include ActiveHash::Associations
    belongs_to :resource_type , class_name: 'KeyValues::ResourceType'
    self.data = [
      {id: 1 , name: 'Home'        , code: 'home'              ,resource_type_id: 1},
      {id: 2 , name: 'Customer'        , code: 'customers'         ,resource_type_id: 1},
      {id: 3 , name: 'Orders'        , code: 'orders'            ,resource_type_id: 1},
      {id: 4 , name: 'Promotions'        , code: 'marketing'         ,resource_type_id: 1},
      {id: 5 , name: 'Commodity&Collections'   , code: 'products'          ,resource_type_id: 2},
      {id: 6 , name: 'Exterior'        , code: 'themes'            ,resource_type_id: 2},
      {id: 7 , name: 'Blog & page'   , code: 'pages'             ,resource_type_id: 2},
      {id: 8 , name: 'Link List'    , code: 'link_lists'        ,resource_type_id: 2},
      {id: 9 , name: 'Application'        , code: 'applications'      ,resource_type_id: 3},
      {id: 10, name: 'Set up'        , code: 'preferences'       ,resource_type_id: 3},
    ]
  end

  class ResourceType < KeyValues::Base
    include ActiveHash::Associations
    has_many :resources , class_name: 'KeyValues::Resource'
    self.data = [
      {id: 1, name: 'Store management'},
      {id: 2, name: 'Store content'},
      {id: 3, name: 'Store settings'},
    ]
  end

  #支付类型
  class PaymentType < KeyValues::Base
    self.data = [
      {id: 1, name: 'Online Payment - Paypal', link: 'https://b.alipay.com/order/productSign.htm?action=newsign&productId=2011011904422299'},
      {id: 2, name: 'Online Payment - TenPay', link: 'http://union.tenpay.com/mch/mch_register.shtml'},
      {id: 3, name: 'Online Payment - quick money'  , link: 'http://www.99bill.com'}
    ]
  end

  #评论状态
  class CommentableType < KeyValues::Base
    self.data = [
      {id: 1, name: 'Disable Comments'              , code: 'no'},
      {id: 2, name: 'Allow Comments,Required audit'       , code: 'moderate'},
      {id: 3, name: 'Allow Comments，And automatically release', code: 'yes'},
    ]
  end

  class PolicyType < KeyValues::Base
    self.data = [
      {id: 1, name: 'Refund Policy'},
      {id: 2, name: 'Privacy Policy'},
      {id: 3, name: 'Terms of Service'}
    ]
  end

  # 是否发布
  class PublishState < KeyValues::Base
    self.data = [
      {id: 1, name: 'Public', code: 'true'},
      {id: 2, name: 'Hide', code: 'false'},
    ]
  end

  #评论状态
  class CommentState < KeyValues::Base
    self.data = [
      {id: 1, name: 'Garbage', code: 'spam'},
      {id: 2, name: 'Unreceived'  , code: 'unapproved'},
      {id: 3, name: 'Open'  , code: 'published'},
    ]
  end


  # 每页条数
  class PageSize < KeyValues::Base
    self.data = [
      {id: 1, name: '25' , code: '25' },
      {id: 2, name: '50' , code: '50' } ,
      {id: 3, name: '100', code: '100'},
      {id: 4, name: '250', code: '250'},
    ]
  end

  module Shop # 商店

    class SignupSource < KeyValues::Base # 注册来源
      self.data = [
        {id: 1, name: 'I am not sure'    , code: 'not_sure'    },
        {id: 2, name: 'Other companies introduced', code: 'from_company'},
        {id: 3, name: 'Friends'    , code: 'from_frient' },
        {id: 4, name: 'Blog'        , code: 'blog'        },
        {id: 5, name: 'Search Engine'    , code: 'search'      },
        {id: 6, name: 'Online Advertising'    , code: 'web_ad'      },
        {id: 7, name: 'Magazine ads'    , code: 'magazine_ad' },
        {id: 8, name: 'Books'        , code: 'book'        },
        {id: 9, name: 'Other'        , code: 'other'       },
      ]
    end

    class Currency < KeyValues::Base # 币种
      self.data = [
        {id: 1, name: 'Yuan (CNY)', code: 'CNY', html_unit: '&#165;{{amount}} 元' , html: '&#165;{{amount}}' , email_unit: '¥{{amount}} 元' , email: '¥{{amount}}' },
        {id: 2, name: 'Dollar (USD)'  , code: 'USD', html_unit: '${{amount}} USD'     , html: '${{amount}}'      , email_unit: '${{amount}} USD', email: '${{amount}}' } ,
        {id: 3, name: 'Euro (EUR)'  , code: 'EUR', html_unit: '&euro;{{amount}} EUR', html: '&euro;{{amount}}' , email_unit: '€{{amount}} EUR', email: '€{{amount}}' } ,
        {id: 4, name: 'Dollar (HKD)'  , code: 'HKD', html_unit: 'HK${{amount}}'       , html: '${{amount}}'      , email_unit: 'HK${{amount}}'  , email: '${{amount}}' } ,
      ]
    end

  end

  module Theme # 主题

    class Role < KeyValues::Base # 发布类型
      self.data = [
        {id: 1, name: 'General', code: 'main'  },
        {id: 2, name: 'Mobile', code: 'mobile'},
      ]
    end

  end

  module Payment

    class Custom < KeyValues::Base
        self.data = [
          {id: 1   ,name: 'Bank transfer' , code: 'bank_transfer'},
          {id: 2   ,name: 'Remittance' , code: 'pos'},
          {id: 3   ,name: 'Cash on delivery' , code: 'cod'}
        ]
    end

    module Alipay

      class Service < KeyValues::Base # 支付接口
        self.data = [
          {id: 1, name: 'Instant arrive'  , code: ActiveMerchant::Billing::Integrations::Alipay::Helper::CREATE_DIRECT_PAY_BY_USER     },
          {id: 2, name: 'Secured Transactions'  , code: ActiveMerchant::Billing::Integrations::Alipay::Helper::CREATE_PARTNER_TRADE_BY_BUYER },
          {id: 3, name: 'Dual function receivables', code: ActiveMerchant::Billing::Integrations::Alipay::Helper::TRADE_CREATE_BY_BUYER         }
        ]
      end

    end

    module Tenpay

      class Service < KeyValues::Base # 支付接口
        self.data = [
          {id: 1, name: 'Immediately arrived Trading'  , code: 'direct' },
          {id: 2, name: 'The price of secured transactions'  , code: 'protect'}
        ]
      end

    end

  end

  module Plan
    class Type < KeyValues::Base
      self.data = [
        {id: 1   ,name:'Ultimate'  , code: 'unlimited'    , skus: 1000 , storage: 1000, price: 9988 },
        {id: 2   ,name:'Enterprise Edition'  , code: 'business'     , skus: 500  , storage: 500 , price: 5988 },
        {id: 3   ,name:'Professional Edition'  , code: 'professional' , skus: 100  , storage: 100 , price: 2988 },
        {id: 4   ,name:'Free'  , code: 'free'         , skus: 50   , storage: 50  , price: 0    }
      ]

      def free?
        self.code == 'free'
      end
    end
  end

  module Mail

    class Type < KeyValues::Base
        self.data = [
          {id: 10, name: 'Order confirmation alert'            , code: 'order_confirm'                 , des: 'When an order is created，Send this message to customers'                                  },
          {id: 20, name: 'New orders alert'              , code: 'new_order_notify'              , des: 'When a new order is created，Send this message to the shop manager'                        },
          #{id: 25, name: '新订单提醒(手机)'        , code: 'new_order_notify_mobile'       , des: '当有新订单创建时，给网店管理者发送此手机短信'                    },
          {id: 26, name: 'Orders payment confirmation alert'        , code: 'order_paid'                    , des: 'When an order to pay，Send this message to customers'                                  },
          {id: 27, name: 'Orders paid reminder'            , code: 'order_paid_notify'             , des: 'When an order to pay，Send this message to the shop manager'                            },
          {id: 30, name: 'Cargo send reminders'            , code: 'ship_confirm'                  , des: 'When a customer orders the goods sent，Send this message to customers'                      },
          {id: 40, name: 'Send message changes to remind goods'    , code: 'ship_update'                   , des: 'When sending a message of change orders，Send this message to customers'                        },
          #{id: 50, name: '联系买家'                , code: 'contact_buyer'                 , des: '在订单页面点击"发送邮件"时显示的邮件内容'                        },
          {id: 60, name: 'Order Cancellation reminder'            , code: 'order_cancelled'               , des: 'When the order is canceled，Send this message to customers'                                  },
          #{id: 70, name: '顾客帐号激活提醒'        , code: 'customer_account_activation'   , des: '当客户创建帐号时，告知客户如何激活帐户,给客户发送此邮件'         }, # 暂不需要
          #{id: 80, name: '顾客帐号密码更改提醒'    , code: 'customer_password_reset'       , des: '当客户需要密码变更时，给客户发送此邮件'                          },
          #{id: 90, name: '顾客帐号确认提醒'        , code: 'customer_account_welcome'      , des: '当客户激活了帐户时，给客户发送此邮件'                            }
        ]

        def title_body
          title = Rails.cache.fetch "shopqi_templates_emails_#{self.code}_title" do
            File.read(Rails.root.join("app/views/admin/templates/emails/#{self.code}_title.liquid"))
          end
          body = Rails.cache.fetch "shopqi_templates_emails_#{self.code}_body" do
            File.read(Rails.root.join("app/views/admin/templates/emails/#{self.code}_body.liquid"))
          end
          [title, body]
        end
    end
  end

  # 商品相关
  module Product

    module Inventory

      class Manage < KeyValues::Base
        self.data = [
          {id: 1, name: 'No need to track inventory'            , code: ''      },
          {id: 2, name: 'This style requires ShopQi inventory tracking', code: 'shopqi'}
        ]
      end

      class Policy < KeyValues::Base
        self.data = [
          {id: 1, name: 'Deny users insufficient inventory purchasing this product'    , code: 'deny'    },
          {id: 2, name: 'Allows the user to buy this product，Even less stock', code: 'continue'}
        ]
      end

    end

    # 商品款式选项
    class Option < KeyValues::Base
      self.data = [
        {id: 1, name: 'Title', code: 'title'    },
        {id: 2, name: 'Size', code: 'size'     },
        {id: 3, name: 'Color', code: 'color'    },
        {id: 4, name: 'Material', code: 'material' },
        {id: 5, name: 'Style', code: 'style'    }
      ]
    end

  end

  # 顾客
  module Customer

    class Boolean < KeyValues::Base
      self.data = [
        {id: 1, name: 'Be', code: true },
        {id: 2, name: 'No', code: false},
      ]
    end

    class State < KeyValues::Base
      self.data = [
        {id: 1, name: 'Enabled', code: 'enabled' },
        {id: 2, name: 'Disabled', code: 'disabled'},
        {id: 3, name: 'Has invited', code: 'invited' },
        {id: 4, name: 'Is rejected', code: 'declined'}, #发送邀请邮件后顾客拒绝注册
      ]
    end

    # 过滤器
    class PrimaryFilter < KeyValues::Base
      self.data = [
        {id: 1, name: 'The amount of consumption'    , code: 'total_spent'              , clazz: 'integer'},
        {id: 2, name: 'Orders'      , code: 'orders_count'             , clazz: 'integer'},
        {id: 3, name: 'Single time'    , code: 'last_order_date'          , clazz: 'date'   },
        #{id: 4, name: '所在城市'   , code: 'city'                     , clazz: 'city'   },
        {id: 5, name: 'Receive e-mail marketing', code: 'accepts_marketing'        , clazz: 'boolean'},
        {id: 6, name: 'Time to give up orders', code: 'last_abandoned_order_date', clazz: 'date'   },
        #{id: 7, name: '订单标签'   , code: 'tag'                      , clazz: 'tag'    },
        {id: 8, name: 'Account Status'    , code: 'status'                   , clazz: 'status' }
      ]
    end

    # 过滤器条件
    module SecondaryFilter

      class Integer < KeyValues::Base
        self.data = [
          {id: 1, name: 'Greater than', code: 'gt'},
          {id: 2, name: 'Less than', code: 'lt'},
          {id: 3, name: 'Equal', code: 'eq' }
        ]
      end

      class Date < KeyValues::Base
        self.data = [
          {id: 1, name: 'In the last week'  , code: 'last_week'    },
          {id: 2, name: 'In the last month', code: 'last_month'   },
          {id: 3, name: 'In the last three months', code: 'last_3_months'},
          {id: 4, name: 'In the last year'  , code: 'last_year'    },
        ]
      end

    end

  end

  # 订单
  module Order

    # 状态
    class Status < KeyValues::Base
      self.data = [
        {id: 1, name: 'Normal'  , code: 'open'    },
        {id: 2, name: 'Closed', code: 'closed'  },
        {id: 3, name: 'Canceled', code: 'cancelled'}
      ]
    end

    # 支付状态
    class FinancialStatus < KeyValues::Base
      self.data = [
        {id: 1, name: 'Paid', code: 'paid'      },
        {id: 2, name: 'To be paid', code: 'pending'   },
        {id: 3, name: 'Authenticate'  , code: 'authorized'},
        {id: 4, name: 'Give up'  , code: 'abandoned' },
        {id: 5, name: 'Refunded', code: 'refunded'  },
      ]
    end

    # 配送状态
    class FulfillmentStatus < KeyValues::Base
      self.data = [
        {id: 1, name: 'Shipped'  , code: 'fulfilled'},
        {id: 2, name: 'Section delivery', code: 'partial'  },
        {id: 3, name: 'Unshipped'  , code: 'unshipped'}
      ]
    end

    class CancelReason < KeyValues::Base # 取消原因
      self.data = [
        {id: 1, name: 'Customers change/Cancel Order', code: 'customer'    },
        {id: 2, name: 'Repeat Orders'         , code: 'duplicate'   },
        {id: 3, name: 'Did not make timely payments'     , code: 'not_pay'     },
        {id: 4, name: 'Fraudulent orders'       , code: 'fraud'       },
        {id: 5, name: 'No product of'       , code: 'inventory'   },
        {id: 6, name: 'Other'             , code: 'other'       }
      ]
    end

    class TrackingCompany < KeyValues::Base # 快递公司
      self.data = [
        {id: 1,  name: 'SF Express' , code: 'SF Express' , url: 'http://www.sf-express.com/cn/sc' },
        {id: 2,  name: 'EMS'      , code: 'EMS'      , url: 'http://www.ems.com.cn'           },
        {id: 3,  name: 'STO E Logistics', code: 'STO E Logistics', url: 'http://www.sto.cn'               },
        {id: 4,  name: 'Tact Express' , code: 'Tact Express' , url: 'http://www.yto.net.cn'           },
        {id: 5,  name: 'Through courier' , code: 'Through courier' , url: 'http://www.zto.cn'               },
        {id: 6,  name: 'Home delivery'   , code: 'Home delivery'   , url: 'http://www.zjs.com.cn'           },
        {id: 7,  name: 'TNT' , code: 'TNT' , url: 'http://www.yundaex.com'          },
        {id: 8,  name: 'Daily Express' , code: 'Daily Express' , url: 'http://www.ttkdex.com'           },
        {id: 9,  name: 'FedEx' , code: 'FedEx' , url: 'http://www.fedex.com/cn'         },
        {id: 10, name: 'Huitong Express' , code: 'Huitong Express' , url: 'http://www.htky365.com'          },
        #{id: 11, name: '华强物流' , code: '华强物流' , url: ''                               },
        {id: 12, name: 'Translating...'     , code: 'Translating...'     , url: ''                                }
      ]

      def self.url(name) # 根据公司名称获取url地址
        self.find_by_name(name).try(:url)
      end
    end

  end

  module Link

    #链接类型
    class Type < KeyValues::Base
      self.data = [
        {id: 1, name: 'Blog'    , code: 'blog'      },
        {id: 2, name: 'Store Home', code: 'frontpage' },
        {id: 3, name: 'Product collections', code: 'collection'},
        {id: 4, name: 'Specify the page', code: 'page'      },
        {id: 5, name: 'Designated goods', code: 'product'   },
        {id: 6, name: 'Query page', code: 'search'    },
        {id: 7, name: 'Other Website', code: 'http'      }
      ]
    end

  end

  module Collection

    #规则相关列
    class Column < KeyValues::Base
      self.data = [
        {id: 1, name: 'Product Name', code: 'title'                      , clazz: 'string'  },
        {id: 2, name: 'Product Type', code: 'product_type'               , clazz: 'string'  },
        {id: 3, name: 'Goods Manufacturers', code: 'vendor'                     , clazz: 'string'  },
        {id: 4, name: 'Commodity price', code: 'variants_price'             , clazz: 'integer' },
        {id: 5, name: 'Compare Prices', code: 'variants_compare_at_price'  , clazz: 'integer' },
        {id: 6, name: 'In Stock', code: 'variants_inventory_quantity', clazz: 'integer' },
        {id: 7, name: 'Style Name', code: 'variants_option1'           , clazz: 'string'  }
      ]
    end

    #规则关系
    class Relation < KeyValues::Base
      self.data = [
        {id: 1, name: 'Equal'    , code: 'equals'      , clazz: 'all'    },
        {id: 2, name: 'Greater than'    , code: 'greater_than', clazz: 'integer'},
        {id: 3, name: 'Less than'    , code: 'less_than'   , clazz: 'integer'},
        {id: 4, name: 'Begins', code: 'starts_with' , clazz: 'string' },
        {id: 5, name: 'This end', code: 'ends_with'   , clazz: 'string' },
        {id: 6, name: 'Contain'    , code: 'contains'    , clazz: 'string' },
      ]
    end

    #排序
    class Order < KeyValues::Base
      self.data = [
        {id: 1 , name: 'Ascending order by title Pinyin: A-Z'  , code: 'title.asc'      },
        {id: 2 , name: 'Pinyin descending by title: Z-A'  , code: 'title.desc'     },
        #{id: 3, name: '按销售量排序'         , code: 'best-selling'   },
        {id: 4 , name: 'By creation date: Recently - the farthest', code: 'created_at.desc'},
        {id: 5 , name: 'By creation date: Farthest - recently', code: 'created_at.asc' },
        {id: 6 , name: 'Sort by Price: High - Low', code: 'price.desc'     },
        {id: 7 , name: 'Sort by Price: Minimum - maximum', code: 'price.asc'      },
        {id: 8 , name: 'Manual sorting'             , code: 'manual'         },
      ]

      #手动排序?
      def self.is_manual?(order)
        'manual' == order
      end
    end

  end

  module Webhook

    class Event < KeyValues::Base # 事件
      CARTS_CREATE           = 'carts/create'
      CARTS_UPDATE           = 'carts/update'
      COLLECTIONS_CREATE     = 'collections/create'
      COLLECTIONS_DELETE     = 'collections/delete'
      COLLECTIONS_UPDATE     = 'collections/update'
      CUSTOMER_GROUPS_CREATE = 'customer_groups/create'
      CUSTOMER_GROUPS_DELETE = 'customer_groups/delete'
      CUSTOMER_GROUPS_UPDATE = 'customer_groups/update'
      ORDERS_CREATE          = 'orders/create'
      ORDERS_UPDATE          = 'orders/update'
      ORDERS_PAID            = 'orders/paid'
      ORDERS_FULFILLED       = 'orders/fulfilled' # 订单完全发货后才会触发事件
      ORDERS_CANCELLED       = 'orders/cancelled'
      PRODUCTS_CREATE        = 'products/create'
      PRODUCTS_DELETE        = 'products/delete'
      PRODUCTS_UPDATE        = 'products/update'

      self.data = [
        #{id: 1, name: '创建购物车'  , code: CARTS_CREATE          , scopes: [:read_carts    , :write_carts    ]},
        #{id: 1, name: '更新购物车'  , code: CARTS_UPDATE          , scopes: [:read_carts    , :write_carts    ]},
        #{id: 2, name: '新增集合'    , code: COLLECTIONS_CREATE    , scopes: [:read_products , :write_products ]},
        #{id: 2, name: '删除集合'    , code: COLLECTIONS_DELETE    , scopes: [:read_products , :write_products ]},
        #{id: 2, name: '修改集合'    , code: COLLECTIONS_UPDATE    , scopes: [:read_products , :write_products ]},
        #{id: 2, name: '新增顾客分组', code: CUSTOMER_GROUPS_CREATE, scopes: [:read_customers, :write_customers]},
        #{id: 2, name: '删除顾客分组', code: CUSTOMER_GROUPS_DELETE, scopes: [:read_customers, :write_customers]},
        #{id: 2, name: '修改顾客分组', code: CUSTOMER_GROUPS_UPDATE, scopes: [:read_customers, :write_customers]},
        #{id: 2, name: '新增订单'    , code: ORDERS_CREATE         , scopes: [:read_orders   , :write_orders   ]},
        #{id: 2, name: '修改订单'    , code: ORDERS_UPDATE         , scopes: [:read_orders   , :write_orders   ]},
        #{id: 2, name: '订单支付'    , code: ORDERS_PAID           , scopes: [:read_orders   , :write_orders   ]},
        {id: 2, name: 'Orders shipped'    , code: ORDERS_FULFILLED      , scopes: [:read_orders   , :write_orders   ]}
        #{id: 2, name: '取消订单'    , code: ORDERS_CANCELLED      , scopes: [:read_orders   , :write_orders   ]},
        #{id: 2, name: '新增商品'    , code: PRODUCTS_CREATE       , scopes: [:read_products , :write_products ]},
        #{id: 2, name: '删除商品'    , code: PRODUCTS_DELETE       , scopes: [:read_products , :write_products ]},
        #{id: 2, name: '修改商品'    , code: PRODUCTS_UPDATE       , scopes: [:read_products , :write_products ]}
      ]
    end

  end

end









