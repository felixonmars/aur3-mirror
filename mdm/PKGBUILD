
# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
pkgname=mdm
pkgver=0.1.3
pkgrel=2
pkgdesc="The middleman system is a set of open-source utilities that help you parallelize your shell scripts."
arch=('any')
url="http://mdm.berlios.de/"
license=('Apache')
depends=("bash")
makedepends=('ncurses')
source=(http://download.berlios.de/mdm/$pkgname-$pkgver.tar.gz)
md5sums=('99c14265e32faaa58e26adf83ee63533')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  LDFLAGS="-Wl,--hash-style=gnu" make PREFIX="/usr"
  make INSTALL=/bin/install DESTDIR="$pkgdir/" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
