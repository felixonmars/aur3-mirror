# Contributor: ice-man <icemanf@gmail.com>
pkgname=netcat-crypto
pkgver=1.10
pkgrel=1
pkgdesc="The network swiss army knife with ipv6 and crypto support"
url="http://www.securityfocus.com/data/tools/nc110.tgz"
provides=('netcat')
conflicts=('netcat')
makedepends=('glibc' 'gcc' 'make')
depends=('libmix')
source=('http://www.securityfocus.com/data/tools/nc110.tgz'
	'ftp://sith.mimuw.edu.pl/pub/users/baggins/IPv6/nc-v6-20000918.patch.gz'
	'netcat-110-patches-1.0.tar.bz2')
md5sums=('402632f2fe01c169ff19a0ad6e9d608c' '84d850745dd860aedce64b518e0e3330' 'd2ae47e06e13a824c0dbe555d56ba7cd')

build() {
  # Build options
  export XLIBS="-lmix"
  export XFLAGS="-DLINUX -DTELNET -DINET6 -DAESCRYPT -DGAPING_SECURITY_HOLE"

  cd $startdir/src
  
  echo -e "\nPATCHING THE SOURCE\n-------------------------------"
  # ipv6 support
  patch -p1 < nc-v6-20000918.patch > /dev/null
  echo "nc-v6-20000918.patch applied"
  
  # Other patches
  bzcat ./patch/00_all_unstripped.patch.bz2 | patch -p1 > /dev/null
  echo "00_all_unstripped.patch applied"
  bzcat ./patch/01_all_glibc_resolv_h.patch.bz2 | patch -p1 > /dev/null
  echo "01_all_glibc_resolv_h.patch applied"
  bzcat ./patch/02_all_arm_timer.patch.bz2 | patch -p1 > /dev/null
  echo "02_all_arm_timer.patch applied"
  bzcat ./patch/03_all_posix_setjmp.patch.bz2 | patch -p1 > /dev/null
  echo "03_all_posix_setjmp.patch applied"
  bzcat ./patch/10_all_nopunt.patch.bz2 | patch -p1 > /dev/null
  echo "10_all_nopunt.patch applied"
  bzcat ./patch/11_all_nosleep.patch.bz2 | patch -p1 > /dev/null
  echo "11_all_nosleep.patch applied"
  bzcat ./patch/12_all_single_verbose_ipv6.patch.bz2 | patch -p1 > /dev/null
  echo "12_all_single_verbose_ipv6.patch applied"
  bzcat ./patch/13_all_use_getservbyport.patch.bz2 | patch -p1 > /dev/null
  echo "13_all_use_getservbyport.patch applied"
  bzcat ./patch/14_all_read_overflow.patch.bz2 | patch -p1 > /dev/null
  echo "14_all_read_overflow.patch applied"
  bzcat ./patch/15_all_help_write_to_stdout.patch.bz2 | patch -p0 > /dev/null
  echo "15_all_help_write_to_stdout.patch applied"
  bzcat ./patch/20_all_inet_aton.patch.bz2 | patch -p1 > /dev/null
  echo "20_all_inet_aton.patch applied"
  bzcat ./patch/21_all_udp_broadcast_ipv6.patch.bz2 | patch -p1 > /dev/null
  echo "21_all_udp_broadcast_ipv6.patch applied"
  bzcat ./patch/22_all_quit_ipv6.patch.bz2 | patch -p1 > /dev/null
  echo "22_all_quit_ipv6.patch applied"
  bzcat ./patch/23_all_dash_port.patch.bz2 | patch -p1 > /dev/null
  echo "23_all_dash_port.patch applied"
  bzcat ./patch/24_all_sh_c.patch.bz2 | patch -p1 > /dev/null
  echo "24_all_sh_c.patch applied"
  bzcat ./patch/50_all_aes_crypto.patch.bz2 | patch -p1 > /dev/null
  echo "50_all_aes_crypto.patch applied"

  echo -e "\nSOURCE PATCHED!\n\n"

  cp netcat.c netcat.c.orig
  sed 's/res_init();//' netcat.c.orig >netcat.c
  sed -i 's:#define HAVE_BIND:#undef HAVE_BIND:' netcat.c
  sed -i 's:#define FD_SETSIZE 16:#define FD_SETSIZE 1024:' netcat.c

  make -e CC="/usr/bin/gcc ${CFLAGS}" nc || return 1
  mkdir -p $startdir/pkg/usr/bin
  mkdir -p $startdir/pkg/usr/share/man/man1
  cp nc $startdir/pkg/usr/bin
  gzip nc.1
  cp nc.1.gz $startdir/pkg/usr/share/man/man1
}
