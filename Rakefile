#require File.expand_path('../config/app', __FILE__)
require 'pathname'
require 'rake/clean'
require 'erb'

task default: %i( hugo headers redirects )
CLOBBER.include('public/*')
NetlifyPath = {
  headers: Pathname.new('./netlify/_headers').read,
  redirects: Pathname.new('./netlify/_redirects').read
}

task :hugo do
  system('hugo') or abort('失敗')
end

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

