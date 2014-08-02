# Maintainer: Florian Pritz <bluewind@xinu.at>

pkgname=lanchat
pkgver=0.3
pkgrel=2
pkgdesc="Simple chat over LAN"
arch=('i686' 'x86_64')
url="http://scriptkiller.de/lanchat.php"
license=('GPL')
depends=("gtk2")
source=("http://scriptkiller.de/pub/${pkgname}/${pkgname}_$pkgver.tar.gz")
md5sums=('f3fd493028978a8e1e8c6165ecddd34b')
sha256sums=('f03dd1e03cda6f2b1d55bed7aec76493a7a593532ef8e97a23a91260ac5cc144')

build() {
  cd "$srcdir/$pkgname"

  make
}

package() {
  cd "$srcdir/$pkgname"
  install -D "$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
