help:
	@echo "install - create _site/ dir and install npm packages"
	@echo "clean - clear contents of _site/"
	@echo "docs - generate documentation"
	@echo "servedocs - serve docs locally"
	@echo "deploy - push local docs to S3 bucket"
	@echo "cachebust - invalidate all CloudFront assets"

clean:
	cd _site && rm -rf *

docs:
	npx eleventy

install:
	mkdir _site
	npm install

servedocs: clean docs
	npx eleventy --serve

deploy: clean docs
	aws s3 sync --profile=stanford --delete _site/ s3://data-driven.news/

cachebust:
	aws cloudfront create-invalidation \
		--profile=stanford \
		--distribution-id=${DDNEWS_CDN_DISTRIBUTION_ID} --paths "/*"

