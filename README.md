# Rails-API: A TO-DO API
A repository to build an API using Rails

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

  This Rails API uses the following testing dependencies:

    Added to both the development and test environments:

      rspec-rails:
        The rails implementation for RSpec
      factory_bot_rails:
        The rails implementation for FactoryBot

    This is done because they come shipped with generators
    that hook to the default Rails generators, such as the model
    generator. This causes the 'rails generate model model_name' command
    to invoke rspec and factory_bot to create the respective spec and
    factory.

    Added to the test environment only:

      shoulda-matchers:
        A set of custom matchers that simplify example construction, by
        providing fully descriptive matcher method names to increase
        readability and a wide variety of assertions.

      database_cleaner-active_record:
        The DatabaseCleaner implementation for Rails ActiveRecord ORM.
        Helps managing test database cleanup.

      faker:
        This module creates fake (but reasonable) data that can be used for
        things such as filling databases with fake information during
        development of database related applications.
        This automates database population to ensure data availability for
        the tests.

* Configuration

    Any additional configuration, i.e., any configuration that is not
    automatically added by default using the Rails project initializer,
    will be listed here.

##  Testing environment configuration:

### Factory Bot

    When adding Factory Bot to a project, its methods have to be explicitly
    included to RSpec configuration to avoid the need to prepend
    the class name to call them. This can be achieved by adding the
    following line to the RSpec.configure block within the spec_helper.rb file:

    ```ruby
      config.include FactoryBot::Syntax::Methods
    ```
### Database Cleaner

    First, database_cleaner has to be required at the top level, by adding the
    following line to the spec_helper.rub file:

    ```ruby
      require 'database_cleaner'
    ```

    To configure Database Cleaner for an RSpec testing environment,
    a cleanup has to be invoked and a strategy has to be specified
    in the global 'before' hook of RSpec. This is done by adding the
    following lines to the RSpec.configure block within the spec_helper.rb file:

    ```ruby
      config.before(:suite) do
        DatabaseCleaner.clean_with(:truncation)
        DatabaseCleaner.strategy = :transaction
      end
    ```
    Also, the transaction strategy has to be started from within the global
    around hook, to ensure it is executed for every example:

    ```ruby
      config.around(:each) do |example|
        DatabaseCleaner.cleaning do
          example.run
        end
      end
    ```

### Shoulda matchers

    Shoulda matchers have to be configured to use rspec as the test framework
    and add the matcher libraries for rails. This is done by adding the following lines to the spec_helper.rb file, outside of the RSpec.configure block:

    ```ruby
      Shoulda::Matchers.configure do |config|
        config.integrate do |with|
          with.test_framework :rspec
          with.library :rails
        end
      end
    ```  

* Database initialization

    The rails migrations have to be run to inizialize the database:

    ```bash
      rails db:migrate
    ```

* How to run the test suite

  The RSpec command line tool has to be run from within the project's root
  folder to run the test suite:

  ```bash
    ./rspec
  ```

  Specific tests can be run giving the path to a folder:

  ```bash
    ./rspec spec/models
    ./rspec spec/controllers
  ```
