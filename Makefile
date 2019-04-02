help:
	@echo "clean - remove _site/ directory"
	@echo "docs - generate documentation"
	@echo "servedocs - serve docs locally"
	@echo "push - sync local docs with S3 bucket"
	@echo "cachebust - Invalidate all paths on CloudFront"

clean:
	rm -rf _site/

docs: clean
	npx eleventy

servedocs: clean docs
	npx eleventy --serve

push: docs
	aws s3 sync --profile=stanford --delete _site/ s3://data-driven.news/

cachebust:
	aws cloudfront create-invalidation \
		--profile=stanford \
		--distribution-id=${DDNEWS_CDN_DISTRIBUTION_ID} --paths "/*"

