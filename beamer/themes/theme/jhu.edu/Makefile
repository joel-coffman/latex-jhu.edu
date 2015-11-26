.PHONY: default
default: minted beamerthemejhu.edu.sty beamerthemejhu.edu.pdf

.PHONY: minted
minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

beamerthemejhu.edu.pdf: beamerthemejhu.edu.sty

include ../../../../Makefile.mk
