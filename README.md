# SamfundetDomain

This project rocks and uses MIT-LICENSE.

## Installation

Add the following line to your Gemfile and run `bundle install` again.

```ruby
gem 'samfundet_domain', :git => "git://github.com/Samfundet/SamfundetDomain.git"
```

Copy the migrations to your project with the following command.

```bash
rake samfundet_domain_engine:install:migrations
```

Run `rake db:migrate` to execute the newly created migrations.

## Updating

Run the following commands to update the gem.

```bash
bundle update samfundet_domain
rake samfundet_domain_engine:install:migrations
```

Run `rake db:migrate` again to execute any newly created migrations.

## Usage

If installed correctly, you will have access to three new models: Group, GroupType and Area.
They can all be utilized exactly like any other models. They may be decorated using standards
ways of decorating models provided by engines.