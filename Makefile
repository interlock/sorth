SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c  
.ONESHELL:
.DEFAULT_GOAL := help

OS := $(shell uname -s)
ifeq ($(OS),Darwin)
	ARCH ?= $(shell arch)
else
	ARCH ?= $(shell uname -m)
endif

# MAKEFLAGS += --warn-undefined-variables
# MAKEFLAGS += --no-builtin-rules

help:  ## Help
	@grep -E -H '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | \
		sed -n 's/^.*:\(.*\): \(.*\)##\(.*\)/\1%%%\3/p' | \
		column -t -s '%%%'

sorth: src/*.cpp ## Build
	clang++ \
		-std=c++20 \
		-arch $(ARCH) \
		$^ \
		-O3 \
		-o $@
	strip ./$@

clean: ## Clean
	rm -f sorth