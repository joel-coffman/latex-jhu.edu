.PHONY: default
default: beamerthemeep.jhu.edu.sty beamerthemeep.jhu.edu.pdf

.PHONY: minted
minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

beamerthemeep.jhu.edu.sty: | beamerthemejhu.edu.sty
beamerthemeep.jhu.edu.pdf: beamerthemeep.jhu.edu.sty example.pdf | minted

example.pdf: beamerthemeep.jhu.edu.sty

include ../../../../Makefile.mk

# fall-back for Beamer themes
beamerthemejhu.edu.sty:
	$(MAKE) --directory=../jhu.edu $@
