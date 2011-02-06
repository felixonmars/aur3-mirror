# Maintainer: Laszlo Papp <djszapi2@gmail.com>
pkgname=mxit-libpurple
pkgver=2.0.0
pkgrel=1
pkgdesc='Libpurple plug-in supporting microblog services like Twitter'
url='http://code.google.com/p/microblog-purple/'
license=('GPL3')
depends=('pidgin')
arch=('i686' 'x86_64')
source=(${pkgname}-${pkgver}_src.tgz::http://devzone.mxit.com/libPurple/download/2)
md5sums=('11a8e612d184edad4d39e47e30e9fa11')

build(){
    cd ${srcdir}/mxit_libpurple_plugin-${pkgver}
    make || return 1
    make DESTDIR=${pkgdir} install || return 1
}
