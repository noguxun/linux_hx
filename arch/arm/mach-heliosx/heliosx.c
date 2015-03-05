#include <asm/mach/arch.h>


static const char * const v2m_dt_match[] __initconst = {
	"arm,heliosX",
	NULL,
};


DT_MACHINE_START(HELIOSX_DT, "HeliosX")
	.dt_compat	= v2m_dt_match,
	.l2c_aux_val	= 0x00400000,
	.l2c_aux_mask	= 0xfe0fffff,
MACHINE_END
