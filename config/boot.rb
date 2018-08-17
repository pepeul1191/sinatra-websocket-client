#registro de rutas
Dir["./routes/*.rb"].each {|file| require file }
#registro de initializers
Dir["./config/initializers/*.rb"].each {|file| require file }
#registro de modelos
Dir["./models/*.rb"].each {|file| require file }
#helpers
Dir["./helpers/*.rb"].each {|file| require file }
