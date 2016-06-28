require 'data_mapper'
require 'dm-postgres-adapter'
require './models/user'
require './models/space'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/makers_bnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
