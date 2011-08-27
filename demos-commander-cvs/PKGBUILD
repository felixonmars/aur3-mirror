# Contributor: Vladimir Navrat < vn158 (at) seznam (dot) cz >
pkgname=demos-commander-cvs
pkgver=20100531
pkgrel=1
pkgdesc="Demos Commander (deco) is an Orthodox File Manager, Norton Commander clone."
arch=('i686' 'x86_64')
url="http://deco.sourceforge.net"
license=('GPL')
provides=('demos-commander')
conflicts=('demos-commander')
depends=('ncurses')
makedepends=('automake' 'cvs')
source=()
md5sums=()

_cvsmod="deco"
_cvsroot=":pserver:anonymous@deco.cvs.sourceforge.net:/cvsroot/deco"

build() {
  cd ${srcdir}
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  cvs -z3 -d $_cvsroot co -D $pkgver -P $_cvsmod
  msg "CVS checkout done or server timeout"
  msg "Starting make..."
  cd ./$_cvsmod

  cd ${srcdir}/deco
  ./configure --prefix=/usr || return 1
  make || return 1
  sed -i 's/^prefix.*=\ */prefix=${pkgdir}/' Makefile || return 1
  install -d ${pkgdir}/usr/bin ${pkgdir}/usr/lib ${pkgdir}/usr/share/man/man1
  export pkgdir ; make install || return 1
}

