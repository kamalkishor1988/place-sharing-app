# README

# Place Sharing App dev setup

# Ruby version
```
ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-darwin17]
```

#### 1. Add new user for PostgreSQL

```bash
sudo adduser spp_user
```
and give UNIX password as admin.

Create a corresponding user in postgres and set the password there:

```bash
su postgres

psql template1
```

`psql` command will take you to postgres console. Following commands to be run there:

```sql
CREATE USER spp_user WITH PASSWORD 'admin';

ALTER ROLE spp_user WITH CREATEDB Replication;
```
#### OR Add the existing username and password to project database.yml

#### 4. Database setup

```bash
rake db:drop && rake db:create && rake db:migrate && rake db:seed && rake db:test:prepare
```

#### 8. Start rails server

```bash
bin/rails s
```
and go to `localhost:3000`. You should see the login page.

#### Run Test Cases
Default: Run all spec files (i.e., those matching spec/**/*_spec.rb)
```bash
$ bundle exec rspec
```

Run all spec files in a single directory (recursively)
```bash
$ bundle exec rspec spec/models
```
Use user details like username(i.e email) and password from seed file or You can sign up and use those credential to login

#### To get the places which have been shared publically
Note: username is email only.
```bash
$ http://localhost:3000/user1@example.com
```