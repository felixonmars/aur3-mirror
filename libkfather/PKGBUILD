# Maintainer: Elie Bouttier <elie@bouttier.eu.org>
# Contributor: Pierre Carrier <pierre@gcarrier.fr>
_ghuser=freelan-developers
pkgname=libkfather
pkgver=1.0
_pkgid=d018982
pkgrel=1
pkgdesc="A modern and efficient C++ JSON parser/producer library"
arch=(i686 x86_64)
url="http://www.freelan.org/"
license=('GPL')
depends=('boost-libs' 'libiconvplus')
makedepends=('scons' 'freelan-buildtools' 'boost' 'libiconvplus')
source=("https://github.com/$_ghuser/$pkgname/tarball/$pkgver")
md5sums=('1e9b9a8011dd7b8b69b4b1f775a6d964')

build() {
  cd "$srcdir/$_ghuser-$pkgname-$_pkgid"
  scons
}

package() {
  cd "$srcdir/$_ghuser-$pkgname-$_pkgid"
  scons install prefix="$pkgdir/usr"
}
