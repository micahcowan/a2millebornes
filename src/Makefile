.PHONY: all

all: MilleBornes.dsk

.SECONDARY:

MilleBornes.dsk: ORIG.dsk HELLO Makefile
	cp ORIG.dsk $@
	dos33 -y $@ SAVE A HELLO

HELLO: mb.bas
	tokenize_asoft < $< > $@ || { rm $@; exit 1; }

.PHONY: fix
fix: HELLO
	asoft_detoken < HELLO >| mb.bas

.PHONY: clean
clean:
	rm -f MilleBornes.dsk HELLO
