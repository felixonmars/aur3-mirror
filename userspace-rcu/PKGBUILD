# Maintainer: Jan Krcmar <honza801@gmail.com>
pkgname="userspace-rcu"
pkgver="0.6.7"
pkgrel="1"
pkgdesc="Userspace RCU Implementation"
arch=("i686")
url="http://lttng.org/urcu"
license=('LGPLv2.1')
provides=('liburcu')
changelog=
source=("http://lttng.org/files/urcu/$pkgname-$pkgver.tar.bz2")
md5sums=('2705dadd65beda8e8960472c082e44b3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
