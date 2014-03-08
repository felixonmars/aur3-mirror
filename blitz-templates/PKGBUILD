# Contributor: kldoo <kldscs[at]gmail.com>

pkgname=blitz-templates
pkgver=0.8.6
pkgrel=1
pkgdesc="Blitz templates is a fast template engine written in C and compiled as a PHP module."
arch=('i686' 'x86_64')
url="http://alexeyrybak.com/blitz/blitz_en.html"
license=('BSD License')
depends=('php' 'autoconf' 'automake' 'libtool' 'm4 ')
makedepends=()
conflicts=()
source=(http://alexeyrybak.com/blitz/blitz-${pkgver}.tar.gz)
md5sums=('9feb0c99c5097e122bbdb2ea4f379cbc')

build() {
  cd $srcdir/blitz-$pkgver
  phpize
  ./configure --prefix=/usr
  make || return 1
  make INSTALL_ROOT=$pkgdir install || return 1
  mkdir -p $pkgdir/etc/php/conf.d/ || return 1
  echo "extension=blitz.so" > $pkgdir/etc/php/conf.d/blitz.ini || return 1
}
