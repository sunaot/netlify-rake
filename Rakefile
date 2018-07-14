#require File.expand_path('../config/app', __FILE__)
require 'pathname'
require 'rake/clean'

task default: %i( production )
CLOBBER.include('public/*')
NetlifyPath = {
  headers: Pathname.new('./netlify/_headers'),
  redirects: Pathname.new('./netlify/_redirects'),
  login_page: Pathname.new('./netlify/login.html')
}

task :production do
  Rake::Task['hugo:build'].invoke
end

task :deploy_preview do
  Rake::Task['hugo:build'].invoke
  Rake::Task['netlify:redirects'].invoke
  Rake::Task['netlify:login_page'].invoke
end

namespace :hugo do
  task :build do
    system('hugo') or abort('失敗')
  end
end

namespace :netlify do
  directory './public'
  task :headers do
    copy NetlifyPath[:headers], './public/'
  end

  task :redirects do
    copy NetlifyPath[:redirects], './public/'
  end

  task :login_page do
    copy NetlifyPath[:login_page], './public/'
  end
end
