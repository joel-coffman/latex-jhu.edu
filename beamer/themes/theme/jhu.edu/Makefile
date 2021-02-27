.PHONY: default
default: beamerthemejhu.edu.sty beamerthemejhu.edu.pdf

.PHONY: minted
minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

beamerthemejhu.edu.sty:
beamerthemejhu.edu.pdf: beamercolorthemebluejay.sty beamerthemejhu.edu.sty example.pdf | minted

example.pdf: beamerthemejhu.edu.sty

include $(shell git rev-parse --show-toplevel)/Makefile.mk
