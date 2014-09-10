# Makefile for managing requirements
# TODO [MK] - make this whole thing nicer

.PHONY: clean dev prod test

PYTHON_EXE = python2
VIRTUALENV = virtualenv -p $(PYTHON_EXE)
PIPARGS    = --download-cache=~/.pip-cache

all: dev prod test

dev: clean
	$(VIRTUALENV) .dev
	.dev/bin/pip install $(PIPARGS) -r dev.in --upgrade
	.dev/bin/pip freeze -l > dev.txt

prod: clean
	$(VIRTUALENV) .prod
	.prod/bin/pip install $(PIPARGS) -r prod.in --upgrade
	.prod/bin/pip freeze -l > prod.txt

test: clean
	$(VIRTUALENV) .test
	.test/bin/pip install $(PIPARGS) -r test.in --upgrade
	.test/bin/pip freeze -l > test.txt

clean:
	rm -rf .dev .prod .test
