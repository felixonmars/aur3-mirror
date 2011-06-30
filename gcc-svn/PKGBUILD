# Copyright 2009 Michael F. Witten

# This file is part of the gcc-svn PKGBUILD system.
# 
# The gcc-svn PKGBUILD system is free software: you can redistribute it
# and/or modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
# 
# The gcc-svn PKGBUILD system is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty
# of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with the gcc-svn PKGBUILD system.  If not, see
# <http://www.gnu.org/licenses/>.

# Maintainer/Author : Michael Witten <mfwitten>

source PKGBUILD_tools

###############
#### Intro ####
###############

# This PKGBUILD is designed to be highly flexible: customizable,
# extensible, comprehensible, and all of that good stuff that
# programmers (including me) like to pretend they have achieved.
# 
# In the best scenario, you can just play around with the options
# in the `Config' section of this file; if you feel the need to
# add extra bells and whistles, then familiarize yourself with
# the supplementary file `PKGBUILD_tools' and try to work within
# the framework/conventions that it showcases, so that you can
# easily share your modifications.
#
# An interesting point to note is that every package dependency
# is listed with an exact version number (sans package release).
# This is because [it is my opinion that the] relationships between
# packages are generally brittle; it is better to be forced to
# confront explicitly any change that occurs in the dependencies.
# 
# This policy may turn out to be more of a burden than anticipated,
# but the hope is that any such burden is outweighed by stronger
# guarantees of reliability.
#
# NOTE: You'll likely need to set LD_LIBRARY_PATH in order to run
# programs built with the compilers installed by this package.
# Use something like this:
#
#   LD_LIBRARY_PATH=$install_prefix/lib path/to/executable

################
#### Config ####
################

# These `options' have three states:
#
#   * On      : _with_*
#
#   * Off     : _without_*
#
#   * Default : neither _with_* nor _without_* specififed;
#               either on or off will be selected implicitly
#               in some way (perhaps comments should specify)
#
# However, not all such _with_* and _without_* options
# have been defined; you may need to write one yourself
# (they are just bash functions in PKGBUILD_tools).

# Various phases of the build
#
# If you're hacking on the code, you should probably
# turn-off (that is, comment-out) at least the `clean',
# `config, and `test' phases:

  _with_phase_source HEAD               # the revision you want
  _with_phase_clean
  _with_phase_config
  _with_phase_compile
  _with_phase_test                      # introduces extra makedepends
  _with_phase_install

# Set your makepkg `options' array here:

  options=('!libtool' '!strip')

# The Graphite loop optimizations:

  _with_graphite_loops

# texinfo documentation:

  _with_docs_info

# PDF documentation:

  #_with_docs_pdf

# DVI documentation (currently this is unsupported, because
# the gcc Makefiles provide no rule for installing DVI docs;
# if ever such a rule exists, the necessary DVI code is already
# written and just needs to be uncommented in PKGBUILD_tools):
#
#  #_with_docs_dvi

# HTML documentation:

  #_with_docs_html

# A custom installation prefix:

  _with_prefix /usr/local

# Name transformations on binaries:

  #_with_program_prefix prefix
  _with_program_suffix -svn
  #_with_program_transform_name sed_substitution

# /etc/profile.d script for setting paths in environment
# variables (PATH, etc.):

  _with_append_paths_script
  #_with_prepend_paths_script

# Only the libraries for the native architecture:

  _without_multilib

# Kind of threading support:

  _with_threads posix

# Build compilers/libraries for these specific languages
# (each needs a setup function in PKGBUILD_tools):

  _with_language c c++

# The gnu_unique_object relocation for C++ template static data
# members and inline function local statics:

  _with_gnu_unique_object

# Link-time optimization (using libelf):

  _with_lto

# Ignore warnings while building gcc:

  #_without_error_on_warning

# By default, a native toolchain is built during a 3-stage boostrapping
# process; uncomment one of the following to select a variation on that
# bootstrapping process:
# longer needed:

   # Save storage by removing stage{1,2} object files when they are no
   # no longer required:
   #_with_bootstrap_lean

   # Use profile information to optimize the final product:
   #_with_bootstrap_profiled

# Ignore warnings during the test phase (the default is to ask
# whether to continue; the test phase pretty much always fails):

  _with_ignore_phase_test_failure

# Non-default GCC flags when compiling the stage2 and stage3 compilers.
# For example: By default, each stage's *executables* are built with
# debugging information which occupies a significant amount of disk space.
# The following would override this default and cut the space required by
# about 40% (as the docs claim), but debugging may be more difficult
# (libraries will still be built with debugging symbols):

  #_with_boot_cflags -O

# A build config for additional customization
# (see http://gcc.gnu.org/install/build.html):

  #_with_build_config bootstrap-debug bootstrap-debug-big

##############################################################################

##################
#### PKGBUILD ####
##################

pkgname=gcc-svn
pkgver=174895
pkgrel=2
pkgdesc='The GNU Compiler Collection (SVN Version); the latest PKGBUILD has not been tested.'
arch=(i686 x86_64)
license=(GPL3 LGPL)
url=http://gcc.gnu.org

source=(PKGBUILD_tools COPYING)
md5sums=(0e0f2ac20566e2b0f6e9189f1225bd02 d32239bcb673463ab874e80d47fae504)

_pkgbuild_setup_makedepends
_pkgbuild_setup_depends

build() { _pkgbuild_build; } # tomfoolery to appease aur.archlinux.org's attempt to be useful
