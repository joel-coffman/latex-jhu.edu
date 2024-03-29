# use Bash as the shell when interpreting the Makefile
SHELL := /bin/bash

# function to determine the current (included) Makefile
where-am-i = $(word $(words $(MAKEFILE_LIST)), $(MAKEFILE_LIST))
# location of this Makefile (presumably the root directory of a project)
CWD := $(dir $(call where-am-i))
CWD != realpath $(CWD) --relative-to=$(CURDIR)

# empty recipes to avoid rebuilding Makefiles via implicit rules
Makefile: ;
$(CWD)/Makefile.mk: ;

# add texmf directory to TEXINPUTS environment variable to find included files
# (e.g., packages)
TEXINPUTS := .:$(CWD)/texmf//:${TEXINPUTS}

# define TEX as pdflatex
TEX=TEXINPUTS=$(TEXINPUTS) pdflatex -shell-escape #-interaction batchmode

# Define a "Canned Recipe" for compiling PDFs from *.{dtx,tex} files.
#
# NOTE: OS X provides GNU Make 3.81, which does not support an assignment token
#       after `define' (see https://goo.gl/tml4Zi). If omitted, make assumes
#       it to be '='.
define compile-doc
$(TEX) -draftmode $<
if grep -E '^\\@istfilename' $*.aux; then \
		makeglossaries $*; \
fi
files=$$(sed -n 's/\\@input{\(.*\)}/\1/p' $*.aux); \
		if grep --quiet -E '\\(citation)' $*.aux $$files; then \
			bibtex $*; \
		fi
$(TEX) -draftmode $<
if [ -f $*.idx ]; then makeindex -s gind.ist -o $*.ind $*.idx; fi
if [ -f $*.glo ]; then makeindex -s $$(if [[ $< == *.dtx ]]; then echo gglo; else echo $*; fi).ist -o $*.gls $*.glo; fi
$(TEX) $<
while ( grep -q '^LaTeX Warning: Label(s) may have changed' $*.log ) do \
    $(TEX) $<; \
done
endef

external := $(basename $(shell find . -name "*.url"))
ifneq ($(external),)  # .SECONDARY should have prerequisite(s)
# do not automatically delete external files
.SECONDARY: $(external)
endif

DEPENDENCIES = $(wildcard *.bib) $(external) \
               $(wildcard $(CWD)/glossary.tex) \
               $(wildcard $(CWD)/references.bib)

PACKAGES = $(wildcard *.cls) $(wildcard *.sty)

%.pdf: %.dtx %.sty $(DEPENDENCIES) .version.tex
	$(compile-doc)

%.pdf: %.tex $(DEPENDENCIES) $(PACKAGES) \
       $(shell find . -mindepth 2 -name "*.tex")
	$(compile-doc)

%.sty: directory = $(dir $<)
%.sty: %.ins %.dtx
	$(TEX) -draftmode -output-directory=$(directory) $<

# include packages in the search path
packages != $(MAKE) --directory=$(CWD) --quiet list 2> /dev/null

vpath %.ins $(CWD):$(addprefix $(CWD)/,$(packages))
vpath %.dtx $(CWD):$(addprefix $(CWD)/,$(packages))
vpath %.sty $(CWD):$(addprefix $(CWD)/,$(packages))


derivatives += *.acn *.acr *.alg *.aux *.bbl *.blg *.dvi *.glb *.glx *.glg *.glo *.gls *.idx *.ind *.ilg *.ist *.log *.lof *.lot *.nav *.out *.pyg *.snm *.toc *.vrb

.PHONY: clean
clean:
	$(RM) $(derivatives)

.PHONY: veryclean
veryclean: clean
	$(RM) *.pdf

.PHONY: force
force: veryclean default


%:: %.url
	[ -s "$@" ] || curl --location --output "$@" "$$(cat "$<")"


package ?= \
        $(wildcard *.dtx) \
        $(wildcard *.ins) \
        $(patsubst %.dtx,%.pdf,$(wildcard *.dtx)) \
        $(wildcard README)

archive ?= $(patsubst %.dtx,%.zip,$(wildcard *.dtx))
# multiple packages (i.e., bundle) => use the directory as the package name
ifneq ($(words $(archive)),1)
archive = $(notdir $(CURDIR)).zip
endif

# target-specific variables
%.zip: directory := $(shell mktemp --directory)
%.zip: package_name = $(basename $@)

%.zip: $(package)
	mkdir $(directory)/$(package_name)
	cp $(package) $(directory)/$(package_name)
	cd $(directory) && zip -r $@ $(package_name)
	mv $(directory)/$@ $@
	$(RM) --recursive $(directory)

.PHONY: dist
dist: $(archive)

.PHONY: distcheck
distcheck: dist
	unzip -l $(archive) | grep '$(basename $(archive))/$$'  # package directory
	unzip -l $(archive) | grep '\.dtx$$'  # documented LaTeX (source)
	unzip -l $(archive) | grep '\.ins$$'  # installer
	unzip -l $(archive) | grep '\.pdf$$'  # documentation

_dist_derivatives += $(archive)

.PHONY: distclean
distclean:
	$(RM) $(patsubst %.url,%,$(shell find . -name "*.url"))
	$(RM) $(_dist_derivatives)


ifneq ($(shell git rev-parse --show-toplevel 2> /dev/null),)
VERSION:=$(shell git describe --abbrev=12 --always --dirty=+ | sed 's/.*/\\\\providecommand{\\\\version}{&}/')
endif

.PHONY: .version
.version:
	[ -f $@.tex ] || touch $@.tex
	echo "$(VERSION)" | cmp -s $@.tex - || echo "$(VERSION)" > $@.tex

.version.tex: .version
