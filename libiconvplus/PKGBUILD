# Maintainer: Elie Bouttier <elie@bouttier.eu.org>
# Contributor: Pierre Carrier <pierre@gcarrier.fr>
_ghuser=freelan-developers
pkgname=libiconvplus
pkgver=1.1
_pkgid=f109a53
pkgrel=1
pkgdesc="A C++ wrapper around the iconv library"
arch=(i686 x86_64)
url="http://www.freelan.org/"
license=('GPL')
depends=('boost-libs')
makedepends=('scons' 'freelan-buildtools' 'boost')
source=("https://github.com/$_ghuser/$pkgname/tarball/$pkgver")
md5sums=('471ee5c26d1269cd4d312c316251b9f8')

build() {
  cd "$srcdir/$_ghuser-$pkgname-$_pkgid"
  scons
}

package() {
  cd "$srcdir/$_ghuser-$pkgname-$_pkgid"
  scons install prefix="$pkgdir/usr"
}
