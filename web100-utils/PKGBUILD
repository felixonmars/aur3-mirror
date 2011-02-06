# Contributor: Jakub Schmidkte <sjakub-at-gmail-dot-com>
pkgname=web100-utils
pkgver=1.7
pkgrel=1
pkgdesc="Web100 utilities"
arch=('i686' 'x86_64')
url="http://www.web100.org"
license=('LGPL')
depends=('kernel26-web100')
source=("http://www.web100.org/download/userland/version${pkgver}/web100_userland-${pkgver}.tar.gz")
md5sums=('ab101c7e368b0168d6e0ad5cadce7446')

build() {
  cd "$srcdir/web100_userland-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
