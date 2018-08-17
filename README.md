# Sinatra Boilerplate v3

Instalar dependencias:

    $ bundler install

Ejecutar aplicación:

    $ rackup

Ejecutar aplicación hot-reaload:

    $ rerun rackup

### Mmigraciones

Migraciones con DBMATE - ubicaciones:

    $ dbmate -d "ubicaciones/migrations" -e "DATABASE_UBICACIONES" new <<nombre_de_migracion>>
    $ dbmate -d "ubicaciones/migrations" -e "DATABASE_UBICACIONES" up

---

Fuentes:

+ https://blog.carbonfive.com/2013/06/24/sinatra-best-practices-part-one/
+ https://stackoverflow.com/questions/735073/best-way-to-require-all-files-from-a-directory-in-ruby
