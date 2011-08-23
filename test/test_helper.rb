$:.push File.dirname(__FILE__)

require "test/unit"

require "active_model"
require "carrierwave"
require "carrierwave/orm/activerecord"
require "i18n"

require "aspecta"

require "lib/user"

I18n.load_path << File.dirname(__FILE__) + "/locale/en.yml"