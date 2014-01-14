# Maintainer: Elie Bouttier <elie@bouttier.eu.org>
# Contributor: Pierre Carrier <pierre@gcarrier.fr>
_ghuser=freelan-developers
pkgname=libfreelan
pkgver=2.1
_pkgid=0b1560a
pkgrel=3
pkgdesc="The new FreeLAN library"
arch=(i686 x86_64)
url="http://www.freelan.org/"
license=('GPL')
depends=('curl' 'libasiotap' 'libfscp' 'libkfather')
makedepends=('scons' 'freelan-buildtools' 'boost' 'libiconvplus')
source=("https://github.com/$_ghuser/$pkgname/tarball/$pkgver")
md5sums=('89a85381df234a2a3209fd58cf07843a')

sconsflags="-j1"

build() {
  cd "$srcdir/$_ghuser-$pkgname-$_pkgid"
  scons $sconsflags
}

package() {
  cd "$srcdir/$_ghuser-$pkgname-$_pkgid"
  scons install $sconsflags prefix="$pkgdir/usr"
}
