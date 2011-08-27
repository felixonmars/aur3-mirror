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
 * 6.   Redistribution. Permission to redistribute this software without
 * modification is granted, without prejudice to Linuxant's ability to obtain
 * reparation for any unauthorized distribution of previous versions of this
 * software released under prior LICENSE terms. Modification or redistribution
 * of this software under different terms requires explicit written approval
 * signed by an authorized Linuxant officer.
 * 
 * 7.   Performance. V.92 modems are designed to be capable of receiving data at
 * up to 56Kbps with compatible phone line and server equipment, and transmitting
 * data at up to 31.2Kbps. V.90 modems are designed to be capable of receiving
 * data at up to 56 Kbps from a compatible service provider and transmitting data
 * at up to about 28.8 Kbps. Public networks currently limit download speeds to
 * about 53Kbps. Actual speeds vary and are often less than the maximum possible.
 * 
 * 
 */

/****************************************************************************************
 *                     Version Control Information										*
 *                                                                                      *
 * $Header:   P:/d942/octopus/archives/osinclude/osservices.h_v   1.18   28 Apr 2003 14:37:06   beliloi  $
 * 
*****************************************************************************************/


/****************************************************************************************

File Name:			osservices.h	

File Description:	Prototypes for OS-specific functions.

*****************************************************************************************/


#ifndef __OSSERVICES_H__
#define __OSSERVICES_H__

#include "typedefs.h"
#include "comtypes.h"

#include "osstring_ex.h"

#ifdef __cplusplus
extern "C"
{
#endif

/****************************************************************************************


	Atomic operations 


****************************************************************************************/

/****************************************************************************************
    The OsAtomicCompareAndSwap function compares the value at the specified address with 
	oldVal. The value of newValue is written to the address only if oldValue and the 
	value at the address are equal. OsCompareAndSwap returns true if newValue is written 
	to the address; otherwise, it returns false. 
    
    Params:
        oldValue The value to compare at address.
        newValue The value to write to address if oldValue compares true.
        address The 4-byte aligned address of the data to update atomically.
    Result: true if newValue was written to the address. 
****************************************************************************************/
#define OsAtomicCompareAndSwap(o, n, ptr) OsAtomicCompareAndSwapEx((PVOID)(o), (PVOID)(n), (PVOID*)(ptr), sizeof(*(ptr)))
__shimcall__
BOOL OsAtomicCompareAndSwapEx (PVOID oldValue, PVOID newValue, PVOID* address, INT size);


/****************************************************************************************
    OsAtomicAdd
   
    OsAtomicAdd function adds the specified amount to the value at the specified 
    address and returns the result.
    Params:
        amount  The amount to add.
        address The 4-byte aligned address of the value to update atomically.
    Result: The result of the addition.
****************************************************************************************/
__shimcall__
INT32	OsAtomicAdd   (INT32 amount, INT32* address);


/****************************************************************************************
    OsAtomicIncrement function increments the value at the specified address by one and 
	returns the new value.
    Param: address The 4-byte aligned address of the value to update atomically.
    Result: The result of the increment.
****************************************************************************************/
__shimcall__
INT32	OsAtomicIncrement (INT32* address);


/****************************************************************************************
    OsAtomicDecrement function decrements the value at the specified address by one and 
	returns the new value.
    Param: address The 4-byte aligned address of the value to update atomically.
    Result: The result of the increment. 
****************************************************************************************/
__shimcall__
INT32	OsAtomicDecrement (INT32* address);


/****************************************************************************************


	Synchronisation objects


**********************************************************************************/


typedef struct tagHCRIT
{
	int dummy;

} *HCRIT;

/**********************************************************************************
Function name :	OsCriticalSectionCreate
Parameters :	None
Return value :	Handle to the created critical section to be passed as parameter for OS 
				functions acting on critical section. Returns NULL on failure.
functionality :	Creates an instance of a critical section. Returns NULL on failure
**********************************************************************************/
__shimcall__
GLOBAL HCRIT	OsCriticalSectionCreate(void);
/**********************************************************************************
Function name :	OsCriticalSectionDestroy
Parameters :	hMutex	-	Handle identifing the mutex.
Return value :	None
functionality : Destroys a mutex instance. Do not attemt to destroy a mutex while 
				it is acquired.
**********************************************************************************/
__shimcall__
GLOBAL	VOID	OsCriticalSectionDestroy(	IN	HCRIT			hMutex);

/**********************************************************************************
Function name :	OsCriticalSectionAcquire
Parameters :	hMutex	-	Handle identifing the mutex.
Return value :	None
functionality:	If the mutex is unowned, the calling run time becomes the owner
				If a run time  other than the calling run time owns the mutex, 
				the calling run time is blocked until the mutex  becomes unowned.  
				If the calling run time already owns the mutex, the run time continues 
				execution.

**********************************************************************************/
__shimcall__
GLOBAL	VOID	OsCriticalSectionAcquire(	IN	HCRIT			hMutex);

/**********************************************************************************
Function name :	OsCriticalSectionRelease
Parameters :	hMutex	-	Handle identifing the mutex.
Return value :	None
functionality:	A mutex is initially unowned, and the ownership count is zero.  For 
				each call to acquire, there must be a corresponding call to release.  
				Each time acquire is called, the ownership count  increments, and each 
				time release is called, the ownership count decrements.  Only the run time
				that owns a mutex may leave it.
				When the ownership count falls to zero, the mutex becomes unowned.  At 
				this point, a run time blocked by the mutex, with the highest priority 
				becomes schedulable.
**********************************************************************************/
__shimcall__
GLOBAL	VOID	OsCriticalSectionRelease(	IN	HCRIT			hMutex);

typedef struct tagHLOCK
{
	int dummy;

} *HLOCK;


/****************************************************************************************
    OsLockCreate 
    Allocates and initializes Lock object (CriticalSection, Semaphore, Mutex - 
    whatever you call it) that are general purpose blocking mutual exclusion locks

Parameters :	None
Return value :	Handle to the created Lock object to be passed as parameter for OS 
				functions acting on locks. Returns NULL on failure.
Interrupt safe: no
****************************************************************************************/
__shimcall__
HLOCK   OsLockCreate(void);


/****************************************************************************************
    OsLockDestroy
    Destroys Lock Object. Any blocked waiters will not be woken.
    Parameters :	hLock	-	Handle identifing the Lock object.

Return value :	None
Functionality : Destroys a critical instance. 
Interrupt safe: no
****************************************************************************************/
__shimcall__
void    OsLockDestroy(HLOCK hLock);


/****************************************************************************************
    OsLockLock
    If the lock is held by any thread, block waiting for its unlock. 
    This function may block and so should not be called from interrupt level. 
    Locking same object recursively from one thread may result in deadlock. 
    
Parameters :	hLock	-	Handle identifing the Lock object.
Return value :	None
Interrupt safe: no
****************************************************************************************/
__shimcall__
void	OsLockLock(HLOCK hLock);


/****************************************************************************************
    OsLockTry
    Lock if it is currently unlocked, and return true. 
    If the lock is held by any thread, return false.
    
Parameters :	hLock	-	Handle identifing the Lock object.
Return value :	None
Interrupt safe: no
****************************************************************************************/
__shimcall__
BOOL OsLockTry(HLOCK hLock);


/****************************************************************************************

    OsLockUnlock
    Unlock the Lock and wake any blocked waiters. 
    Results are undefined if the caller has not locked the Lock. 
    
Parameters :	hLock	-	Handle identifing the Lock object.
Return value :	None
Interrupt safe: no
****************************************************************************************/
__shimcall__
void	OsLockUnlock(HLOCK hLock);


/****************************************************************************************

    OsLockTryUnlock
    Tries to unlock the Lock and wake any blocked waiters. 
    Results are undefined if the caller has not locked the Lock. 
	Opposite to OsLockTry(). On some systems OsLockTry() and OsLockTryUnlock()
	would just exit if called from interrupt context.
    
Parameters :	hLock	-	Handle identifing the Lock object.
Return value :	None
Interrupt safe: no
****************************************************************************************/
__shimcall__
void	OsLockTryUnlock(HLOCK hLock);

typedef struct tagHINTERRUPT
{
	int dummy;

} *HINTERRUPT;


/****************************************************************************************
    OsInterruptsDisable
    Disable interrupts and preemption to synchronize between interrupt context and thread 
	context. Cannot be held across any blocking operation, and should be held for very 
	short periods.
    
Parameters :	None
Return value :	Handle to previous interrupt state
Interrupt safe: yes
****************************************************************************************/
__shimcall__
HINTERRUPT  OsInterruptsDisable(void);


/****************************************************************************************
    OsInterruptsRestore
    Restores preemption and interrupts to the state as they were when 
	OsInterruptsDisable() was called

Parameters :	Interrupt state handle
Interrupt safe: yes
****************************************************************************************/
__shimcall__
void        OsInterruptsRestore(HINTERRUPT hPreviousState);


/****************************************************************************************


	Memory/string operations


****************************************************************************************/

#if defined(__GNUC__) && defined(__i386__) && !defined(OS_NOSTRINGREDEFS) && !defined(_I386_STRING_H_)
#include <linux/string.h>
#undef OsMemSet
#define OsMemSet memset
#undef OsMemCpy
#define OsMemCpy memcpy
#undef OsMemMove
#define OsMemMove memmove
#undef OsMemCmp
#define OsMemCmp memcmp
#undef OsStrCpy
#define OsStrCpy strcpy
#undef OsStrnCpy
#define OsStrnCpy strncpy
#undef OsStrCat
#define OsStrCat strcat
#undef OsStrnCat
#define OsStrnCat strncat
#undef OsStrCmp
#define OsStrCmp strcmp
#undef OsStrnCmp
#define OsStrnCmp strncmp
#undef OsStrLen
#define OsStrLen strlen
#else
__shimcall__
PVOID   OsMemSet    (PVOID pBuf, UINT8 c, UINT32 Count);
__shimcall__
PVOID	OsMemCpy    (PVOID pDest, PVOID pSrc, UINT32 Count);
__shimcall__
PVOID	OsMemMove   (PVOID pDest, PVOID pSrc, UINT32 Count);
__shimcall__
int		OsMemCmp    (PVOID pBuff1, PVOID pBuff2, UINT32 Count);
__shimcall__

__shimcall__
PVOID	OsStrCpy    (LPSTR szDest, LPCSTR szSrc);
__shimcall__
PVOID	OsStrnCpy   (LPSTR szDest, LPCSTR szSrc, int MaxSize);
__shimcall__
LPSTR	OsStrCat    (LPSTR szDest, LPCSTR szSrc);
__shimcall__
LPSTR	OsStrnCat   (LPSTR szDest, LPCSTR szSrc, int MaxSize);
__shimcall__
int     OsStrCmp    (LPCSTR szStr1, LPCSTR szStr2);
__shimcall__
int     OsStrnCmp   (LPCSTR szStr1, LPCSTR szStr2, UINT32 Count);
__shimcall__
int	    OsStrLen    (LPCSTR szStr);
#endif
__shimcall__
int	    OsAtoi      (LPCSTR szStr);
__shimcall__
int	    OsToupper   (int c);
__shimcall__
int	    OsTolower   (int c);
__shimcall__
int	    OsIsDigit   (int c);
#ifndef TARGET_HCF_STARFISH_VXWORKS
#include <stdarg.h>
__shimcall__
int     OsSprintf   (LPSTR buffer, LPCSTR format, ...);
__shimcall__
int     OsVSprintf  (LPSTR buffer, LPCSTR format, va_list valist);
#else
#define OsSprintf sprintf
#define OsVSprintf vsprintf
#endif
typedef struct
{
	int dummy;
} *HOSTIMER;




/**********************************************************************************


	Misc utilities


**********************************************************************************/


/**********************************************************************************
Function name :	OsGetSystemTime
Parameters :	None
Return value :	returns timestamp in milliseconds
Functionality	The function returnes a milliseconds timestamp.
Interrupt safe: yes
**********************************************************************************/
__shimcall__
UINT32	OsGetSystemTime(void);


/**********************************************************************************
Function name :	OsSleep
Parameters :	Time in milliseconds to put the thread to sleep
Return value :	None
Functionality	Put the executing thread to sleep
Interrupt safe: no
**********************************************************************************/
__shimcall__
void	OsSleep (UINT32 sleepTime);


/**********************************************************************************
Function name :	OsGetCurrentThread
Parameters :	None
Return value :	Thread ID of the active thread
Functionality:	Returns thread ID of the thread running the code
Interrupt safe: no
**********************************************************************************/
#if ( OS_TYPE == OS_MACOSX )
#define HTHREAD     HANDLE
#else
typedef struct tagHTHREAD
{
	int dummy;

} *HTHREAD;
#endif

__shimcall__
HTHREAD OsGetCurrentThread(void);

/**********************************************************************************
Function name :	OsCallOnMyStack
Parameters :	pFunc			-	function to be called
				lParam			-	parameter to pass for pFunc
				pTopOfStack		-	Pointer to stack
				StackSizeBytes	-	stack size in bytes.
Return value :	None
Functionality :	Temporarily switches a stack to a different locked block of memory.
				This function is intended to be used in an environment with limited
				stack size given to an interrupt service routine. 
Interrupt safe: yes
**********************************************************************************/
#if (OS_TYPE != OS_LINUX)
void	OsCallOnMyStack	(	IN	PCBFUNC	pFunc, 
							IN	UINT32	lParam, 
							IN	PUINT32	pTopOfStack, 
							IN	UINT32	StackSizeBytes);
#else
#define OsCallOnMyStack(pFunc, lParam, pTopOfStack, StackSizeBytes) (pFunc)((PVOID)(lParam))
#endif





/****************************************************************************************


	Timer


****************************************************************************************/


/**********************************************************************************
Function name :	OsCreatePeriodicTimeOut
Parameters :	InitialTimeOut		- initial interval in milliseconds 
									  between 2 timeout callbacks
				pTimeOutCallBack	- Pointer to a fucntion that will be called at 
									  the specified interval
				pRefData			- Reference Data to be passed to callback 
									  function
Return value :	Returns a handle to the periodic timeout. This handle is to be
				passed to OS functions acting on periodic timeout. Returns NULL
				on failure.
Functionality :	Creates a periodic timeout of InitialTimeOut interval. 
				pTimeOutCallBack function will be called on each timer interval. 
Interrupt safe: no
**********************************************************************************/
__shimcall__
HOSTIMER	OsCreatePeriodicTimer	(	IN	UINT32			InitialTimeOut,
										IN	PCBFUNC			pTimeOutCallBack,
										IN	PALLOC_FUNC		pFuncAlloc,
										IN	PFREE_FUNC		pFuncFree,
										IN	PVOID			pRefData,
										OUT	HTHREAD*		pThreadId);


/**********************************************************************************
Function name :	OsDestroyPeriodicTimeOut
Parameters :	hTimeOut -	Handle to the periodic time out returned by 
							OsCreatePeriodicTimeOut.
Return value :	none
Functionality : destroys a periodic timeout resource.
Interrupt safe: no
**********************************************************************************/
__shimcall__
void	OsDestroyPeriodicTimer	(IN	HOSTIMER	hTimeOut);


/**********************************************************************************
Function name :	OsSetPeriodicTimeOut
Parameters :	hTimeOut	-	Handle to the periodic timeout
				NewTimeOut	-	New timeout interval
Return value :	returns TRUE when the timeout interval was successfully changed to 
				NewTimeOut
Functionality : resets the timeout inteval to a new value.
Interrupt safe: no
**********************************************************************************/
__shimcall__
BOOL	OsSetPeriodicTimer	(	IN	HOSTIMER	hTimeOut,
								IN	UINT32		NewTimeOut);


/**********************************************************************************
Function name :	OsImmediateTimeOut
Parameters :	hTimeOut	-	Handle to the periodic timeout
Return value :	none
Functionality : Schedules call of the callback function as soon as non-interrupt
				context becomes available.
Interrupt safe: yes
**********************************************************************************/
__shimcall__
void    OsImmediateTimeOut	(IN	HOSTIMER	hTimeOut);



/**********************************************************************************


	Debug utilities


**********************************************************************************/


__shimcall__
void    OsRawVPrintf       (LPCSTR szFormat, PVOID args, BOOL addnl);

__shimcall__
void    OsRawNLPrintf       (LPCSTR szFormat, ...)
#ifdef __GNUC__
	__attribute__ ((format (printf, 1, 2)))
#endif
	;

__shimcall__
void    OsRawPrintf       (LPCSTR szFormat, ...)
#ifdef __GNUC__
	__attribute__ ((format (printf, 1, 2)))
#endif
	;

__shimcall__
void    OsErrorVPrintf       (LPCSTR szFormat, PVOID args);

__shimcall__
void    OsErrorPrintf       (LPCSTR szFormat, ...)
#ifdef __GNUC__
	__attribute__ ((format (printf, 1, 2)))
#endif
	;

__shimcall__
void    OsDebugVPrintf       (LPCSTR szFormat, PVOID args);

__shimcall__
void    OsDebugPrintf       (LPCSTR szFormat, ...)
#ifdef __GNUC__
	__attribute__ ((format (printf, 1, 2)))
#endif
	;

__shimcall__
void    OsDebugBreakpoint   (LPCSTR szMsg );

/*void    OsDebugDumpData(PUINT8 data, UINT32 len);*/


#define OsSwapUINT16(x) ((((x) & 0xFF00) >> 8) | (((x) & 0x00FF) << 8))
#define OsSwapUINT32(x) ((OsSwapUINT16(x) << 16) | (OsSwapUINT16((x) >> 16)))

//Event handling functions
typedef struct tagHOSEVENT
{
    void *dummy;
} OSEVENT, *HOSEVENT;

typedef enum OSEVENT_WAIT_RESULT_ENUM
{
    OSEVENT_WAIT_OK,
    OSEVENT_WAIT_TIMEOUT,
    OSEVENT_WAIT_ERROR
} OSEVENT_WAIT_RESULT;


__shimcall__ HOSEVENT OsEventCreate(const char* name);
__shimcall__ void OsEventDestroy(HOSEVENT hEvent);
__shimcall__ void OsEventInit(HOSEVENT hEvent, const char* name);
__shimcall__ long OsEventSet(HOSEVENT hEvent);
__shimcall__ long OsEventClear(HOSEVENT hEvent);
__shimcall__ long OsEventState(HOSEVENT hEvent);
__shimcall__ void OsEventWait(HOSEVENT hEvent);
__shimcall__ OSEVENT_WAIT_RESULT OsEventWaitTime(HOSEVENT hEvent, UINT32 timeout);

__shimcall__
void    OsErrorPrintf       ( LPCSTR szFormat, ...);


/**********************************************************************************
Function name :	OsFloatPrefix
Parameters :	None
Return value :	None
functionality :	Treats the FPU in order to enable float operations.
**********************************************************************************/
__shimcall__
GLOBAL	int  OsFloatPrefix(void);

/**********************************************************************************
Function name :	OsFloatPrefix
Parameters :	None
Return value :	None
functionality :	Restores the FPU after float operations.
**********************************************************************************/
__shimcall__
GLOBAL	BOOL  OsFloatSuffix(int Id);



__shimcall__
HANDLE OsCreateTimer(UINT32 msec, PVOID pCBFunc, PVOID pRefData);
__shimcall__
void OsSetTimer(PVOID pTimer);
__shimcall__
void OsCancelTimer(PVOID Timer);
__shimcall__
void OsChangeTimerTimeOut(PVOID Timer, UINT32 msec);
__shimcall__
void OsDestroyTimer(PVOID pTimer);

#if (OS_TYPE == OS_LINUX)
__shimcall__
GLOBAL	DWORD  OsGetProcessorFreq(void);
#define GlobalProcessorFreq OsGetProcessorFreq()

__shimcall__
UINT32 OsReadCpuCnt(void);

typedef struct _OSTHRD OSTHRD, *POSTHRD;

__shimcall__
POSTHRD OsThreadCreate(const char *name, BOOLEAN highestprio, int *pid);

__shimcall__
void OsThreadDestroy(POSTHRD osthrd);

typedef struct tagHOSSCHED
{
	unsigned char dummy[8*sizeof(PVOID)];

} OSSCHED, *HOSSCHED;

__shimcall__
void OsThreadScheduleInit(HOSSCHED hWorkStorage, __kernelcall__ void (*func)(void *), void * data);

__shimcall__
int OsThreadSchedule(POSTHRD osthrd, HOSSCHED hWorkStorage);

__shimcall__
void
OsThreadScheduleDone(void);

__shimcall__
int
OsForkWait(char *program_path, char *argv[], char *envp[]);

__shimcall__
BOOL
OsKernelUsesRegParm(void);

extern POSTHRD OsMdmThread;

#endif

#ifdef __cplusplus
}
#endif

#endif      /* #ifndef __OSSERVICES_H__ */
