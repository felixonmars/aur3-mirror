# Maintainer:  Hubert Kario <kario@wit.edu.pl>

pkgname=hdck
pkgver=0.5.0
pkgrel=1
pkgdesc="Hard disk testing for latent and hidden bad sectors"
arch=('i686' 'x86_64')
license=('GPL')
url="http://hdck.sourceforge.net/"

makedepends=('gcc' 'make')
depends=()
#conflicts=("$_pkgname")
#provides=("$_pkgname=$pkgver")

source=(http://downloads.sourceforge.net/project/${pkgname}/v.${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha1sums=('db5fd4bae6cb135e6630cea67a207c0ecd0edb61')

build() {
	cd "$pkgname-$pkgver"
	make || return 1
        mkdir -p $pkgdir/usr/sbin
        install -m 755 -D hdck $pkgdir/usr/sbin/
}
