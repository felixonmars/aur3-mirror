# Contributor: Sacro <ben at benwoodward dot me dot uk>
pkgname=ipfaccessapi_multi
pkgver=1
pkgrel=1
pkgdesc="API for IPF access under e-uae"
arch=('i686' 'x86_64')
url="http://www.softpres.org"
license=('custom')
source=($pkgname.tgz)
md5sums=('f33c2ac4273871c1c59d375958e525a3')

build() {
install -D -m644 $startdir/src/$pkgname/include/caps/capsimage.h $startdir/pkg/usr/include/caps/capsimage.h
install -D -m644 $startdir/src/$pkgname/LICENSE $startdir/pkg/usr/share/licenses/$pkgname/LICENSE
}
