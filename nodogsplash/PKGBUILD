# Maintainer: Moez Bouhlel <bmoez.j@gmail.com>

pkgname=nodogsplash
pkgver=0.9_beta9.9.9
pkgrel=1
pkgdesc="Nodogsplash offers a simple way to provide restricted access to an internet connection"
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/nodogsplash/nodogsplash"
depends=('iproute2' 'iptables')
conflicts=("$pkgname-git")
source=("https://codeload.github.com/$pkgname/$pkgname/tar.gz/v$pkgver")
md5sums=('3dd9f13489efd300414e787bf85c01d6')
backup=('etc/nodogsplash/nodogsplash.conf'
  'etc/nodogsplash/htdocs/'{images/splash.jpg,splash.html,infoskel.html})

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  make -C "$pkgname-$pkgver" "DESTDIR=$pkgdir" install
}
