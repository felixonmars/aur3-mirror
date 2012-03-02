# Maintainer: timttmy <marshall\\dot//cleave\\at//tiscali\\dot//co\\dot//uk>
pkgname=batren
pkgver=0.3.1
pkgrel=1
pkgdesc='BatRen is a CLI automatic file rename tool.'
arch=('x86_64' 'i686')
url='http://batren.sourceforge.net/cgi-bin/blis.cgi/Home'
source=(http://downloads.sourceforge.net/project/batren/batren/0.3.1/batren-0.3.1.tar.gz)
md5sums=('d4da40aec96842bfd825af9640b3a053')
license=('GPL')
depends=('bash')
makedepends=()
optdepends=()
conflicts=()
provides=('batren')



build() {
	cd $srcdir/$pkgname-$pkgver
	make prefix=$pkgdir/usr install
}

