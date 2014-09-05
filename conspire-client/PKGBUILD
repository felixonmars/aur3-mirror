# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: JD Horelick <jdhore1@gmail.com>

_pkgname=conspire
pkgname=conspire-client
pkgver=1.0.1
pkgrel=1
pkgdesc="advanced, lightweight IRC client for UNIX"
arch=('i686' 'x86_64')
url="https://github.com/kaniini/conspire"
license=('GPL')
depends=('gtk2' 'libmowgli' 'dbus-glib' 'gnutls' 'libnotify' 'libsexy')
makedepends=('pkgconfig')
optdepends=('python2: Python plugin')
source=("https://github.com/kaniini/conspire/archive/conspire-1.0.1.tar.gz")
md5sums=('583d3b29d1403403d49e11dc3d58b8b0')


build() {
  # No joke...
  cd $srcdir/$_pkgname-$_pkgname-$pkgver

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$_pkgname-$pkgver

  make DESTDIR=$pkgdir install
}
