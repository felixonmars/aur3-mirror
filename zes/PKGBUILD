# Maintainer: Alexej Magura <agm2819*gmail*>
# 
# 
pkgname=zes
pkgver=0.2.0
pkgrel=2
pkgdesc="a process management suite"
arch=('any')
url="http://sourceforge.net/projects/zes"
license=('GPL3')
depends=('perl')
source=("http://sourceforge.net/projects/$pkgname/files/$pkgver/$pkgname-${pkgver}.tar.gz/download")
md5sums=('1b3f2b3842099afff8888fdec74fc68f')

package () {

    cd "$srcdir/$pkgname-$pkgver"

    make DESTDIR="\"$pkgdir\"" install

}
