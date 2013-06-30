# Maintainer: Diogo Leal <estranho@diogoleal.com>

pkgname=afternoonstalker
pkgver=1.1.5
pkgrel=2
pkgdesc="Afternoon Stalker is a clone of the 1981 Intellivision game Night Stalker. "
arch=('i686' 'x86_64')
url="http://perso.b2b2c.ca/sarrazip/dev/afternoonstalker.html"
license=('GPL')
depends=('flatzebra>=0.1.6')
makedepends=('flatzebra>=0.1.6')
options=('!libtool' '!emptydirs')
source=(http://perso.b2b2c.ca/sarrazip/dev/${pkgname}-${pkgver}.tar.gz)
md5sums=('f10a1ed758f469bcc146117d21a85eff')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var || return 1
}

package(){
    cd "${srcdir}/${pkgname}-${pkgver}"
    make || return 1
    make DESTDIR="${pkgdir}" install || return 1
}
