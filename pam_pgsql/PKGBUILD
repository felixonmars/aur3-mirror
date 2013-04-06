# Contributor: Andre Klitzing <aklitzing () online () de>
# Maintainer:  Gereon Schomber <Gereon underscore Schomber at fastmail dot fm>
pkgname=pam_pgsql
_pkgname=pam-pgsql
pkgver=0.7.3.1
pkgrel=1
pkgdesc="A PAM module to authenticate users against postgresql"
arch=('i686' 'x86_64')
license=('GPL')
url="http://sourceforge.net/projects/pam-pgsql"
depends=('postgresql-libs')
source=(http://downloads.sourceforge.net/${_pkgname}/${_pkgname}-${pkgver}.tar.gz )

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  ./configure --prefix=/usr --docdir=/usr/share/doc/pam-pgsql
  make
}
package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/"
  make DESTDIR="$pkgdir/" install
}
sha1sums=('55bef9c5159898897710d4d67f6092a48ce38b73')
