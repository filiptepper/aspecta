# aspecta

``aspect`` is small add-on for the awesome
[carrierwave](http://github.com/jnicklas/carrierwave) gem. ``aspecta``
adds image dimensions validator to your ActiveRecords models.

## Usage

In your Gemfile:

    gem "aspecta"

Run:

    bundle install

Add validator to your model:

    class User < ActiveRecord::Base
      mount_uploader :avatar, AvatarUploader

      validates :avatar, :dimensions => {
        :height => { :minimum => 100, :maximum => 200 }
        :width => { :minimum => 100, :maximum => 200 }
      }
    end

Profit!

## I18n

Add following translations to your i18n setup:

    en:
      errors:
        messages:
          image_is_too_narrow: "image is too narrow, minimum is %{size} pixels"
          image_is_too_wide: "image is too wide, maximum is %{size} pixels"
          image_is_too_short: "image is too short, minimum is %{size} pixels"
          image_is_too_tall: "image is too tall, maximum is %{size} pixels"

## Contributing

Contributing is easy:

* fork & commit,
* submit issues.

Thank you!

## License

Copyright (c) 2011 Filip Tepper

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.