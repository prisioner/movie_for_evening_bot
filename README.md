# Movie for evening telegram bot

### Описание

Телеграм бот, который рекомендует, какой фильм посмотреть

### Ruby version

```
ruby 3.1.2
```

### Rails version

```
rails 7.0.4
```

Postgresql version

```
postgresql 12.12
```

## Первый запуск

```
gem install bundler
bundle install
bundle exec rails db:create
bundle exec rails db:migrate
copy .env.template .env
```

Заполнить переменные окружения в `.env`

### Загрузить данные с [IMDB](https://www.imdb.com/chart/top/)

```
bundle exec rake movies:update_from_imdb
```

### Запуск сервера

```
bundle exec rails s
```
