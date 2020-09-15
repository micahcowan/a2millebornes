.PHONY: all

all:
	$(MAKE) -C src $@
	mv src/MilleBornes.dsk .

%:
	$(MAKE) -C src $@
