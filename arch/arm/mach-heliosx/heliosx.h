#ifndef __HELIOSX_H
#define __HELIOSX_H

/*

for reference

#define rUART_BASE	( 0xD000A620 )
#define rUART_RBR	(rUART_BASE + 0x00)
#define rUART_STAT	(rUART_BASE + 0x0C)
#define rUART_TBR	(rUART_BASE + 0x04)
#define rXCPU_ARB       ( 0xD000A06E)

*/


#define HX_REGS_UART_PHYS_BASE     0xD000A000
#define HX_REGS_UART_VIRT_BASE     IOMEM(0xFEB00000)
#define HX_REGS_UART_SIZE          0x1000


#endif
