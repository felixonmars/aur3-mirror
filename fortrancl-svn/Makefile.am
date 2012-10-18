## Process this file with automake to produce Makefile.in

## Copyright (C) 2011 X. Andrade <xavier@tddft.org>
## 
## FortranCL is free software: you can redistribute it and/or modify
## it under the terms of the GNU Lesser General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## FortranCL is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU Lesser General Public License for more details.
##
## You should have received a copy of the GNU Lesser General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.
##
## $Id$

if F90_MOD_UPPERCASE
  LIBFUNCMOD = CL.@ax_cv_f90_modext@
  CL_BUFFER_M.@ax_cv_f90_modext@   \
  CL_COMMAND_QUEUE_M.@ax_cv_f90_modext@\
  CL_CONSTANTS_M.@ax_cv_f90_modext@\
  CL_CONTEXT_M.@ax_cv_f90_modext@\
  CL_DEVICE_M.@ax_cv_f90_modext@\
  CL_EVENT_M.@ax_cv_f90_modext@\
  CL_KERNEL_M.@ax_cv_f90_modext@\
  CL_PLATFORM_M.@ax_cv_f90_modext@\
  CL_PROGRAM_M.@ax_cv_f90_modext@\
  CL_TYPES_M.@ax_cv_f90_modext@

else
  LIBFUNCMOD = cl.@ax_cv_f90_modext@ \
  cl_buffer_m.@ax_cv_f90_modext@   \
  cl_command_queue_m.@ax_cv_f90_modext@\
  cl_constants_m.@ax_cv_f90_modext@\
  cl_context_m.@ax_cv_f90_modext@\
  cl_device_m.@ax_cv_f90_modext@\
  cl_event_m.@ax_cv_f90_modext@\
  cl_kernel_m.@ax_cv_f90_modext@\
  cl_platform_m.@ax_cv_f90_modext@\
  cl_program_m.@ax_cv_f90_modext@\
  cl_types_m.@ax_cv_f90_modext@
endif

AM_CFLAGS= @CL_CFLAGS@

fortrancl_includedir = $(includedir)
nodist_fortrancl_include_HEADERS = $(LIBFUNCMOD)

lib_LTLIBRARIES = libfortrancl.la

libfortrancl_la_SOURCES =       \
	cl_types.f90           \
	cl_buffer.f90          \
	cl_command_queue.f90   \
	cl_constants.f90       \
	cl_context.f90         \
	cl_device.f90          \
	cl_kernel.f90          \
	cl_platform.f90        \
	cl_program.f90         \
	cl_event.f90           \
	cl.f90

libfortrancl_la_SOURCES +=           \
	utils.c                      \
	cl_buffer_low.c              \
	cl_command_queue_low.c       \
	cl_context_low.c             \
	cl_device_low.c              \
	cl_kernel_low.c              \
	cl_platform_low.c            \
	cl_program_low.c             \
	cl_event_low.c

noinst_HEADERS =               \
	string_f.h             \
	localcl.h

$(LIBFUNCMOD):   cl.lo

cl_types.lo     : cl_types.f90 
cl_constants.lo : cl_constants.f90
cl_platform.lo  : cl_platform.f90 cl_types.lo 
cl_program.lo   : cl_program.f90 cl_types.lo 
cl_kernel.lo    : cl_kernel.f90 cl_types.lo 
cl_device.lo    : cl_device.f90 cl_types.lo 
cl_context.lo   : cl_context.f90 cl_types.lo 
cl_command_queue.lo : cl_command_queue.f90 cl_types.lo 
cl_buffer.lo    : cl_buffer.f90  cl_types.lo 
cl.lo : cl.f90 cl_constants.lo cl_types.lo cl_device.lo cl_kernel.lo cl_program.lo cl_platform.lo cl_context.lo cl_command_queue.lo cl_buffer.lo

CLEANFILES = *~ *.bak *.mod *.MOD *.il *.d *.pc* ifc*
