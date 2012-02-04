# Contributor: Sam Mulvey <sam@tacomatelematics.com>
# Contributor: Jonathan Liu <net147@hotmail.com>
pkgname=libresample-asterisk
pkgver=122
pkgrel=1

_svntrunk="http://svn.asterisk.org/svn/thirdparty/libresample/trunk"
_svnmod="libresample"

pkgdesc="A real-time library for audio sampling rate conversion, from the Asterisk SVN repository."
arch=(i686 x86_64)
url="http://ccrma.stanford.edu/~jos/resample/Free_Resampling_Software.html"
license=('LGPL2')
source=()
makedepends=('subversion')
conflicts=('libresample')
provides=('libresample')

build() {
  cd "$srcdir"
  mkdir -p ~/.subversion
  svn co $_svntrunk $_svnmod
  cd $_svnmod

  ./configure --prefix=/usr
  make libresample.a || return 1
  install -D -m644 "$srcdir/$_svnmod/include/libresample.h" "$pkgdir/usr/include/libresample.h"
  install -D -m644 "$srcdir/$_svnmod/libresample.a" "$pkgdir/usr/lib/libresample.a"
}

# vim:set ts=2 sw=2 et:
