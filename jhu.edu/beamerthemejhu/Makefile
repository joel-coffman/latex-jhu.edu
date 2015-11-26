.PHONY: default
default: minted beamerthemejhu.sty beamerthemejhu.pdf

.PHONY: minted
minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

beamerthemejhu.pdf: beamerthemejhu.sty

include ../../Makefile.mk
