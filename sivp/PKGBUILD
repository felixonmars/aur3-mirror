# Contributor: stanger <svoboda.pavel@gmail.com>

pkgname=sivp
pkgver=0.4.3
pkgrel=1
pkgdesc="Scilab image and video processing toolbox"
arch=(i686)
url="http://sivp.sourceforge.net"
license=(GPL2)
depends=('opencv' 'scilab')
makedepends=('')
source=(http://downloads.sourceforge.net/sivp/${pkgname}-${pkgver}.tar.gz)
md5sums=('')

build() {
	cd $startdir/src/${pkgname}-${pkgver}
	./configure || return 1
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
}
