#!/bin/bash

set -e

DEPLOY_REPO="https://${DEPLOY_BLOG_TOKEN}@github.com/leviplj/codez1.git"

function main {
	clean
	checkout
	build_site
}

function clean {
	echo "cleaning _site folder"
	if [ -d "_site" ]; then rm -Rf _site; fi
}

function checkout {
	echo "getting latest site version"
	git clone --depth 1 --branch gh-pages --single-branch $DEPLOY_REPO _site
}

function build_site {
	echo "building site"
	bundle exec jekyll build
}

main