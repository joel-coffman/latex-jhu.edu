.PHONY: default
default: beamerthemejhu.edu.sty beamerthemejhu.edu.pdf

.PHONY: minted
minted:
	if ! [ -d $@ ]; then mkdir --parents $@; fi

beamerthemejhu.edu.pdf: beamerthemejhu.edu.sty example.pdf | minted

example.pdf: beamerthemejhu.edu.sty

include ../../../../Makefile.mk
