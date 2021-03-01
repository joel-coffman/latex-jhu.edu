.PHONY: default
default: syllabus.sty syllabus.pdf

syllabus.sty:
syllabus.pdf: syllabus.sty

include $(shell git rev-parse --show-toplevel)/Makefile.mk

vpath %.sty  # clear search path for *.sty to avoid conflicts
