SUBDIRS := $(wildcard */.)

build: $(SUBDIRS)

deploy: 

$(SUBDIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)

.PHONY: build deploy $(SUBDIRS)