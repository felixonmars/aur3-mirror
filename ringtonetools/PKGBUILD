# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Maintainer: aurelien <aurelien@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=ringtonetools
pkgver=2.26
pkgrel=1
pkgdesc="A program for creating ringtones and logos for mobile phones"
arch=('i686' 'x86_64')
url="http://ringtonetools.mikekohn.net/"
license=('custom')
depends=('glibc')
source=(http://downloads.mikekohn.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('fb88afcf24658e0106b6717668604d78')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  make || return 1
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
