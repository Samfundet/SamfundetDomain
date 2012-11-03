# SamfundetDomain

This project rocks and uses MIT-LICENSE.

## Installation

Add the following line to your Gemfile and run `bundle install` again.

```ruby
# SamfundetDomain is a gem which provides the application with samfundets domain models.
gem 'samfundet_domain', :git => "git://github.com/Samfundet/SamfundetDomain.git"
```

Copy the migrations to your project with the following command.

```bash
rake samfundet_domain_engine:install:migrations
```

Run `rake db:migrate` to execute the newly created migrations.

You may add the following line to your db/seeds.rb to seed group types, groups and areas.

```ruby
Rake::Task['samfundet_domain_engine:db:seed'].invoke
```

## Updating

Run the following commands to update the gem.

```bash
bundle update --source samfundet_domain
rake samfundet_domain_engine:install:migrations
```

Run `rake db:migrate` again to execute any newly created migrations.

## Usage

If installed correctly, you will have access to three new models: Group, GroupType and Area.
They can all be utilized exactly like any other models. They may be decorated using standards
ways of decorating models provided by engines.
