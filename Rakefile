#require File.expand_path('../config/app', __FILE__)
require 'pathname'
require 'rake/clean'

task default: %i( hugo create_headers )
CLOBBER.include('public/*')

task :hugo do
  system('hugo') or abort('失敗')
end

directory './public'
task :create_headers do |t|
  header = Pathname.new('./public/_headers')
  header.open('w') do |f|
    f.write <<~HEADER
      /*
        Basic-Auth: visitor:phui7eec4ti'kaixishai4ie
    HEADER
  end
end

desc 'Build resources'
task :build do |t|
  path = File.expand_path('../public/index.html', __FILE__)
  html_file = Pathname.new(path)
  html_file.open('w') do |f|
    f.write <<~HTML
      <!DOCTYPE html>
      <html lang="ja">
      <head>
        <title>見本のページ</title>
      </head>
      <body>
        <h1>これは見本のページです</h1>
        <p>こんなページが生成されることもあるよ。</p>
      </body>
      </html>
    HTML
  end
end
