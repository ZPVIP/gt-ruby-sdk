# Geetest ruby sdk


Geetest是一个很不错的验证码组件，使用方便，安全性强。

## 准备工作

由于 Geetest 2016 年 2 月升级了系统，他们需要针对 Id 和 key 人工修改某些参数后才能支持 Ruby 调用，所以使用前请联系客服。

修改成功后 `http://api.geetest.com/get.php?gt=你的ID` 才不会返回 404。

## 安装


```ruby
gem 'gee_test'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gee_test


## Rails 中使用

在 Rails 项目的 initilizer 中，添加 `geetest.rb`:

```
require 'gee_test'

GeeTest.app_id = 'xxx'
GeeTest.app_key = 'xx'
```

在eruby中使用

```eruby
<%= GeeTest.gee_test_tag(product: 'embed') %>
```

在controller中验证
```ruby
if GeeTest.validate({
  geetest_challenge: params['geetest_challenge'],
  geetest_validate: params['geetest_validate'],
  geetest_seccode: params['geetest_seccode'],
})
  'successfully'
else 
  'Can not validate'
end
```

## 如何使用demo

```sh
git clone
cd gt_ruby_sdk/demo
bundle
ruby app.rb
access localhost:4567 via your browser
```

## 在sinatra项目中使用geetest

参考[demo](demo)
