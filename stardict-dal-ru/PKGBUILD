# Maintainer: geli0n <$Maintainer@mail.ru>
pkgname=stardict-dal-ru
pkgver=2.4.2
pkgrel=2
pkgdesc="Russian Dal explanatory dictionary for StarDict"
arch=('i686' 'x86_64')
url="http://stardict.sourceforge.net"
license=('GPL')
depends=('stardict')
source=(http://yeelou.com/huzheng/stardict-dic/ru/$pkgname-$pkgver.tar.bz2)
md5sums=('73fbeb34b99bf27b6214d568ee1fde21')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p $pkgdir/usr/share/stardict/dic/
  install -m 644 * $pkgdir/usr/share/stardict/dic/
}

# vim:set ts=2 sw=2 et:
