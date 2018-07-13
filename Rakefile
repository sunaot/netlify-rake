require File.expand_path('../config/app', __FILE__)
require 'pathname'

desc 'Build resources'
task :build do
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

