# decode_env interface packages source
# pragma uvmf custom additional begin
# pragma uvmf custom additional end

lc3_prediction_PKG         = \
	+incdir+$(UVMF_VIP_LIBRARY_HOME)/environment_packages/lc3_prediction_pkg \
	-F $(UVMF_VIP_LIBRARY_HOME)/environment_packages/lc3_prediction_pkg/lc3_prediction_filelist_hvl.f 


COMP_lc3_prediction_PKG_TGT_0 = q_comp_lc3_prediction_pkg
COMP_lc3_prediction_PKG_TGT_1 = v_comp_lc3_prediction_pkg
COMP_lc3_prediction_PKG_TGT = $(COMP_lc3_prediction_PKG_TGT_$(USE_VELOCE))

comp_lc3_prediction_pkg: $(COMP_lc3_prediction_PKG_TGT) 

q_comp_lc3_prediction_pkg:
	$(HVL_COMP_CMD) $(lc3_prediction_PKG)


v_comp_lc3_prediction_pkg:
	$(HVL_COMP_CMD) $(lc3_prediction_PKG)
	$(VELANALYZE_HVL_CMD) $(lc3_prediction_PKG) 

ifeq ($(MTI_VCO_MODE),64)
  GCC_COMP_ARCH = -m64
else
  GCC_COMP_ARCH = -m32
endif

export lc3_prediction_IF_DPI_SRC ?= $(UVMF_VIP_LIBRARY_HOME)/environment_packages/lc3_prediction_pkg/dpi

C_FILE_COMPILE_LIST_lc3_prediction_pkg	= \

O_FILE_COMPILE_LIST_lc3_prediction_pkg = $(notdir $(C_FILE_COMPILE_LIST_lc3_prediction_pkg:.c=.o))

GCC_COMP_ARGS_lc3_prediction_pkg	+= -I$(lc3_prediction_IF_DPI_SRC) \
	-fPIC 

GCC_COMP_ARGS_lc3_prediction_pkg	+= $(lc3_prediction_IF_GCC_COMP_ARGUMENTS)

GCC_LINK_ARGS_lc3_prediction_pkg	+= \
	 \
 	-o .so
