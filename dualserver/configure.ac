#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.69])
AC_INIT([dualserverd], [7.23], [achaldhir@gmail.com])
AM_INIT_AUTOMAKE

AC_CONFIG_SRCDIR([dualserverd.h])
AC_CONFIG_HEADERS([config.h])
AC_CONFIG_FILES([Makefile])

# Checks for programs.
AC_PROG_CXX

# Checks for libraries.

# Checks for header files.
AC_CHECK_HEADERS([arpa/inet.h fcntl.h limits.h memory.h netdb.h netinet/in.h stdlib.h sys/ioctl.h sys/socket.h syslog.h unistd.h])
AC_CHECK_LIB(pthread, pthread_create)

# Checks for typedefs, structures, and compiler characteristics.
AC_CHECK_HEADER_STDBOOL
AC_TYPE_PID_T

# Checks for library functions.
AC_FUNC_FORK
AC_CHECK_FUNCS([gethostname inet_ntoa memset pow select socket strcasecmp strchr strerror strncasecmp strrchr strstr])

AC_OUTPUT
