# Sinatra WebSocket Client

Instalar dependencias:

    $ bundler install

Ejecutar aplicación:

    $ puma

Ejecutar aplicación hot-reaload:

    $ rerun puma --ignore "public/*"

### Migraciones

Migraciones con DBMATE - ubicaciones:

    $ dbmate -d "db/migrations" -e "DATABASE_URL" new <<nombre_de_migracion>>
    $ dbmate -d "db/migrations" -e "DATABASE_URL" up

---

Fuentes:

+ https://blog.carbonfive.com/2013/06/24/sinatra-best-practices-part-one/
+ https://stackoverflow.com/questions/735073/best-way-to-require-all-files-from-a-directory-in-ruby
