# Maintainer: Andre Bartke <dev@bartke.cc>

_pkgname=gdb
_target="sparc-linux"
 
pkgname=cross-${_target}-${_pkgname}
pkgver=7.5.1
pkgrel=1
pkgdesc="The Gnu Debugger for sparc targets (multilib)"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/gdb/"
license=('GPL')
depends=('zlib')
options=('!libtool' '!distcc' '!ccache')
install=$pkgname.install
source=("ftp://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.bz2")
 
build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  rm -rf build
  mkdir build && cd build

  ../configure --prefix=/usr \
    --target=${_target} \
    --enable-shared \
    --enable-multilib \
    --enable-interwork \
    --disable-nls \
    --with-system-readline

  make || return 1
}
 
package() {
  cd ${srcdir}/${_pkgname}-${pkgver}/build
  make DESTDIR=${pkgdir} install || return 1

  msg "Cleaning-up package tree..."
  rm -rf ${pkgdir}/usr/share/{info,man,gdb}
  rm -rf ${pkgdir}/usr/include/gdb
  rm -f  ${pkgdir}/usr/include/{bfd,dis-asm,symcat,ansidecl,bfdlink}.h
  rm -f  ${pkgdir}/usr/lib/{libiberty,libbfd,libopcodes}.a
}

md5sums=('3f48f468b24447cf24820054ff6e85b1')
