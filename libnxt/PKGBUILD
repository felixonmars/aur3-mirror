# Maintainer: Aliaksiej Artamonaŭ <aliaksiej.artamonau@gmail.com>

pkgname=libnxt
pkgver=0.3
pkgrel=2
pkgdesc='An utility library for talking to the LEGO Mindstorms NXT intelligent brick'

arch=('i686' 'x86_64')
url='http://code.google.com/p/libnxt/'
license=('GPL2')
depends=('libusb-compat>=0.1' 'libusb-compat<0.2')
makedepends=('scons')

source=(http://libnxt.googlecode.com/files/${pkgname}-${pkgver}.tar.gz
        SConstruct
        libnxt.pc)
md5sums=('05be5f5b8822f10e4fc4e1dea7d5e770'
         'f9eb13200f74c6697acef81b020777f2'
         'baa352b8bc0ea33e25674e7bbfb27e66')

build() {
    cp ${srcdir}/SConstruct ${srcdir}/${pkgname}-${pkgver} || return 1

    _soname=${pkgname}.so.0 _shname=${pkgname}.so.${pkgver} \
        scons -C ${srcdir}/${pkgname}-${pkgver} || return 1

    install -d -m755 ${pkgdir}/usr/include/libnxt || return 1
    install -m644 -t ${pkgdir}/usr/include/libnxt \
                     ${srcdir}/${pkgname}-${pkgver}/*.h || return 1

    install -d -m755 ${pkgdir}/usr/bin || return 1
    install -m755 -t ${pkgdir}/usr/bin \
                     ${srcdir}/${pkgname}-${pkgver}/{fwexec,fwflash} || return 1

    install -d -m755 ${pkgdir}/usr/lib || return 1
    install -m644 -t ${pkgdir}/usr/lib \
                     ${srcdir}/${pkgname}-${pkgver}/libnxt.a || return 1

    install -m755 -t ${pkgdir}/usr/lib \
                     ${srcdir}/${pkgname}-${pkgver}/${pkgname}.so.${pkgver} || \
        return 1
    ldconfig -N ${pkgdir}/usr/lib || return 1
    ln -sf ${pkgname}.so.0 ${pkgdir}/usr/lib/${pkgname}.so || return 1

    install -d -m755 ${pkgdir}/usr/lib/pkgconfig || return 1
    install -m644 -t ${pkgdir}/usr/lib/pkgconfig ${srcdir}/libnxt.pc || return 1
}
