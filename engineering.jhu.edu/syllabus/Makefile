.PHONY: default
default: syllabus.sty syllabus.pdf

.PHONY: minted
minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

syllabus.pdf: syllabus.sty | minted

include ../../Makefile.mk
