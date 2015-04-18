# Maintainer: Zeph <zeph33@gmail.com>

pkgname=python2-nemo
_commit=6a5c8031e2f1b93cfd5705977bb824d1c65cc568
pkgver=2.4.1
pkgrel=1
pkgdesc="Python bindings for the Nemo Extension API"
arch=('any')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL')
depends=('nemo' 'python2-gobject')
makedepends=('gtk-doc>=1.0', 'gnome-common>=2.3.0')
options=('!libtool')

source=(https://github.com/linuxmint/nemo-extensions/archive/$_commit.tar.gz)
md5sums=('3ea0630cb73afdc905c146a1094f707d')

build() {
  cd "$srcdir/nemo-extensions-$_commit/nemo-python"

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static \
              PYTHON=python2
  make
}

package() {
  cd "$srcdir/nemo-extensions-$_commit/nemo-python"

  make DESTDIR="$pkgdir/" install
}

