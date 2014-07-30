TOP_DIR = ../..
DEPLOY_RUNTIME ?= /kb/runtime
TARGET ?= /kb/deployment

include $(TOP_DIR)/tools/Makefile.common
TESTS = $(wildcard tests/*.t)
SRC_PERL = $(wildcard scripts/*.pl)

WD = $(shell pwd)

all:

bin: 

deploy: deploy-client
deploy-service: deploy-client
deploy-client: deploy-libs deploy-scripts


test:
	for t in $(TESTS) ; do \
		$(DEPLOY_RUNTIME)/bin/perl $$t ; \
		if [ $$? -ne 0 ] ; then \
			exit 1 ; \
		fi \
	done


include $(TOP_DIR)/tools/Makefile.common.rules
