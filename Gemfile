source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "activeadmin"
gem "devise"
gem "jbuilder", "~> 2.5"
gem "puma", "~> 3.7"
gem "rails", "~> 5.1.5"
gem "sass-rails", "~> 5.0"
gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "uglifier", ">= 1.3.0"

group :production do
  gem "pg"
  gem "rails_12factor"
end

group :development, :test do
  gem "better_errors"
  gem "binding_of_caller"
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "console_ip_whitelist", github: "firstdraft/console_ip_whitelist"
  gem "dotenv-rails"
  gem "grade_runner", github: "firstdraft/grade_runner"
  gem "pry-rails"
  gem "sqlite3", "~> 1.3", "< 1.4"
  gem "web_git", github: "firstdraft/web_git"
end

group :development do
  gem "annotate"
  gem "awesome_print"
  gem "dev_toolbar", github: "firstdraft/dev_toolbar"
  gem "draft_generators", github: "firstdraft/draft_generators"
  gem "letter_opener"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "meta_request"
  gem "spring-watcher-listen", "~> 2.0.0f"
  gem "spring"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "capybara"
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem "webmock"
  gem "rspec-html-matchers"
end
