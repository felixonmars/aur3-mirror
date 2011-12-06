# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=pgbouncer
pkgver=1.4.2
pkgrel=1
epoch=
pkgdesc="PgBouncer is a lightweight connection pooler for PostgreSQL."
arch=('i686' 'x86_64')
url="http://pgfoundry.org/projects/pgbouncer"
license=('BSD')
groups=()
depends=('libevent>=2.0' 'postgresql>=7.4')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://pgfoundry.org/frs/download.php/3085/${pkgname}-${pkgver}.tgz")
noextract=()
md5sums=('5083110b5b4f2127234bfc7b1f451f8d')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --with-libevent=/usr/lib --disable-debug
  make
}

#check() {
#  cd "$srcdir/$pkgname-$pkgver"
#  make -k check
#}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
