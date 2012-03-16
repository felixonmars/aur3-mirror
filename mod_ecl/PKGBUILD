# Contributor: Antonio Bonifati  <antonio punto bonifati a google punto com>
# Maintainer: Antonio Bonifati <antonio punto bonifati a google punto com>
pkgname=mod_ecl
pkgver=b0.0.4
pkgrel=1
pkgdesc="Apache module to use Embeddable Common-Lisp (ECL) like PHP"
arch=('i686' 'x86_64')
url="http://mod-ecl.sourceforge.net/"
license=('GPL')
depends=(apache ecl)
install=${pkgname}.install
source=(http://downloads.sourceforge.net/sourceforge/mod-ecl/c_$pkgname-${pkgver}.zip 'apache.conf')
noextract=()
md5sums=('37086e405066026c8275a00aaf3e9c4e'
         '519d5845071cd490ab98c2a9e6789817')

build() {
  cd "$srcdir/c_$pkgname/c_$pkgname"
  apxs -c -L/usr/lib -lecl mod_ecl.c
}

package() {
  local LIBEXECDIR="$pkgdir/usr/lib/httpd/modules/"
  cd "$srcdir/c_$pkgname/c_$pkgname/.libs"
  install -d $LIBEXECDIR
  apxs -S LIBEXECDIR="$LIBEXECDIR" -n ecl_module -i mod_ecl.so
  install -D -m644 ${srcdir}/apache.conf ${pkgdir}/etc/httpd/conf/extra/ecl_module.conf
}
