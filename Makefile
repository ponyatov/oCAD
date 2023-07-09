# var
MODULE  = $(notdir $(CURDIR))
module  = $(shell echo $(MODULE) | tr A-Z a-z)
OS      = $(shell uname -o|tr / _)
NOW     = $(shell date +%d%m%y)
REL     = $(shell git rev-parse --short=4 HEAD)
BRANCH  = $(shell git rev-parse --abbrev-ref HEAD)
CORES  ?= $(shell grep processor /proc/cpuinfo | wc -l)

# src
ML += $(wildcard bin/*.ml lib/*.ml)
DN += $(wildcard bin/dune lib/dune)

# all
EXE = _build/install/default/bin/$(MODULE)

.PHONY: all
all: $(EXE) lib/$(MODULE).ini
	$^
$(EXE): $(ML) $(DN)
	dune build

# format
.PHONY: format
format: tmp/format_ocaml
tmp/format_ocaml: $(ML)
	dune fmt && touch $@

# doc
.PHONY: docs
docs: tmp/format_ocaml
	ocamldoc \
		-html -d $@ -t $(MODULE) -charset utf-8 -css-style docs/dark.css \
		-dot -o docs/dot.dot -dot-include-all \
			$(ML)
	$(MAKE) docs/svg.svg

docs/svg.svg: docs/dot.dot
	dot -Tsvg -o $@ $<

# install
.PHONY: install update
install update:
	sudo apt update
	sudo apt install -yu `cat apt.txt`
	opam install . --deps-only
