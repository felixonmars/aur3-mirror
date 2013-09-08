# Maintainer: Alan Berndt <alan@eatabrick.org>
pkgname=gfk
pkgver=0.0.2
pkgrel=2
pkgdesc="Securely share files between computers with a USB drive"
url="http://gfk.eatabrick.org/"
license='MIT'
arch=('any')
depends=('secretfs')
provides=('gfk')
source=('https://github.com/bentglasstube/gfk/archive/v0.0.2.tar.gz')
sha1sums=('115cb38ead26fd221a6c41ac4cd11e85d0ca866d')

build() {
  true # literally nothing to do
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
