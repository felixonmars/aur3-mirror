# Maintainer: philomath <philomath868 AT gmail DOT com>
#Contributor: Arthur Danskin <arthurdanskin@gmail.com>

pkgname=dadadodo
pkgver=1.04
pkgrel=3
pkgdesc="generates random sentences based on word probabilities"
url="http://www.jwz.org/dadadodo/"
license=('MIT')
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('gcc')
source=(http://www.jwz.org/dadadodo/$pkgname-$pkgver.tar.gz)
md5sums=('d3ff69c4e71c328586b1c6ca2130a4b3')

build() {
  cd $srcdir/$pkgname-$pkgver
  head dadadodo.c > LICENSE
  make
  install -D -m755 dadadodo $pkgdir/usr/bin/dadadodo
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/dadadodo/LICENSE
}
