# Steven H. Allen & Co. (http://stevenhallen.com)
# 
# NOTICE: This template uses Postgresql exclusively for now
#
#
# To use this template:
# 
# $ rails new <rails_app_name> -m https://gist.github.com/5777772.txt -S -T -d postgresql


# Install gems
gem "haml"

gem_group :development do
  gem "better_errors"
end

gem_group :development, :test do
  gem "database_cleaner"
  gem "factory_girl_rails"
  gem "jazz_hands"
  gem "rspec-rails"
  gem "shoulda"
  gem "valid_attribute"
end

run "rvm gemset create #{app_name}"
run "rvm gemset use #{app_name}"
run "bundle install"

# Create .rspec defaults
file '.rspec', <<-CODE
--color
CODE

# Create database user
run "createuser -d #{app_name}"
# Create database
rake "db:create:all"
rake "db:migrate"

# Run the Rails Generator on whatever
generate "rspec:install"

# Add syntactic goodness to spec_helper (via Mark M)
inject_into_file "spec/spec_helper.rb", :after => 'config.order = "random"' do <<-CODE
  config.include FactoryGirl::Syntax::Methods
CODE
end

# Clean everything up that we don't need before we check-in
remove_file 'public/index.html'

git :init 
git :add => "." 
git :commit => "-a -m 'Initial'"
