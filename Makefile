PREFIX = /usr/local


all:
	@echo 'Use `make install` to install to $(PREFIX)'

install: lessfilter.sh
	install -C $< $(PREFIX)/bin/$(basename $<)

PHONY: all install
