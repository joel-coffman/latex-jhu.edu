.PHONY: default
default: beamerthemeengineering.jhu.edu.sty beamerthemeengineering.jhu.edu.pdf

.PHONY: minted
minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

beamerthemeengineering.jhu.edu.sty:
beamerthemeengineering.jhu.edu.pdf: beamerthemeengineering.jhu.edu.sty | minted

include ../../../../Makefile.mk
