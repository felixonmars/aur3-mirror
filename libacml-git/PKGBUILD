# Maintainer: Tianjiao Yin <ytj000@gmail.com>
# Contributor: Tianjiao Yin <ytj000@gmail.com>

pkgname=libacml-git
pkgver=20141130
pkgrel=1
arch=('any')
url="https://github.com/Mizuchi/acml"
pkgdesc="A C++ json/xml dumper/serialization library"
depends=('boost')
makedepends=('git')
license=('AGPLv3')


build() {
    cd $srcdir
    rm -rf acml
    git clone --depth=1 git://github.com/Mizuchi/acml.git
}
package() {
    cd $srcdir/acml
    mkdir -p   $pkgdir/usr/share/doc/acml
    mv include $pkgdir/usr
    mv example $pkgdir/usr/share/doc/acml
    mv README.rst $pkgdir/usr/share/doc/acml
}
