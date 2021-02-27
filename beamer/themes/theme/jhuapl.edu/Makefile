.PHONY: default
default: beamerthemejhuapl.edu.sty beamerthemejhuapl.edu.pdf

.PHONY: minted
minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

beamerthemejhuapl.edu.sty:
beamerthemejhuapl.edu.pdf: beamercolorthemebluejay.sty beamerthemejhu.edu.sty beamerthemejhuapl.edu.sty example.pdf | minted

example.pdf: beamerthemejhuapl.edu.sty

include $(shell git rev-parse --show-toplevel)/Makefile.mk
