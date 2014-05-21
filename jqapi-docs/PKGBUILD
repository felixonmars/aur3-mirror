# Maintainer: Nevar <v01d@inventati.org>

pkgname=jqapi-docs
pkgver=20140211
pkgrel=1
pkgdesc="This is a alternative interface to browse the Official jQuery Documentation that can be found on GitHub."
arch=('any')
url="http://jqapi.com/"
license=('GPL')
options=('!strip')

noextract=("$pkgname-$pkgver.zip")
source=("$pkgname-$pkgver.zip::http://jqapi.com/${pkgname%%-*}.zip")
md5sums=('6528c56a2dac19a94d821194207f7211')

prepare() {
    unzip -qo $pkgname-$pkgver.zip -d $pkgname
}

package() {
  mkdir -p $pkgdir/usr/share/doc/${pkgname%%-*}
  cp -rf $srcdir/$pkgname/* $pkgdir/usr/share/doc/${pkgname%%-*}
}
