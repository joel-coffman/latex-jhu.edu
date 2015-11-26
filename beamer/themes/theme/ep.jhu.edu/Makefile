.PHONY: default
default: minted beamerthemeep.jhu.edu.sty beamerthemeep.jhu.edu.pdf

.PHONY: minted
minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

beamerthemeep.jhu.edu.pdf: beamerthemeep.jhu.edu.sty

include ../../../../Makefile.mk
