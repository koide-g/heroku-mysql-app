# heroku mysql app

```
% heroku apps:create heroku-mysql-test-app
Creating ⬢ heroku-mysql-test-app... done
https://heroku-mysql-test-app.herokuapp.com/ | https://git.heroku.com/heroku-mysql-test-app.git
% heroku buildpacks:set heroku/ruby
Buildpack set. Next release on heroku-mysql-test-app will use heroku/ruby.
Run git push heroku master to create a new release using this buildpack.
```

MySQLのaddonを追加する

```
% heroku addons:create cleardb:ignite
Creating cleardb:ignite on ⬢ heroku-mysql-test-app... free
Created cleardb-contoured-81064 as CLEARDB_DATABASE_URL
Use heroku addons:docs cleardb to view documentation
% heroku config | grep CLEARDB_DATABASE_URL
CLEARDB_DATABASE_URL: mysql://b1e71482e9fa43:b551272b@us-cdbr-iron-east-01.cleardb.net/heroku_b1f8156c71e7c0f?reconnect=true
```

rails で mysql2 gemをアダプタに使う場合は、 `mysql://` を `mysql2:// `に変更して `DATABASE_URL` にセットする

```
% heroku config:set DATABASE_URL='mysql2://b1e71482e9fa43:b551272b@us-cdbr-iron-east-01.cleardb.net/heroku_b1f8156c71e7c0f?reconnect=true'
Setting CLEARDB_DATABASE_URL and restarting ⬢ heroku-mysql-test-app... done, v4
CLEARDB_DATABASE_URL: mysql2://b1e71482e9fa43:b551272b@us-cdbr-iron-east-01.cleardb.net/heroku_b1f8156c71e7c0f?reconnect=true
```

```
% git push heroku master
% heroku run rails db:migrate
% heroku apps:open
```
