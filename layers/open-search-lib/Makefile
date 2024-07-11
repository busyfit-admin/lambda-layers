SUBDIRS := $(wildcard */.)
PYTHON := python3

build:
	$(PYTHON) -m venv python && \
	source python/bin/activate && \
	pip3 install -r requirements.txt

deploy:

$(SUBDIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)

.PHONY: build deploy $(SUBDIRS)