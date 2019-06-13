# Starting point project for Better code challenge

This is a Rails 5 API

## Configuration for development

Prerequisites: install git, Ruby 2.4.1, `bundler` gem.

```bash
git clone https://github.com/withbetterco/code-challenge.git
cd code-challenge
bundle install
bin/rake db:create
bin/rake db:migrate
bin/rake db:fixtures:load
```

Run the app locally:

```bash
bin/rails s
```
