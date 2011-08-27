# Contributor: wanglun <iseuer@gmail.com>

pkgname=ftk
pkgver=0.5
pkgrel=1
pkgdesc="a embeded gui library."
license=('GPL')
url="http://code.google.com/p/ftk/"
depends=()
conflicts=('ftk')
provides=('ftk')
sha1sums=("11d83688b96437c2c5b1d0c8c76d7f2666f87701")
source=(http://ftk.googlecode.com/files/ftk-${pkgver}.tar.gz)
arch=('i686' 'x86_64')

build() { 

cd "${srcdir}/ftk-${pkgver}"
    ./configure --prefix=/usr/local --with-backend=linux-x11:320x240 --enable-cairo || return 1
    make || return 1
    make DESTDIR="${pkgdir}" install || return 1
}
