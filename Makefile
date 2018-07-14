production:
	hugo

deploy_preview:
	hugo && cp netlify/{_redirects,login.html} public/.

