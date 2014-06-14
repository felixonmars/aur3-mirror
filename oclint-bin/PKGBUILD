# Maintainer: Evert Van Petegem <evert.van.petegem@gmail.com>
pkgname=oclint-bin
_pkgname=oclint
pkgver=0.7
pkgrel=1
pkgdesc="A static code analysis tool for improving quality and reducing defects"
arch=(x86_64)
url="http://oclint.org/"
license=('custom')
depends=('python2')
provides=('oclint')
conflicts=('oclint')
source=(http://archives.oclint.org/releases/$pkgver/$_pkgname-$pkgver-x86_64-linux-ubuntu-12.04.tar.gz)
md5sums=('1c1b6c9194699c5ed77b77e498491fe0')

build() {
	cd "$srcdir/$_pkgname-$pkgver-x86_64-linux-ubuntu-12.04"
    sed -i "1s/python/python2/" bin/oclint-json-compilation-database
}

package() {
	cd "$srcdir/$_pkgname-$pkgver-x86_64-linux-ubuntu-12.04"
	mkdir "$pkgdir/usr/"
    cp -r bin/ "$pkgdir/usr/"
    cp -r lib/ "$pkgdir/usr/"
    mkdir -p "$pkgdir/usr/share/licenses/oclint"
    cp LICENSE "$pkgdir/usr/share/licenses/oclint"
}
