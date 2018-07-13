#require File.expand_path('../config/app', __FILE__)
require 'pathname'
require 'rake/clean'

task default: %i( hugo create_headers login_page access_control )
CLOBBER.include('public/*')

task :hugo do
  system('hugo') or abort('失敗')
end

directory './public'
task :create_headers do |t|
  header = Pathname.new('./public/_headers')
  header.open('w') do |f|
    f.write <<~HEADER
    HEADER
  end
end

task :login_page do |t|
  Pathname.new('./public/login.html').open('w') do |f|
    f.write <<HTML
<!DOCTYPE html>
<html>
<head>
  <title>A static website</title>
  <script type="text/javascript" src="https://identity.netlify.com/v1/netlify-identity-widget.js"></script>
</head>
<body>
  <!-- Add a menu:
   Log in / Sign up - when the user is not logged in
   Username / Log out - when the user is logged in
  -->
  <div data-netlify-identity-menu></div>

  <!-- Add a simpler button:
    Simple button that will open the modal.
  -->
  <div data-netlify-identity-button>Login with Netlify Identity</div>
</body>
</html>
HTML
  end
end

task :access_control do |t|
  Pathname.new('./public/_redirects').open('w') do |f|
    f.write <<~CONTROL
      /admin/* 200! Role=admin
      /*       200! Role=user
      /        /login.html 401
    CONTROL
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
