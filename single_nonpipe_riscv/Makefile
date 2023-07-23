TOP_FILE   = Tb.bsv
MORE_SOURCES =
TOP_MODULE = mkTb
EXE = Tb

BSC_COMP_FLAGS = -keep-fires -aggressive-conditions -no-warn-action-shadowing \
    -check-assert -cpp +RTS -K128M -RTS -show-range-conflict

BSC_LINK_FLAGS = -keep-fires

BSC_PATHS =

B_SIM_DIR = build
B_SIM_DIRS = -simdir $(B_SIM_DIR) -bdir $(B_SIM_DIR) -info-dir $(B_SIM_DIR)

BOS = $(foreach s, $(SOURCES), $(B_SIM_DIR)/$(s:.bsv=.bo))

all: $(EXE)

$(BOS) $(B_SIM_DIR)/$(TOP_MODULE).ba: $(TOP_FILE) $(MORE_SOURCES)
	mkdir  -p $(B_SIM_DIR)
	@echo Compiling for Bluesim ...
	bsc -u -sim $(B_SIM_DIRS) $(BSC_COMP_FLAGS) $(BSC_PATHS) $(TOP_FILE)
	@echo Compiling for Bluesim finished

$(EXE).so: $(BOS) $(B_SIM_DIR)/$(TOP_MODULE).ba
	@echo Linking for Bluesim ...
	bsc -e $(TOP_MODULE) -sim -o $(EXE) \
		$(B_SIM_DIRS) $(BSC_LINK_FLAGS) $(BSC_PATHS)
	@echo Linking for Bluesim finished

$(EXE): $(EXE).so

.PHONY: clean
clean:
	rm -rf $(EXE) $(EXE).so $(B_SIM_DIR)
