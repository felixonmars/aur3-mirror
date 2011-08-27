/*
 * Copyright (c) 2003-2004 Linuxant inc.
 * Copyright (c) 2001-2004 Conexant Systems, Inc.
 * 
 * 1.   Permitted use. Redistribution and use in source and binary forms,
 * without modification, are only permitted under the terms set forth herein.
 * 
 * 2.   Disclaimer of Warranties. LINUXANT, ITS SUPPLIERS, AND OTHER CONTRIBUTORS
 * MAKE NO REPRESENTATION ABOUT THE SUITABILITY OF THIS SOFTWARE FOR ANY PURPOSE.
 * IT IS PROVIDED "AS IS" WITHOUT EXPRESS OR IMPLIED WARRANTIES OF ANY KIND.
 * LINUXANT AND OTHER CONTRIBUTORS DISCLAIMS ALL WARRANTIES WITH REGARD
 * TO THIS SOFTWARE, INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS
 * FOR A PARTICULAR PURPOSE, GOOD TITLE AND AGAINST INFRINGEMENT.
 * 
 * This software has not been formally tested, and there is no guarantee that
 * it is free of errors including, but not limited to, bugs, defects,
 * interrupted operation, or unexpected results. Any use of this software is
 * at user's own risk.
 * 
 * 3.   No Liability.
 * 
 * (a) Linuxant, its suppliers, or contributors shall not be responsible for
 * any loss or damage to users, customers, or any third parties for any reason
 * whatsoever, and LINUXANT, ITS SUPPLIERS OR CONTRIBUTORS SHALL NOT BE LIABLE
 * FOR ANY ACTUAL, DIRECT, INDIRECT, SPECIAL, PUNITIVE, INCIDENTAL, OR
 * CONSEQUENTIAL (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED, WHETHER IN CONTRACT, STRICT OR OTHER LEGAL THEORY OF
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY
 * WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
 * OF SUCH DAMAGE.
 * 
 * (b) User agrees to hold Linuxant, its suppliers, and contributors harmless
 * from any liability, loss, cost, damage or expense, including attorney's fees,
 * as a result of any claims which may be made by any person, including
 * but not limited to User, its agents and employees, its customers, or
 * any third parties that arise out of or result from the manufacture,
 * delivery, actual or alleged ownership, performance, use, operation
 * or possession of the software furnished hereunder, whether such claims
 * are based on negligence, breach of contract, absolute liability or any
 * other legal theory.
 * 
 * 4.   Notices. User hereby agrees not to remove, alter or destroy any
 * copyright, trademark, credits, other proprietary notices or confidential
 * legends placed upon, contained within or associated with the Software,
 * and shall include all such unaltered copyright, trademark, credits,
 * other proprietary notices or confidential legends on or in every copy of
 * the Software.
 * 
 * 5.   Reverse-engineering. User hereby agrees not to reverse engineer,
 * decompile, or disassemble the portions of this software provided solely
 * in object form, nor attempt in any manner to obtain their source-code.
 * 
 * 6.   Redistribution. Redistribution of this software is only permitted
 * for exact copies (without modification) of versions explicitly marked
 * and officially released by Linuxant with the word "free" in their name.
 * Redistribution or disclosure of other versions, derivatives or license key
 * information is expressly prohibited without explicit written approval signed
 * by an authorized Linuxant officer.
 * 
 * 7.   Performance. V.92 modems are designed to be capable of receiving data at
 * up to 56Kbps with compatible phone line and server equipment, and transmitting
 * data at up to 31.2Kbps. V.90 modems are designed to be capable of receiving
 * data at up to 56 Kbps from a compatible service provider and transmitting data
 * at up to about 28.8 Kbps. Public networks currently limit download speeds to
 * about 53Kbps. The free version of the drivers is limited to 14.4Kbps.
 * Actual speeds vary and are often less than the maximum possible.
 * 
 * 
 */

/*----------------------------------------------------------------------------
 *
 * Copyright (C) 1996-2007 Conexant Systems Inc. 
 * All rights reserved.
 *
 *----------------------------------------------------------------------------
 *
 * File: framewrk.h
 *
 * * framewrk.h - definitions of project's OS, CPU, Compiler etc.
 *
 *----------------------------------------------------------------------------
 */
 
#ifndef __FRAMEWRK_H__
#define __FRAMEWRK_H__


/* Define some usefull sets of frameworks: */
/* ----------------------------------------*/
#define FWK_WIN9X_SOFTK56		0x11111111
#define FWK_WIN9X_SOFTK56_V92	0x11111112
#define FWK_LINUX_SOFTK56		0x22222222
#define FWK_WIN9X_NILE 			0x33333333
#define FWK_WIN9X_KERNEL_NILE	0x44444444
#define FWK_SETTINGS_DLL 		0x55555555
#define FWK_OCTOLOADER			0x66666666
#define FWK_MAC_HCF             0x77777777
#define FWK_WDM_NILE_CTRL 		0x88888888
#define FWK_WDM_SOFTK56			0xaaaaaaaa
#define FWK_NT4_SOFTK56			0xbbbbbbbb
#define FWK_DLL_SOFTK56			0xcccccccc
#define FWK_DOS					0xdddddddd
#define FWK_GNRL_WIN_R3         0xeeeeeeee
#define FWK_GNRL_VXD            0xffffffff
#define FWK_ORCA_CONSOLE        0x12121212
#define FWK_DOSTEST				0x13131313
#define FWK_WIN9X_OCT			0x14141414
#define FWK_GNRL_HSF_R3			0x15151515
#define FWK_VXWORKS_MIPS		0x16161616
#define FWK_WDM_SOFTK56TOOLS    0x17171717
#define FWK_MACOSX				0x18181818
#define FWK_MACOSX_CONSOLE      0x19191919
#define FWK_SANSIRO			    0x10101010
#define FWK_WDM64_SOFTK56		0x20202020
#define FWK_CORSICA_ADS			0x21212121
#define FWK_DLL_SANSIRO			0x23232323
#define	FWK_ISS_SANSIRO			0x24242424
#define FWK_AMD64_WIN_R3        0x25252525
#define FWK_CORSICA_SDT			0x26262626

#ifdef FRAME_WORK

#if (FRAME_WORK==FWK_WIN9X_SOFTK56)
#define PROJECT     PRJ_HSF
#define PRJ_FLAVOUR	PRJFLVR_HSF
#define OS_TYPE     OS_WIN_9X
#define UK_MODE     UK_KERNEL
#define CPU_TYPE    CPU_I386
#define CPU_VER     586
#define IO_MODE     IO_ONLINE
#define COMPILER    CMP_MSDEV
#define CMP_VER     5
#define DEV_TOOL    DT_VTOOLSD
#define DEBUG_LEVEL DEBUG_RETAIL
#define OCT_SW_MODEM 0
#define OCT_MEM_MGR	0
#define USE_MEM_MGR	1
#define USE_PRAGMA_PACK	1
#define BIG_ENDIAN_MACHINE 0
#define V92 0

#define FRAME_WORK_STR "Framework: Win9X SoftK56"

#elif (FRAME_WORK==FWK_WIN9X_SOFTK56_V92)
#define PROJECT     PRJ_HSF
#define PRJ_FLAVOUR	PRJFLVR_HSF
#define OS_TYPE     OS_WIN_9X
#define UK_MODE     UK_KERNEL
#define CPU_TYPE    CPU_I386
#define CPU_VER     586
#define IO_MODE     IO_ONLINE
#define COMPILER    CMP_MSDEV
#define CMP_VER     5
#define DEV_TOOL    DT_VTOOLSD
#define DEBUG_LEVEL DEBUG_RETAIL
#define OCT_SW_MODEM 0
#define OCT_MEM_MGR	0
#define USE_MEM_MGR	1
#define USE_PRAGMA_PACK	1
#define BIG_ENDIAN_MACHINE 0
#define V92 1

#define FRAME_WORK_STR "Framework: Win9X SoftK56"
 
#elif ( FRAME_WORK == FWK_WIN9X_OCT )
#define PROJECT     PRJ_HSF
#define PRJ_FLAVOUR	PRJFLVR_HSF
#define OS_TYPE     OS_WIN_9X
#define UK_MODE     UK_KERNEL
#define CPU_TYPE    CPU_I386
#define CPU_VER     586
#define IO_MODE     IO_ONLINE
#define COMPILER    CMP_MSDEV
#define CMP_VER     5
#define DEV_TOOL    DT_VTOOLSD
#define DEBUG_LEVEL DEBUG_RETAIL
#define OCT_SW_MODEM 1
#define OCT_MEM_MGR	1
#define USE_MEM_MGR	1
#define USE_PRAGMA_PACK	1
#define BIG_ENDIAN_MACHINE 0
 
#define FRAME_WORK_STR "Framework: Linux SoftK56"
 

#elif ( FRAME_WORK == FWK_LINUX_SOFTK56 )

#define PROJECT     PRJ_HSF
#define OS_TYPE     OS_LINUX
#define PRJ_FLAVOUR	PRJFLVR_CIDER
#ifdef __KERNEL__
#define UK_MODE     UK_KERNEL
#else
#define UK_MODE     UK_USER
#endif
#ifdef __x86_64__
#define CPU_TYPE    CPU_AMD64
#define CPU_VER     786
#else
#define CPU_TYPE    CPU_I386
#define CPU_VER     586
#endif
#define IO_MODE     IO_ONLINE
#define COMPILER    CMP_GCC
#define CMP_VER     __GNUC__
#define DEV_TOOL    DT_NONE
#ifdef DEBUG
#define DEBUG_LEVEL DEBUG_DEVELOP
#else
#define DEBUG_LEVEL DEBUG_RETAIL
#endif
#define OCT_SW_MODEM 1
#define OCT_MEM_MGR	0
#define USE_MEM_MGR	0
#define USE_PRAGMA_PACK	0
#define USE_DIRECT_API 1                                                      
#ifdef __x86_64__
#define PORTABILITY 1
#else
#define PORTABILITY 0
#endif
#define BIG_ENDIAN_MACHINE 0
#define USE_DCP
#define USE_SMART_DAA
#define USE_INLINE_OS_MEMMGR
#define OVERRIDE_NEW 0
#define MULTYDP

/*
#define SCR
#undef  USE_PROFILER
*/


#include "build_modules.h"

#define FRAME_WORK_STR "Framework: Linux SoftK56"

#elif ( FRAME_WORK == FWK_WDM_NILE_CTRL )

#define PROJECT     PRJ_SDSL
#define PRJ_FLAVOUR	PRJFLVR_NILE
#define OS_TYPE     OS_WIN_WDM
#define UK_MODE     UK_KERNEL
#define CPU_TYPE    CPU_I386
#define CPU_VER     786
#define IO_MODE     IO_ONLINE
#define COMPILER    CMP_MSDEV
#define CMP_VER     6
#define DEV_TOOL    DT_MS98DDK
#define DEBUG_LEVEL DEBUG_DEVELOP
#define OCT_MEM_MGR	1
#define USE_MEM_MGR	1
#define USE_PRAGMA_PACK	1
#define BIG_ENDIAN_MACHINE 0

#define FRAME_WORK_STR "Framework: WDM Nile"

#elif ( FRAME_WORK == FWK_WIN9X_NILE )

#define PROJECT     PRJ_SDSL
#define PRJ_FLAVOUR	PRJFLVR_NILE
#define OS_TYPE     OS_WIN_9X
#define UK_MODE     UK_USER
#define CPU_TYPE    CPU_I386
#define CPU_VER     786
#define IO_MODE     IO_OFFLINE
#define COMPILER    CMP_MSDEV
#define CMP_VER     6
#define DEV_TOOL    DT_NONE
#define DEBUG_LEVEL DEBUG_DEVELOP
#define OCT_MEM_MGR	1
#define USE_MEM_MGR	1
#define USE_PRAGMA_PACK	1
#define BIG_ENDIAN_MACHINE 0

#define FRAME_WORK_STR "Framework: Win9X Nile (Offline)"

#elif (FRAME_WORK == FWK_MAC_HCF)

#define PROJECT     PRJ_HCF
#define PRJ_FLAVOUR	PRJFLVR_HCF
#define OS_TYPE     OS_APPLE
#define UK_MODE     UK_KERNEL
#define CPU_TYPE    CPU_I386
#define CPU_VER     586
#define IO_MODE     IO_ONLINE
#define COMPILER    CMP_MSDEV
#define CMP_VER     5
#define DEV_TOOL    DT_NONE
#define DEBUG_LEVEL DEBUG_DEVELOP
#define BIG_ENDIAN_MACHINE 1

#define FRAME_WORK_STR "Framework: MAC HCF"

#elif ( FRAME_WORK == FWK_GNRL_VXD )

#define PROJECT     PRJ_GNRL_VXD
#define PRJ_FLAVOUR	PRJFLVR_HSF
#define OS_TYPE     OS_WIN_9X
#define UK_MODE     UK_KERNEL
#define CPU_TYPE    CPU_I386
#define CPU_VER     786
#define IO_MODE     IO_ONLINE
#define COMPILER    CMP_MSDEV
#define CMP_VER     5
#define DEV_TOOL    DT_VTOOLSD
#define DEBUG_LEVEL DEBUG_DEVELOP
#define BIG_ENDIAN_MACHINE 0

#define FRAME_WORK_STR "Framework: General Windows Ring0 (VxD)"

#elif ( FRAME_WORK == FWK_WIN9X_KERNEL_NILE )

#define PROJECT     PRJ_SDSL
#define PRJ_FLAVOUR	PRJFLVR_NILE
#define OS_TYPE     OS_WIN_9X
#define UK_MODE     UK_KERNEL
#define CPU_TYPE    CPU_I386
#define CPU_VER     786
#define IO_MODE     IO_ONLINE
#define COMPILER    CMP_MSDEV
#define CMP_VER     6
#define DEV_TOOL    DT_VTOOLSD
#define DEBUG_LEVEL DEBUG_DEVELOP
#define OCT_MEM_MGR	1
#define USE_MEM_MGR	1
#define USE_PRAGMA_PACK	1
#define BIG_ENDIAN_MACHINE 0

#define FRAME_WORK_STR "Framework: Win9X Nile (Online)"

#elif ( FRAME_WORK == FWK_GNRL_WIN_R3 )
#define PROJECT     PRJ_GNRL_WIN_R3
#define PRJ_FLAVOUR	PRJFLVR_HSF
#define OS_TYPE     OS_WIN_9X
#define UK_MODE     UK_USER
#define CPU_TYPE    CPU_I386
#define CPU_VER     786
#define IO_MODE     IO_OFFLINE
#define COMPILER    CMP_MSDEV
#define CMP_VER     6
#define DEV_TOOL    DT_NONE
#define DEBUG_LEVEL DEBUG_DEVELOP
#define OCT_SW_MODEM 0
#define OCT_MEM_MGR	0
#define USE_MEM_MGR	0
#define USE_PRAGMA_PACK	1
#define BIG_ENDIAN_MACHINE 0
#define PORTABILITY 1

#define FRAME_WORK_STR "Framework: General Windows Ring3"
 
 
#elif ( FRAME_WORK == FWK_AMD64_WIN_R3 )
#define PROJECT     PRJ_AMD64_WIN_R3
#define PRJ_FLAVOUR	PRJFLVR_HSF
#define OS_TYPE     OS_WIN_WDM
#define UK_MODE     UK_USER
#define CPU_TYPE    CPU_AMD64
#define CPU_VER     786
#define IO_MODE     IO_OFFLINE
#define COMPILER    CMP_MSDEV
#define CMP_VER     6
#define DEV_TOOL    DT_NONE
#define DEBUG_LEVEL DEBUG_DEVELOP
#define OCT_SW_MODEM 0
#define OCT_MEM_MGR	0
#define USE_MEM_MGR	0
#define USE_PRAGMA_PACK	1
#define BIG_ENDIAN_MACHINE 0
 
#define FRAME_WORK_STR "Framework: Amd 64 Windows Ring3"

 
#elif ( FRAME_WORK == FWK_OCTOLOADER )

#define PROJECT     PRJ_OCTOLOADER
#define PRJ_FLAVOUR	PRJFLVR_APP
#define OS_TYPE     OS_WIN_9X
#define UK_MODE     UK_USER
#define CPU_TYPE    CPU_I386
#define CPU_VER     786
#define IO_MODE     IO_OFFLINE
#define COMPILER    CMP_MSDEV
#define CMP_VER     6
#define DEBUG_LEVEL DEBUG_DEVELOP
#define DEV_TOOL    DT_NONE
#define BIG_ENDIAN_MACHINE 0

#define FRAME_WORK_STR "Framework: Octoloader"

#elif ( FRAME_WORK == FWK_WDM_SOFTK56 )
#define PROJECT     PRJ_HSF
#define PRJ_FLAVOUR	PRJFLVR_HSF
#define OS_TYPE     OS_WIN_WDM
#define UK_MODE     UK_KERNEL
#define CPU_TYPE    CPU_I386
#define CPU_VER     586
#define IO_MODE     IO_ONLINE
#define COMPILER    CMP_MSDEV
#define CMP_VER     5
#define DEV_TOOL    DT_VDW
#define DEBUG_LEVEL DEBUG_RETAIL
#define OCT_SW_MODEM 0
#define OCT_MEM_MGR	0
#define USE_MEM_MGR	1
#define USE_PRAGMA_PACK	1
#define BIG_ENDIAN_MACHINE 0
#define PORTABILITY 0
 
#elif ( FRAME_WORK == FWK_WDM64_SOFTK56 )
#define PROJECT     PRJ_HSF
#define PRJ_FLAVOUR	PRJFLVR_HSF
#define OS_TYPE     OS_WIN_WDM
#define UK_MODE     UK_KERNEL
#define CPU_TYPE    CPU_AMD64  
#define CPU_VER     586
#define IO_MODE     IO_ONLINE
#define COMPILER    CMP_MSDEV
#define CMP_VER     5
#define DEV_TOOL    DT_VDW
#define DEBUG_LEVEL DEBUG_RETAIL
#define OCT_SW_MODEM 0
#define OCT_MEM_MGR	0
#define USE_MEM_MGR	1
#define USE_PRAGMA_PACK	1
#define BIG_ENDIAN_MACHINE 0
#define PORTABILITY 1
 
#define FRAME_WORK_STR "Framework: WDM SoftK56"

#elif ( FRAME_WORK == FWK_NT4_SOFTK56 )

#define PROJECT     PRJ_HSF
#define PRJ_FLAVOUR	PRJFLVR_HSF
#define OS_TYPE     OS_WIN_NT4
#define UK_MODE     UK_KERNEL
#define CPU_TYPE    CPU_I386
#define CPU_VER     586
#define IO_MODE     IO_ONLINE
#define COMPILER    CMP_MSDEV
#define CMP_VER     5
#define DEV_TOOL    DT_VDW
#define DEBUG_LEVEL DEBUG_RETAIL
#define OCT_SW_MODEM 0
#define OCT_MEM_MGR	0
#define USE_MEM_MGR	1
#define USE_PRAGMA_PACK	1
#define BIG_ENDIAN_MACHINE 0

#define FRAME_WORK_STR "Framework: NT4 SoftK56"

#elif ( FRAME_WORK == FWK_DLL_SOFTK56 )
#define PROJECT     PRJ_HSF
#define PRJ_FLAVOUR	PRJFLVR_HSF
#define OS_TYPE     OS_WIN_9X
#define UK_MODE     UK_USER
#define CPU_TYPE    CPU_I386
#define CPU_VER     586
#define IO_MODE     IO_OFFLINE
#define COMPILER    CMP_MSDEV
#define CMP_VER     5
#define DEV_TOOL    DT_NONE
#define DEBUG_LEVEL DEBUG_DEVELOP
#define OCT_SW_MODEM 0
#define OCT_MEM_MGR	0
#define USE_MEM_MGR	1
#define USE_PRAGMA_PACK	1
#define BIG_ENDIAN_MACHINE 0

#define FRAME_WORK_STR "Framework: Dll Offline SoftK56"

#elif ( FRAME_WORK == FWK_DOS )

#define PROJECT     PRJ_HSF
#define PRJ_FLAVOUR	PRJFLVR_HSF
#define OS_TYPE     OS_DOS
#define UK_MODE     UK_KERNEL
#define CPU_TYPE    CPU_I386
#define CPU_VER     586
#define IO_MODE     IO_ONLINE
#define COMPILER    CMP_MSDEV
#define CMP_VER     5
#define DEV_TOOL    DT_NONE
#define DEBUG_LEVEL DEBUG_DEVELOP
#define BIG_ENDIAN_MACHINE 0

#define FRAME_WORK_STR "Framework: DOS"

#elif ( FRAME_WORK == FWK_DOSTEST )

#define PROJECT     PRJ_HSFTEST
#define PRJ_FLAVOUR	PRJFLVR_HSF
#define OS_TYPE     OS_DOS
#define UK_MODE     UK_KERNEL
#define CPU_TYPE    CPU_I386
#define CPU_VER     586
#define IO_MODE     IO_ONLINE
#define COMPILER    CMP_BORLAND
#define CMP_VER     5.02
#define DEV_TOOL    DT_NONE
#define DEBUG_LEVEL DEBUG_DEVELOP
#define BIG_ENDIAN_MACHINE 0

#define FRAME_WORK_STR "Framework: DOSTEST"

#elif ( FRAME_WORK == FWK_ORCA_CONSOLE )

#define PROJECT     PRJ_HSF
#define PRJ_FLAVOUR	PRJFLVR_CYPRUS
#define OS_TYPE     OS_DOS
#define UK_MODE     UK_USER
#define CPU_TYPE    CPU_I386
#define CPU_VER     586
#define IO_MODE     IO_OFFLINE
#define COMPILER    CMP_MSDEV
#define CMP_VER     5
#define DEV_TOOL    DT_NONE
#define DEBUG_LEVEL DEBUG_DEVELOP
#define OCT_SW_MODEM 0
#define OCT_MEM_MGR	0
#define USE_MEM_MGR	0
#define USE_PRAGMA_PACK	1
#define BIG_ENDIAN_MACHINE 0

#define FRAME_WORK_STR "Framework: Orca console"

#elif ( FRAME_WORK == FWK_GNRL_HSF_R3 )
 
#define PROJECT     PRJ_HSF
#define OS_TYPE     OS_WIN_9X
#define UK_MODE     UK_USER
#define CPU_TYPE    CPU_I386
#define CPU_VER     586
#define IO_MODE     IO_OFFLINE
#define COMPILER    CMP_MSDEV
#define CMP_VER     5
#define DEV_TOOL    DT_NONE
#define DEBUG_LEVEL DEBUG_DEVELOP
#define OCT_SW_MODEM 0
#define OCT_MEM_MGR	0
#define USE_MEM_MGR	0
#define USE_PRAGMA_PACK	1
#define PRJ_FLAVOUR	PRJFLVR_HSF
#define BIG_ENDIAN_MACHINE 0
 
#define FRAME_WORK_STR "Framework: General HSF Application"

#elif ( FRAME_WORK == FWK_VXWORKS_MIPS )

#define PROJECT     PRJ_HSF
#define PRJ_FLAVOUR	PRJFLVR_CYPRUS
#define OS_TYPE     OS_VXWORKS
#define UK_MODE     UK_KERNEL
#define CPU_TYPE    CPU_MIPS
#define CPU_VER     4000
#define IO_MODE     IO_ONLINE
#define COMPILER    CMP_GCC
#define CMP_VER     2.96
#define DEV_TOOL    DT_NONE
#define DEBUG_LEVEL DEBUG_RETAIL
#define OCT_SW_MODEM 1
#define OCT_MEM_MGR	1
#define USE_MEM_MGR	1
#define USE_PRAGMA_PACK	0

#include "build_modules.h"
 
#define FRAME_WORK_STR "Framework: VxWorks Mips"

#elif ( FRAME_WORK == FWK_WDM_SOFTK56TOOLS )
#define PROJECT     PRJ_HSF
#define PRJ_FLAVOUR	PRJFLVR_HSF
#define OS_TYPE     OS_WIN_WDM
#define UK_MODE     UK_KERNEL
#define CPU_TYPE    CPU_I386
#define CPU_VER     586
#define IO_MODE     IO_ONLINE
#define COMPILER    CMP_MSDEV
#define CMP_VER     5
#define DEV_TOOL    DT_VDW
#define DEBUG_LEVEL DEBUG_RETAIL
#define OCT_SW_MODEM 0
#define OCT_MEM_MGR	0
#define USE_MEM_MGR	0
#define USE_PRAGMA_PACK	1
#define BIG_ENDIAN_MACHINE 0
 
#define FRAME_WORK_STR "Framework: WDM SoftK56"
 
#elif ( FRAME_WORK == FWK_MACOSX )

#define PROJECT     PRJ_HSF
#define PRJ_FLAVOUR	PRJFLVR_CIDER
#define OS_TYPE     OS_MACOSX
#define UK_MODE     UK_KERNEL
#define CPU_TYPE    CPU_PPC
#define CPU_VER     7455
#define IO_MODE     IO_ONLINE
#define COMPILER    CMP_GCC
#define CMP_VER     3
#define DEV_TOOL    DT_NONE
#define DEBUG_LEVEL DEBUG_RETAIL
#define OCT_SW_MODEM 1
#define OCT_MEM_MGR	1
#define USE_MEM_MGR	1
#define USE_PRAGMA_PACK	0
#define PORTABILITY 1
#define BIG_ENDIAN_MACHINE 1
#define MACTOPUS 1
#undef  BLAM
#define SCR
#undef  USE_PROFILER
#define USE_DCP
/* #define USE_SMART_DAA	*/

#include "octopus/include/build_modules.h"

#define FRAME_WORK_STR "Framework: MacOsX"

#elif ( FRAME_WORK == FWK_MACOSX_CONSOLE )

#define PROJECT     PRJ_HSF
#define PRJ_FLAVOUR	PRJFLVR_CIDER
#define OS_TYPE     OS_MACOSX
#define UK_MODE     UK_USER
#define CPU_TYPE    CPU_PPC
#define CPU_VER     7455
#define IO_MODE     IO_OFFLINE
#define COMPILER    CMP_GCC
#define CMP_VER     3
#define DEV_TOOL    DT_NONE
#define DEBUG_LEVEL DEBUG_RETAIL
#define OCT_SW_MODEM 0
#define OCT_MEM_MGR	0
#define USE_MEM_MGR	0
#define USE_PRAGMA_PACK	0
#define PORTABILITY 1

#define FRAME_WORK_STR "Framework: MacOsX Console"

#elif (FRAME_WORK==FWK_SANSIRO)
#define PROJECT     PRJ_SANSIRO
#define PRJ_FLAVOUR	PRJFLVR_SANSIRO
#define OS_TYPE     OS_XTENSA
#define UK_MODE     UK_KERNEL
#define CPU_TYPE    CPU_XTENSA
#define CPU_VER     10502
#define IO_MODE     IO_ONLINE
#define COMPILER    CMP_XCC
#define CMP_VER     10502
#define DEV_TOOL    DT_NONE
#define DEBUG_LEVEL DEBUG_RETAIL
#define OCT_SW_MODEM 0
#define OCT_MEM_MGR	0
#define USE_MEM_MGR	1
#define USE_PRAGMA_PACK	1
#define BIG_ENDIAN_MACHINE 0

#define FRAME_WORK_STR "Framework: SanSiro"

#elif ( FRAME_WORK == FWK_CORSICA_ADS )
 
#define PROJECT     PRJ_HSF
#define PRJ_FLAVOUR	PRJFLVR_CIDER
#define OS_TYPE     OS_STB
#define UK_MODE     UK_KERNEL
#define CPU_TYPE    CPU_ARM
#define CPU_VER     920
#define IO_MODE     IO_ONLINE
#define COMPILER    CMP_ADS
#define CMP_VER     1.2
#define DEV_TOOL    DT_NONE
#define DEBUG_LEVEL DEBUG_RETAIL
#define OCT_SW_MODEM 1
#define OCT_MEM_MGR	1
#define USE_MEM_MGR	1
#define USE_PRAGMA_PACK	0
#define PORTABILITY 1
 
#include "octopus/include/build_modules.h"
 
#define FRAME_WORK_STR "Framework: Corsica ADS"

#elif ( FRAME_WORK == FWK_CORSICA_SDT )
 
#define PROJECT     PRJ_HSF
#define PRJ_FLAVOUR	PRJFLVR_CIDER
#define OS_TYPE     OS_STB
#define UK_MODE     UK_KERNEL
#define CPU_TYPE    CPU_ARM
#define CPU_VER     920
#define IO_MODE     IO_ONLINE
#define COMPILER    CMP_SDT
#define CMP_VER     1.2
#define DEV_TOOL    DT_NONE
#define DEBUG_LEVEL DEBUG_RETAIL
#define OCT_SW_MODEM 1
#define OCT_MEM_MGR	1
#define USE_MEM_MGR	1
#define USE_PRAGMA_PACK	0
#define PORTABILITY 1
 
#include "octopus/include/build_modules.h"
 
#define FRAME_WORK_STR "Framework: Corsica SDT"
 
#elif (FRAME_WORK==FWK_DLL_SANSIRO)
#define PROJECT     PRJ_SANSIRO
#define PRJ_FLAVOUR	PRJFLVR_SANSIRO
#define OS_TYPE     OS_WIN_9X
#define UK_MODE     UK_USER
#define CPU_TYPE    CPU_I386
#define CPU_VER     586
#define IO_MODE     IO_OFFLINE
#define COMPILER    CMP_MSDEV
#define CMP_VER     5
#define DEV_TOOL    DT_NONE
#define DEBUG_LEVEL DEBUG_RETAIL
#define OCT_SW_MODEM 0
#define OCT_MEM_MGR	0
#define USE_MEM_MGR	0
#define USE_PRAGMA_PACK	0
#define BIG_ENDIAN_MACHINE 0

#define FRAME_WORK_STR "Framework: Dll Offline SanSiro"

#elif (FRAME_WORK==FWK_ISS_SANSIRO)
#define PROJECT     PRJ_SANSIRO
#define PRJ_FLAVOUR	PRJFLVR_SANSIRO
#define OS_TYPE     OS_XTENSA
#define UK_MODE     UK_KERNEL
#define CPU_TYPE    CPU_XTENSA
#define CPU_VER     10502
#define IO_MODE     IO_OFFLINE
#define COMPILER    CMP_XCC
#define CMP_VER     10502
#define DEV_TOOL    DT_NONE
#define DEBUG_LEVEL DEBUG_RETAIL
#define OCT_SW_MODEM 0
#define OCT_MEM_MGR	0
#define USE_MEM_MGR	1
#define USE_PRAGMA_PACK	1
#define BIG_ENDIAN_MACHINE 0

#define FRAME_WORK_STR "Framework: ISS SanSiro"

#else

#error --==> FRAME_WORK type unknown! <==--

#endif /* Checked all possible FRAME_WORK values */

#else /* No set defined: */

#define FRAME_WORK_STR "Custom Framework"

#endif


/* Define `PROJECT' to one of: */
/* ----------------------------*/
#define PRJ_HSF				0x00000001
#define PRJ_SDSL			0x00000002
#define PRJ_OCTOLOADER		0x00000008
#define PRJ_ORCA		    0x00000010
#define PRJ_GNRL_WIN_R3     0x00000020
#define PRJ_GNRL_VXD        0x00000040
#define PRJ_HSFTEST         0x00000080
#define PRJ_SANSIRO         0x00000100
#define PRJ_AMD64_WIN_R3    0x00000200

/* Use one of next macros, or just `#if ( OS_TYPE == xxx )' */
#define PRJ_ONE_OF(prj) ( ( PROJECT & (prj) ) != 0 )
#define PRJ_IS_NOT(prj) ( ( PROJECT & (~(prj)) ) != 0 )

#ifndef PROJECT
#error --==> PROJECT is not defined! <==--
#elif ( PRJ_IS_NOT(PRJ_HSF | PRJ_SDSL | PRJ_OCTOLOADER | PRJ_ORCA | PRJ_GNRL_WIN_R3 | PRJ_GNRL_VXD | PRJ_HSFTEST| PRJ_SANSIRO |PRJ_AMD64_WIN_R3) )
#error --==> Bad PROJECT definition! <==--
#endif

/* Define `PRJ_FLAVOUR' to one of: */
/* ----------------------------*/
#define PRJFLVR_HSF		0x01000000
#define PRJFLVR_LINUX	0x02000000
#define PRJFLVR_CYPRUS	0x04000000
#define PRJFLVR_NILE    0x08000000
#define PRJFLVR_SANSIRO 0x10000000
#define PRJFLVR_CIDER	0x20000000
 
/* Use one of next macros, or just `#if ( OS_TYPE == xxx )' */
#define PRJFLVR_ONE_OF(prj) ( ( PRJ_FLAVOUR & (prj) ) != 0 )
#define PRJFLVR_IS_NOT(prj) ( ( PRJ_FLAVOUR & (~(prj)) ) != 0 )
 
#ifndef PRJ_FLAVOUR
#error --==> PRJ_FLAVOUR is not defined! <==--
#elif ( PRJFLVR_IS_NOT(PRJFLVR_HSF | PRJFLVR_LINUX | PRJFLVR_CYPRUS | PRJFLVR_NILE | PRJFLVR_SANSIRO | PRJFLVR_CIDER) )
#error --==> Bad PRJ_FLAVOUR definition! <==--
#endif

/* Define `OS_TYPE' to one of: */
/* ----------------------------*/
#define OS_WIN_9X   0x00000010
#define OS_WIN_NT4  0x00000020
#define OS_WIN_WDM  0x00000040
#define OS_LINUX    0x00000080
#define OS_WIN_CE   0x00000100
#define OS_PSOS     0x00000200
#define OS_QNX      0x00000400
#define OS_MACOS    0x00000800
#define OS_MQX      0x00001000
#define OS_APPLE    0x01000000
#define OS_DOS      0x02000000
#define OS_VXWORKS  0x04000000
#define OS_MACOSX	0x08000000
#define OS_XTENSA	0x10000000
#define OS_STB		0x20000000
#define OS_NUCLEUS	0x40000000
#define OS_NOS	    0x80000000
#define OS_WINXP_AND_HIGHER OS_WIN_WDM // XXX ?

/* Use one of next macros, or just `#if ( OS_TYPE == xxx )' */
#define OS_ONE_OF(os) ( ( OS_TYPE & (os) ) != 0 )
#define OS_IS_NOT(os) ( ( OS_TYPE & (~(os)) ) != 0 )

#ifndef OS_TYPE
#error --==> OS_TYPE is not defined! <==--
#elif (OS_IS_NOT(OS_WIN_9X | OS_WIN_NT4 | OS_WIN_WDM | OS_LINUX | \
				 OS_WIN_CE | OS_PSOS | OS_QNX | OS_MACOS | OS_MQX | OS_APPLE  | \
                 OS_DOS | OS_VXWORKS | OS_MACOSX | OS_XTENSA | OS_STB | \
                 OS_NUCLEUS | OS_NOS))
#error --==> Bad OS_TYPE definition! <==--
#endif


/* Define `UK_MODE' to one of: */
/* ----------------------------*/
#define UK_USER     0x00001000
#define UK_KERNEL   0x00002000

#ifndef UK_MODE
#error --==> UK_MODE is not defined! <==--
#elif ( (UK_MODE != UK_USER) && (UK_MODE != UK_KERNEL) )
#error --==> Bad UK_MODE definition! <==--
#endif


/* Define `IO_MODE' to one of: */
/* ----------------------------*/
#define IO_ONLINE   0x00004000
#define IO_OFFLINE  0x00008000

#ifndef IO_MODE
#error --==> IO_MODE is not defined! <==--
#elif ( (IO_MODE != IO_ONLINE) && (IO_MODE != IO_OFFLINE) )
#error --==> Bad IO_MODE definition! <==--
#endif

/* Define `COMPILER' to one of: */
/* -----------------------------*/
#define CMP_MSDEV   0x00010000
#define CMP_DJGPP   0x00020000
#define CMP_GCC     0x00040000
#define CMP_BORLAND 0x00080000
#define CMP_XCC     0x00100000
#define CMP_ADS		0x00200000
#define CMP_SDT		0x00400000
#define CMP_RVCT    0x00800000
#define CMP_MCC     0x01000000

/* Use one of next macros, or just `#if ( COMPILER == xxx )' */
#define COMP_ONE_OF(comp) ( ( COMPILER & (comp) ) != 0 )
#define COMP_IS_NOT(comp) ( ( COMPILER & (~(comp)) ) != 0 )

#ifndef COMPILER
#error --==> COMPILER is not defined! <==--
#elif ( COMP_IS_NOT(CMP_MSDEV | CMP_DJGPP | CMP_GCC | CMP_BORLAND | CMP_XCC | CMP_ADS | CMP_SDT | CMP_RVCT | CMP_MCC) )
#error --==> Bad COMPILER definition! <==--
#endif

#if ( COMPILER == CMP_MSDEV )
#ifndef CMP_VER
#define CMP_VER 6
#endif
#if ( (CMP_VER != 5) && (CMP_VER != 6) )
#error --==> CMP_VER is not from CMP_MSDEV family! <==--
#endif
#endif /* CMP_MSDEV */

#ifndef CMP_VER
#define CMP_VER -1
#endif


/* Define `CPU_TYPE' to one of: */
/* -----------------------------*/
#define CPU_I386    0x00100000
#define CPU_MIPS    0x00200000
#define CPU_ALPHA   0x00400000
#define CPU_PPC		0x00800000
#define CPU_ARM		0x01000000
#define CPU_AMD64	0x02000000
#define CPU_ARC	    0x04000000
#define CPU_XTENSA  0x08000000
 
/* Also, define `CPU_VER' according to type and version (586, 686 etc).
   Unfortunatly, CPU_VER may only be a number, inorder to verify its value. */

/* Use one of next macros, or just `#if ( CPU_TYPE == xxx )' */
#define CPU_ONE_OF(cpu) ( ( CPU_TYPE & (cpu) ) != 0 )
#define CPU_IS_NOT(cpu) ( ( CPU_TYPE & (~(cpu)) ) != 0 )

#ifndef CPU_TYPE
#error --==> CPU_TYPE is not defined! <==--
#elif ( CPU_IS_NOT(CPU_I386 | CPU_MIPS | CPU_ALPHA | CPU_PPC | CPU_ARM | CPU_AMD64 | CPU_ARC) )
#error --==> Bad CPU_TYPE definition! <==--
#endif

#ifdef CPU_VER

#if ( CPU_TYPE == CPU_I386 )
#if ( (CPU_VER != 386) && (CPU_VER != 486) && (CPU_VER != 586) && \
      (CPU_VER != 686) && (CPU_VER != 786) )
#error --==> CPU_VER is not from CPU_I386 family! <==--
#endif
#elif ( CPU_TYPE == CPU_MIPS )
/* Put here MIPS cpu versions check */
#elif ( CPU_TYPE == CPU_ALPHA )
/* Put here ALPHA cpu versions check */
#elif ( CPU_TYPE == CPU_PPC )
#if ( CPU_VER != 7455 )
#error --==> CPU_VER is not from PPC family! <==--
#endif
#elif (CPU_TYPE == CPU_XTENSA)
#elif ( CPU_TYPE == CPU_ARM )
#endif /* CPU_TYPE */

#else /* CPU_VER not defined: */

#define CPU_VER -1

#endif /* CPU_VER */


/* Define `DEBUG_LEVEL' to one of: */
/* --------------------------------*/
#define DEBUG_DEVELOP 0x10000000
#define DEBUG_RETAIL  0x20000000
#define DEBUG_NONE    0x40000000

#ifndef DEBUG_LEVEL
#error --==> DEBUG_LEVEL is not defined! <==--
#elif ( (DEBUG_LEVEL != DEBUG_DEVELOP) && (DEBUG_LEVEL != DEBUG_RETAIL) && \
	(DEBUG_LEVEL != DEBUG_NONE) )
#error --==> Bad DEBUG_LEVEL definition! <==--
#endif


/* Define `DEV_TOOL' to one of: */
/* ----------------------------*/
#define DT_MS95DDK  0x00000001
#define DT_MS98DDK  0x00000002
#define DT_MSNTDDK  0x00000004
#define DT_VTOOLSD  0x00000008
#define DT_VDW      0x00000010
#define DT_NONE     0x00000020

#ifndef DEV_TOOL
#error --==> DEV_TOOL is not defined! <==--
#elif ( (DEV_TOOL != DT_MS95DDK) && (DEV_TOOL != DT_MS98DDK) && \
    (DEV_TOOL != DT_MSNTDDK) && (DEV_TOOL != DT_VTOOLSD) && (DEV_TOOL != DT_VDW) && (DEV_TOOL != DT_NONE))
#error --==> Bad DEV_TOOL definition! <==--
#endif

#if ( PROJECT == PRJ_HSF )
#define TARGET_HCF_FAMILY 0
#define FRAMEWORK_HCF_CADMUS2 0
#endif

#undef FRAME_WORK
#define FRAME_WORK FRAME_WORK_STR

#endif /* __FRAMEWRK_H__ */
