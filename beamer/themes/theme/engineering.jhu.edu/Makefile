.PHONY: default
default: beamerthemeengineering.jhu.edu.sty beamerthemeengineering.jhu.edu.pdf

.PHONY: minted
minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

beamerthemeengineering.jhu.edu.sty: | beamerthemejhu.edu.sty
beamerthemeengineering.jhu.edu.pdf: beamerthemeengineering.jhu.edu.sty example.pdf | minted

example.pdf: beamerthemeengineering.jhu.edu.sty

include ../../../../Makefile.mk

# fall-back for Beamer themes
beamerthemejhu.edu.sty:
	$(MAKE) --directory=../jhu.edu $@
