.PHONY: default
default: beamerthemeengineering.jhu.edu.sty beamerthemeengineering.jhu.edu.pdf

.PHONY: minted
minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

beamerthemeengineering.jhu.edu.sty:
beamerthemeengineering.jhu.edu.pdf: beamerthemejhu.edu.sty beamerthemeengineering.jhu.edu.sty example.pdf | minted

example.pdf: beamerthemeengineering.jhu.edu.sty

include $(shell git rev-parse --show-toplevel)/Makefile.mk
