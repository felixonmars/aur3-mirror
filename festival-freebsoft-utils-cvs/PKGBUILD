# Contributor: Chris Brannon <cmbrannon@cox.net
pkgname=festival-freebsoft-utils-cvs
pkgver=20090405
pkgrel=1
pkgdesc='Utilities that allow Speech Dispatcher to use the Festival TTS system'
url="http://www.freebsoft.org/festival-freebsoft-utils"
arch=('i686' 'x86_64')
license=('GPL' 'FDL')
depends=('festival')
provides=('festival-freebsoft-utils')
conflicts=('festival-freebsoft-utils')
makedepends=('cvs')
install=$pkgname.install
source=()
md5sums=()
_cvsroot=":pserver:anonymous:@cvs.freebsoft.org:/var/lib/cvs"
_cvsmod="festival-freebsoft-utils"

build() {
  cd ${srcdir}

  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make."
  make || return 1
  msg "Copying sources and docs to the package's directory."
  install -o root -g root -m0755 -d ${pkgdir}/usr/share/festival || return 1
  install -o root -g root -m0755 -d ${pkgdir}/usr/share/info || return 1
  install -o root -g root -m0644 *.scm ${pkgdir}/usr/share/festival || return 1
  install -o root -g root -m0644 doc/*.info ${pkgdir}/usr/share/info || return 1
  gzip -9nf ${pkgdir}/usr/share/info/*.info
}
