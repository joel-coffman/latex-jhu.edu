.PHONY: default
default: beamerthemejhuapl.edu.sty beamerthemejhuapl.edu.pdf

.PHONY: minted
minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

beamerthemejhuapl.edu.sty:
beamerthemejhuapl.edu.pdf: beamerthemejhuapl.edu.sty | minted

include ../../../../Makefile.mk
