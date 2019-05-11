# README

## How to run the project

### Before continuing

Be sure the ruby ​​version
```
ruby 2.6.1
```

### 1. After clone the project run:

```
bundle install
```

### 2. Run migrations for the database setup
```
rails db:migrate
```

Using sqlite so no more configuration needed.

### 3. Run the server
```
rails s
```
Enjoy!

## Run mailcatcher for simulate emails

### Just run in the console
```
mailcatcher
```
You will see a message like this:
```
Starting MailCatcher
==> smtp://127.0.0.1:1025
==> http://127.0.0.1:1080/
*** MailCatcher runs as a daemon by default. Go to the web interface to quit.
```
MailCatcher runs as a daemon by default. Go to http://localhost:1080/ to see the web interface.

## Running test

Just run:
```
rspec spec
```
A coverage page will be generate.