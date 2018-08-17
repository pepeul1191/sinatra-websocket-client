#registro de rutas
Dir["./routes/*.rb"].each {|file| require file }
#registro de initializers
Dir["./config/initializers/*.rb"].each {|file| require file }
#registro de modelos
Dir["./models/*_model.rb"].each {|file| require file }
#helpers
Dir["./helpers/*_helper.rb"].each {|file| require file }
