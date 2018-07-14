#require File.expand_path('../config/app', __FILE__)
require 'pathname'
require 'rake/clean'
require 'erb'

task default: %i( production )
CLOBBER.include('public/*')
NetlifyPath = {
  headers: Pathname.new('./netlify/_headers').read,
  redirects: Pathname.new('./netlify/_redirects').read,
  login_page: Pathname.new('./netlify/login.html').read
}

task :production do
  Rake::Task['build'].invoke
end

task :deploy_preview do
  Rake::Task['build'].invoke
  Rake::Task['netlify:login_page'].invoke
end

task :build do
  Rake::Task['hugo'].invoke
  Rake::Task['netlify:headers'].invoke
  Rake::Task['netlify:redirects'].invoke
end

task :hugo do
  system('hugo') or abort('失敗')
end

namespace :netlify do
  directory './public'
  task :headers do |t|
    Pathname.new('./public/_headers').open('w') do |f|
      f.write ERB.new(NetlifyPath[:headers]).result(binding)
    end
  end

  task :redirects do |t|
    Pathname.new('./public/_redirects').open('w') do |f|
      f.write ERB.new(NetlifyPath[:redirects]).result(binding)
    end
  end

  task :login_page do |t|
    copy NetlifyPath[:login_page].to_s, './public/'
  end
end
