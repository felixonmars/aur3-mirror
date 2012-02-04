# Maintainer : SpepS <dreamspepser at yahoo dot it>

_pkg=xvattr
pkgname=g$_pkg
pkgver=1.3
pkgrel=1
pkgdesc="Adjust attributes associated with the Xv extension to XFree86. Gtk version."
arch=('i686' 'x86_64')
url="http://www.dtek.chalmers.se/~dvd/"
license=('GPL')
depends=('libxv' 'gtk')
makedepends=('libsm')
source=("ftp://ftp.eenet.ee/pub/FreeBSD/distfiles/xvattr-1.3.tar.gz")
#source=("ftp://ftp.li.kernel.org/gentoo/distfiles/xvattr-1.3.tar.gz")
#source=("http://www.dtek.chalmers.se/~dvd/dist/${pkgname}-${pkgver}.tar.gz") --> Gone
md5sums=('041e0d1f2ebce216e69e08ce78ec2ceb')

build() {
  cd "$srcdir/$_pkg-$pkgver"

  ./configure --prefix=/usr \
              --mandir=/usr/share/man
  make
}

package() {
  cd "$srcdir/$_pkg-$pkgver"

  make DESTDIR="$pkgdir/" install

  # remove unneeded files
  rm -rf "$pkgdir/usr/share" "$pkgdir/usr/bin/$_pkg"
}
