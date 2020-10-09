.PHONY: default
default: beamercolorthemebluejay.sty beamercolorthemebluejay.pdf

beamercolorthemebluejay.sty:
beamercolorthemebluejay.pdf: beamercolorthemebluejay.sty example.pdf

example.pdf: beamercolorthemebluejay.sty

include $(shell git rev-parse --show-toplevel)/Makefile.mk
