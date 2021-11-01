.PHONY: default
default: beamercolorthemebluejay.sty beamercolorthemebluejay.pdf

.PHONY: minted
minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

beamercolorthemebluejay.sty:
beamercolorthemebluejay.pdf: beamercolorthemebluejay.sty example.pdf | minted

example.pdf: beamercolorthemebluejay.sty

include $(shell git rev-parse --show-toplevel)/Makefile.mk
