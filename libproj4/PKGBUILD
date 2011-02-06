
# Contributor: Jed Brown <jed@59A2.org>
pkgname=libproj4
pkgver=3
_date=20081108
pkgrel=1
pkgdesc="A comprehensive library of cartographic projection functions"
arch=(x86_64 i686)
url="http://members.verizon.net/~gerald.evenden/proj4"
license=('GPL')
groups=()
depends=(gsl)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(http://members.verizon.net/~gerald.evenden/proj4/${pkgname}.${pkgver}_${_date}.tar.bz2)
noextract=()

build() {
  cd "$srcdir/$pkgname"
  patch <<EOF
--- Makefile.orig       2008-11-20 17:44:01.000000000 +0100
+++ Makefile    2008-11-20 17:45:13.000000000 +0100
@@ -31,7 +31,7 @@

 #prefix = /usr/local
 #prefix = /usr
-prefix = $(HOME)
+#prefix = $(HOME)

 # edit to reflect directory where system defaults and inits are located
 LIB = $(prefix)/lib
EOF
  make libproj4
  make
  make prefix="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:
md5sums=('4adcfa98fe5047e7e3c1ead1923e8595')
