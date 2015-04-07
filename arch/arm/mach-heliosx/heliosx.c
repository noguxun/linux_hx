#include <asm/mach/arch.h>
#include <linux/mm.h>
#include <linux/init.h>
#include <asm/pgtable.h>
#include <asm/mach/map.h>
#include <asm/mach-types.h>

#include "heliosx.h"


static const char * const hx_dt_match[] __initconst = {
	"heliosx",
	NULL,
};

static struct map_desc hx_io_desc[] __initdata = {
	{
		.virtual = (unsigned long) HX_REGS_UART_VIRT_BASE,
		.pfn     = __phys_to_pfn(HX_REGS_UART_PHYS_BASE),
		.length  = HX_REGS_UART_SIZE,
		.type	 = MT_DEVICE,

	},
};

void __init hx_map_io(void)
{
	iotable_init(hx_io_desc, ARRAY_SIZE(hx_io_desc));
}

MACHINE_START(HELIOSX, "HeliosX")
	.map_io 	= hx_map_io,
MACHINE_END
