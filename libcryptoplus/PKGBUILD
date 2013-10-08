# Maintainer: Elie Bouttier <elie@bouttier.eu.org>
# Contributor: Pierre Carrier <pierre@gcarrier.fr>
_ghuser=freelan-developers
pkgname=libcryptoplus
pkgver=2.0
_pkgid=064851c
pkgrel=1
pkgdesc="A C++ wrapper around the OpenSSL cryptographic library"
arch=(i686 x86_64)
url="http://www.freelan.org/"
license=('GPL')
depends=('openssl')
makedepends=('scons' 'freelan-buildtools' 'boost')
source=("https://github.com/$_ghuser/$pkgname/tarball/$pkgver")
md5sums=('305d09c2105e1bdaf73a09a500a94243')

build() {
  cd "$srcdir/$_ghuser-$pkgname-$_pkgid"
  scons
}

package() {
  cd "$srcdir/$_ghuser-$pkgname-$_pkgid"
  scons install prefix="$pkgdir/usr"
}
