SUBDIRS := $(wildcard */.)

build: $(SUBDIRS)

deploy: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)

.PHONY: build deploy $(SUBDIRS)