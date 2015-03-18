/*
 *  in hardware.h, and needs to
 * stay sync with that.  It's hard to maintain, and should be fixed
 * globally for multi-platform build to use a fixed virtual address
 * for low-level debug uart port across platforms.
 */


#define HX_REGS_UART_PHYS_BASE     0xD000A000
#define HX_REGS_UART_VIRT_BASE     IOMEM(0xFEB00000)
#define HX_REGS_UART_SIZE          0x1000

#define UART_VADDR    (HX_REGS_UART_VIRT_BASE + 0x620)
#define UART_PADDR    (HX_REGS_UART_PHYS_BASE + 0x620)

/*
static void helx_serial_putc(const char c)
{
	int done = 0;

	if ( c == 0xFF ) {
		return;
	}

	arb15_acquire();

	while ( done == 0 ) {
		if (readw(rUART_STAT) & (1 << 6)) {
			writeb(c, rUART_TBR);
			done = 1;
		}
	}
}


*/

/* refere to arm/kernel/debug.S for usage */

		/*
		 * addruart_current will check if MMU is enabled and decide
		 * which address to use, virtual or physical
		 */
		.macro	addruart, rp, rv, tmp
		ldr	\rp, =UART_PADDR	@ physical
		ldr	\rv, =UART_VADDR	@ virtual
		.endm

		.macro	senduart,rd,rx
		str	\rd, [\rx, #0x04]	@ TXDATA
		.endm

		.macro	waituart,rd,rx
1002:		ldr	\rd, [\rx, #0x0C]	@ STAT
		tst	\rd, #1 << 6		@ TXDC
		beq	1002b			@ wait until transmit done
		.endm

		.macro	busyuart,rd,rx
		.endm