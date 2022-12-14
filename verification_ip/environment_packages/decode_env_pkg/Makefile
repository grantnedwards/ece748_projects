# decode_env interface packages source
# pragma uvmf custom additional begin
# pragma uvmf custom additional end

decode_env_PKG         = \
	+incdir+$(UVMF_VIP_LIBRARY_HOME)/environment_packages/decode_env_pkg \
	-F $(UVMF_VIP_LIBRARY_HOME)/environment_packages/decode_env_pkg/decode_env_filelist_hvl.f 


COMP_decode_env_PKG_TGT_0 = q_comp_decode_env_pkg
COMP_decode_env_PKG_TGT_1 = v_comp_decode_env_pkg
COMP_decode_env_PKG_TGT = $(COMP_decode_env_PKG_TGT_$(USE_VELOCE))

comp_decode_env_pkg: $(COMP_decode_env_PKG_TGT) 

q_comp_decode_env_pkg:
	$(HVL_COMP_CMD) $(decode_env_PKG)


v_comp_decode_env_pkg:
	$(HVL_COMP_CMD) $(decode_env_PKG)
	$(VELANALYZE_HVL_CMD) $(decode_env_PKG) 

ifeq ($(MTI_VCO_MODE),64)
  GCC_COMP_ARCH = -m64
else
  GCC_COMP_ARCH = -m32
endif

export decode_env_IF_DPI_SRC ?= $(UVMF_VIP_LIBRARY_HOME)/environment_packages/decode_env_pkg/dpi

C_FILE_COMPILE_LIST_decode_env_pkg	= \

O_FILE_COMPILE_LIST_decode_env_pkg = $(notdir $(C_FILE_COMPILE_LIST_decode_env_pkg:.c=.o))

GCC_COMP_ARGS_decode_env_pkg	+= -I$(decode_env_IF_DPI_SRC) \
	-fPIC 

GCC_COMP_ARGS_decode_env_pkg	+= $(decode_env_IF_GCC_COMP_ARGUMENTS)

GCC_LINK_ARGS_decode_env_pkg	+= \
	 \
 	-o .so
