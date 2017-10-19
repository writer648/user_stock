# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

### Ruby version
Please verify that you have at least the following versions, or higher:

```
ruby -v
ruby 2.4.2p198 (2017-09-14 revision 59899) [x86_64-darwin16]

rails -v
Rails 5.1.4

mysql -V
mysql  Ver 14.14 Distrib 5.7.15, for osx10.12 (x86_64) using  EditLine wrapper
```
### System dependencies
This project was created by using the rails new command:
```
rails new user_stock -d mysql
```

After downloading the project please verify that you have all required gems:

```
bundle install
```

You may have to sudo install several gems if you don't have them.  Once everything is installed and checked off you'll see:

```
Bundle complete! 16 Gemfile dependencies, 72 gems now installed.
Use `bundle info [gemname]` to see where a bundled gem is installed.
```

You'll also need to install stock_quote gem:
https://github.com/tyrauber/stock_quote

```
sudo gem install stock_quote
```

Due to changes in Yahoo financial API's, some data elements have been deprecated but documentation has not been updated.

### Configuration
Coming Soon

### Database initialization

Please update database login settings at config/database.yml

For Ubuntu, I had to make some changes, as the socket is stored in a different location.  So watch out for that in config/database.yml
```
default: &default
  adapter: mysql2
  ...
  socket: /var/run/mysqld/mysqld.sock
```
might also want to:
```
chmod 640 database.yml
```
while you are there.

### Database creation
You'll have to make the initial databases

```
mysql> create database user_stock_dev;
Query OK, 1 row affected (0.00 sec)

mysql> create database user_stock_prod;
Query OK, 1 row affected (0.00 sec)

mysql> create database user_stock_test;
Query OK, 1 row affected (0.22 sec)
```

Don't forget to grant your user permissions to these databases.

Then back at the command line in the root project folder, run the following:
```
rails db:schema:dump
```

Migrate all db changes:
```
rails db:migrate
```

### Database Dummy Data
To make things interesting you may want to pre-load the db with some values using the rails console.  Here is an example of doing so with a few users:

```
rails console
irb(main):001:0> me = User.create(:first_name => "Goofy", :last_name => "<unknown>", :email => "goofy@disney.com", :password => "likescake")
...
irb(main):002:0> me = User.create(:first_name => "Mickey", :last_name => "Mouse", :email => "mmouse@disney.com", :password => "minnie")
...
```

Then startup up the Puma webserver:
```
rails server
```

go to http://localhost:3000 to see the website.

### How to run the test suite
Well, I'd have to write some tests first.  So once that is done then this is Coming Soon

### Services (job queues, cache servers, search engines, etc.)
Coming Soon

### Deployment instructions
Coming Soon

###  ...
