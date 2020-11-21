.PHONY: default
default: beamerthemeep.jhu.edu.sty beamerthemeep.jhu.edu.pdf

.PHONY: minted
minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

beamerthemeep.jhu.edu.sty: | beamerthemeengineering.jhu.edu.sty whiting.logo.small.horizontal.white.eps
beamerthemeep.jhu.edu.pdf: beamerthemeep.jhu.edu.sty example.pdf | minted

example.pdf: beamerthemeep.jhu.edu.sty

include ../../../../Makefile.mk

# fall-back for Beamer themes
beamerthemeengineering.jhu.edu.sty:
	$(MAKE) --directory=../engineering.jhu.edu $@

whiting.logo.small.horizontal.white.eps: | beamerthemeengineering.jhu.edu.sty
	cp ../engineering.jhu.edu/$@ $@
