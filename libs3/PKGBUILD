# Contributor: Bryan Ischo <bryan@ischo.com>
pkgname=libs3
pkgver_major=2
pkgver_minor=0
pkgver=$pkgver_major.$pkgver_minor
pkgrel=1
pkgdesc="C Library and Tools for Amazon S3 Access"
arch=('i686' 'x86_64')
url="http://libs3.ischo.com/index.html"
license=('GPL')
groups=()
depends=('libxml2' 'openssl' 'curl')
makedepends=('make' 'libxml2' 'openssl' 'curl')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://libs3.ischo.com/$pkgname-$pkgver.tar.gz)
noextract=()
md5sums=('e52da69ddc11019e98cf8246fc55b4e1')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR=$pkgdir/usr \
       LIBS3_VER_MAJOR=$pkgver_major \
       LIBS3_VER_MINOR=$pkgver_minor \
       install || return 1
}
