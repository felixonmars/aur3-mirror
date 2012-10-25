# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=coova-chilli
pkgver=1.3.0
pkgrel=1
pkgdesc='an open-source software access controller'
arch=('i686' 'x86_64')
url="http://coova.org/CoovaChilli"
license=('GPL')
depends=('curl' 'libpcap')
optdepends=('python')
md5sums=('dc0037e3cdebcb60508081b4e42e984a')

options=(!libtool)
source=(http://ap.coova.org/chilli/${pkgname}-${pkgver}.tar.gz)
backup=('etc/chilli.conf')
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    export CFLAGS="-Wno-error=unused-but-set-variable"
    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
        --enable-statusfile \
        --enable-sessionstate \
        --enable-sessionid \
        --disable-static \
        --enable-miniportal
    make
    make DESTDIR="${pkgdir}" install
    rm -rf ${pkgdir}/etc/init.d
    rmdir ${pkgdir}/usr/lib/coova-chilli
}

