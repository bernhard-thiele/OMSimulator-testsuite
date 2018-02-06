.PHONY: all OMSimulator.log difftool

all: difftool test

test: OMSimulator.log

OMSimulator.log:
	@$(MAKE) -C OMSimulator > OMSimulator.log
	@grep == OMSimulator.log

difftool:
	@$(MAKE) -C difftool
