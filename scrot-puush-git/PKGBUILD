# Maintainer: Shingetsu Kurai <andrey.kudryavtsev@gmail.com>
pkgname=scrot-puush-git
pkgver=c42d90d
pkgrel=1
pkgdesc="dash script to emulate puush usage as it is on windows"
arch=(any)
url=https://sourceforge.net/projects/scrot-puush/
license=('GPL')
depends=(puush dash xclip scrot)
makedepends=(git)
source=(git://git.code.sf.net/p/scrot-puush/code)
md5sums=('SKIP')
install=scrot-puush.install

pkgver() {
	cd code
	git describe --always | sed 's|-|.|g'
}

package() {
	cd "$srcdir/code"
	install -Dm 755 puu.sh $pkgdir/usr/bin/puu.sh
}
