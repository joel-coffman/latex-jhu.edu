.PHONY: default
default: syllabus.sty syllabus.pdf

.PHONY: minted
minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

syllabus.sty:
syllabus.pdf: syllabus.sty | minted

include $(shell git rev-parse --show-toplevel)/Makefile.mk
