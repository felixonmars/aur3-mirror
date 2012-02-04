# Contributor: Lisa Denia <eiffel56@gmail.com>
pkgname=sub32
pkgver=0.5.1
pkgrel=1
pkgdesc="Simplifies use of a 32bit subsystem"
arch=('i686' 'x86_64')
url="http://eiffel56.mybonsai.at/"
license=('GPLv2')
depends=(sh 'archbootstrap-ee=>0.5')
source=(${pkgname}-${pkgver}.tar.gz)
md5sums=('d134dd3681dd7409e3cdcb8bbf377937')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR=$pkgdir ./install.sh
}

# vim:set ts=2 sw=2 et:
