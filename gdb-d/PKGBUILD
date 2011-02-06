# Maintainer: MrSunshine
pkgname=gdb-d
pkgver=6.8
pkgrel=1
pkgdesc="The GNU Debugger With D support"
arch=(i686 x86_64)
url="http://sources.redhat.com/gdb/"
depends=('ncurses' 'expat')
options=('!libtool')
license=('GPL3')
conflicts=('gdb')
makedepends=('gcc' 'subversion')
install=gdb.install
source=(http://ftp.gnu.org/gnu/gdb/gdb-${pkgver}.tar.bz2)
md5sums=('c9da266b884fb8fa54df786dfaadbc7a')

build() {
  svn co http://svn.dsource.org/projects/gdb-patches/downloads/gdb6.8/ gdb-patches
  cd ${startdir}/src/gdb-${pkgver}
  patch -t -N -p1 -i ${startdir}/src/gdb-patches/gdb-6.8-d-1.patch || return 1

  ./configure --prefix=/usr --disable-nls --mandir=/usr/share/man \
      --infodir=/usr/share/info
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  rm -f ${pkgdir}/usr/share/info/dir
  # resolve conflicts with binutils
  rm -f ${startdir}/pkg/usr/include/{bfd,dis-asm,symcat,ansidecl,bfdlink}.h
  rm -f ${startdir}/pkg/usr/lib/{libiberty,libbfd,libopcodes}.a
  rm -f ${startdir}/pkg/usr/share/info/{bfd.info,configure.info,standards.info}
}
