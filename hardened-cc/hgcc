#!/bin/dash
# At least its not perl..

# Enable/disable here, don't touch unless you know what you are doing.
hcc_force_stack=1
#hcc_force_stack_all=1
hcc_force_fortify=1
#hcc_force_format=1
hcc_force_fPIE=1
hcc_force_bindnow=1
#hcc_force_trampolines=1
#hcc_force_noexec=1
#hcc_force_unstrict=1
#hcc_force_nullptr=1

# Don't touch:
hcc_linking=1

for opt; do
  case "$opt" in
    -fno-PIC|-fno-pic|-fno-PIE|-fno-pie|-nopie|-static|-shared|-D__KERNEL__|-nostdlib|-nostartfiles)
      unset hcc_force_fPIE;;
    -fPIC|-fpic)
      unset hcc_force_fPIE;;
    -c)
      unset hcc_linking;;
    -D_FORTIFY_SOURCE=[0-1])
      unset hcc_force_fortify;;
    -fno-stack-protector|-fno-stack-protector-all|-nostdlib|-ffreestanding)
      unset hcc_force_stack;
      unset hcc_force_stack_all;;
  esac
done

# Use relro unconditionally.
# -Wl,-z,now: This affects only the *startup* time because the dynamic linker has to do more work - 
# but according to Kees Cook overhead of BIND_NOW is negligible nowadays even with huge applications.
if [ $hcc_linking ]; then
  hcc_link_relro="-Wl,-z,relro"
  if [ $hcc_force_bindnow ]; then
    hcc_link_bindnow="-Wl,--hash-style=gnu -Wl,-z,now"
  fi
  if [ $hcc_force_fPIE ]; then
    hcc_link_pie="-pie" # See Line 86.
  fi
fi

# Lightweight SSP is default in Arch Linux CFLAGS, useful for builds that ignore them:
if [ $hcc_force_stack ]; then
  hcc_ssp='-fstack-protector --param=ssp-buffer-size=4'
  if [ $hcc_force_stack_all ]; then
    hcc_ssp='-fstack-protector-all' # This is the heavyweight version of SSP, usually considered too costly.
  fi
fi

# Is default in Arch Linux CFLAGS, useful for builds that ignore them:
# XXX: Might need to disable under some conditions.
if [ $hcc_force_fortify ]; then
  hcc_fortify='-D_FORTIFY_SOURCE=2'
fi
 
# Warnings often erroneous, breaks quite a few builds due to -Werror. 
if [ $hcc_force_format ]; then
  hcc_format='-Wformat -Wformat-security -Werror=format-security'
fi

# OpenBSD default? You may or may not want this, read the description.
if [ $hcc_force_unstrict ]; then
  hcc_unstrict='-fno-strict-aliasing -fno-strict-overflow'
fi

# You should really know why you want to break the build when encountering trampolines.
if [ $hcc_force_trampolines ]; then
  hcc_trampolines='-Wtrampolines -Werror=trampolines'
fi

# Available for completeness. Don't use nless you KNOW you need this.
if [ $hcc_force_nullptr ]; then
  hcc_nullptr='-fno-delete-null-pointer-checks'
fi

# Required for OpenSSL etc. to work on SELinux/grsec due to assembler code not having the right progbits.
if [ $hcc_force_noexec ]; then
  hcc_noexec='-Wa,--noexecstack'
fi

# Automatic PIE handling is pretty much the whole purpose of this wrapper; Acceptable overhead on 64bit.
if [ $hcc_force_fPIE ]; then
  hcc_fpie='-DPIC -fPIE'
fi

hcc_linkerflags="$hcc_link_pie $hcc_link_relro $hcc_link_bindnow"

exec /usr/bin/gcc $hcc_fpie $hcc_noexec $hcc_ssp $hcc_fortify $hcc_unstrict $hcc_format $hcc_trampolines $hcc_nullptr "${1+"$@"}" $hcc_linkerflags
