help:
	@echo "install - create _site/ dir and install npm packages"
	@echo "clean - clear contents of _site/"
	@echo "docs - generate documentation"
	@echo "servedocs - serve docs locally"
	@echo "deploy - push current year docs to S3 bucket"
	@echo "deploy_all - clobber and republish entire site"
	@echo "cachebust - invalidate all CloudFront assets"

clean:
	cd _site && rm -rf *

docs:
	npx @11ty/eleventy

install:
	mkdir -p _site
	npm install

servedocs:
	npx @11ty/eleventy --serve

deploy_all: clean docs
	aws s3 sync --profile=stanford --delete _site/ s3://data-driven.news/

deploy: docs
	aws s3 sync --profile=default --delete _site/bna/2025/ s3://data-driven.news/bna/2025/
	aws s3 sync --profile=default --delete _site/how-to/ s3://data-driven.news/how-to/
	aws s3 sync --profile=default --delete _site/static/ s3://data-driven.news/static/

cachebust:
	aws cloudfront create-invalidation \
		--profile=default \
		--distribution-id=${DDNEWS_CDN_DISTRIBUTION_ID} --paths "/*"

