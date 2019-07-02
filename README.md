# GCaptcha

最近涉及验证码识别的工作，所以需要生成一定量的验证码数据进行训练，然后发现Ruby下没有比较方便的Gem可以做到直接生成验证码图片（大部分是与Rails结合的）。所以自己就针对[rucaptcha](https://github.com/huacnlee/rucaptcha)
抽离出验证码生成的逻辑，形成了这个Gem。验证码较为简单，仅作学习使用。

Recently, it involves the work of verification code identification, so it is necessary to generate a certain amount of verification code data for training, and then find that there is no convenient Gem under Ruby to directly generate verification code pictures (mostly combined with Rails). So I created the Gem according to the logic of [Rucaptcha](https://github.com/huacnlee/rucaptcha).The verification code is simple and just for learning.

## Example
![](./img/wiyvfca.png)

## Installation

```ruby
gem 'gcaptcha'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gcaptcha

## Usage

You can write the script to generate the captcha. Example:
```ruby
GCaptcha.configure do |config|
  config.style = :colorful           # default: :colorful, allows: [:colorful, :black_white]
  config.length = 5                  # default: 5, allows: 3..7
  config.strike_through = false      # default: true
  config.outline = false             # default: true, outline style for the hard mode
  config.batch_nums = 10             # default: 10, batch generate captcha
  config.img_path = "path"           # default: Dir.pwd
  config.extension_name = :jpg       # default: :jpg, allows: [:jpg, :png, :gif]
end

# generate one, return the img path
GCaptcha.generate

# batch generate, return an array of img path
GCaptcha.batch_generate

# get the config
GCaptcha.config
```

And also you can use the command, example:
```ruby
$ gcaptcha -h
Usage: GCaptcha [options]

Specific options:
    -s, --style [TYPE]               Color style, default: colorful, allows: [colorful, black_white]
    -l, --length [INTEGER]           Chars length: default 5, allows: [3..7]
    -t, --[no-]through               strike_through, default: true
    -u, --[no-]outline               Outline style for the hard mode, default: true
    -n, --nums [INTEGER]             The nums to batch generate captcha, default: 10
    -o, --output [STRING]            img output path, default: Dir.pwd
    -e, --ext_name [TYPE]            image's extension name, allows: [jpg, png, gif], default: jpg

Common options:
    -h, --help                       show the help message
    -v, --version                    Show version
```

## Thanks
* [rucaptcha](https://github.com/huacnlee/rucaptcha)
* [captcha](https://github.com/ITikhonov/captcha)

## Development

After checking out the repo, run `bin/setup` to install dependencies and run `rake compile` to make the c extension. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).