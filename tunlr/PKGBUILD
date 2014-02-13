# Maintainer: edloaa <edloaa at googlemail dot com>
# Contributor: edloaa <edloaa at googlemail dot com>
pkgname=tunlr
pkgver=0.2.0
pkgrel=1
pkgdesc="Watch Netflix, MTV, CBS, Hulu & more outside the U.S. [tunlr start and stop]"
arch=('any')
url="http://tunlr.net/"
license=('GPL')
depends=('bash' 'coreutils' 'wget' 'sed' 'grep')
source=($pkgname)
md5sums=('a5af55c3c7495b2b630646b944c2005b')

package() {
	install -D -m755 $pkgname $pkgdir/usr/bin/$pkgname
}
