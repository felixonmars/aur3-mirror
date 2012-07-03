# Contributor: helios <aur@wiresphere.de>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=whois-debian
pkgver=5.0.17
pkgrel=1
pkgdesc="The whois client by Marco d'Itri"
arch=('i686' 'x86_64')
url="http://www.linux.it/~md/software/"
license=('GPL')
depends=('libidn')
makedepends=('perl')
conflicts=('whois')
provides=('whois')
source=(http://ftp.debian.org/debian/pool/main/w/whois/whois_${pkgver}.tar.xz
        config.h.patch)
md5sums=('754ff9a089913bf198400eb937e24055'
         '0a46a322163146e27fded6ffef9a2b56')

build() {
  cd $srcdir/whois-$pkgver
  patch -p0 -i $srcdir/config.h.patch
  make prefix=/usr HAVE_LIBIDN=1
}

package() {
  cd $srcdir/whois-$pkgver

  make prefix=/usr BASEDIR=$pkgdir install-whois
}
