pkgname=lejos-rcx
_rc=2
_pkgver=3.0.0
pkgver=${_pkgver}rc${_rc}
pkgrel=4
pkgdesc="A firmware replacement and toolchain for programming the Lego RCX in Java"
url="http://lejos.sourceforge.net"
license=('MPL')
depends=('java-runtime' 'java-environment' 'lego-udev-rules>=0.2')
makedepends=('java-environment' 'apache-ant')
replaces=('lejos')
arch=('x86_64' 'i686')

install=${pkgname}.install
source=(http://lejos.sourceforge.net/tools/lejos3/lejos.${_pkgver}-RC${_rc}.tar.gz
        ${pkgname}.patch)
md5sums=('4846f7a116bdaf04800d4399b2799d83'
         '7aecfa7f0ff59411d44effb9126c6737')

build() {
    # compile
    export LEJOS_HOME=${srcdir}
    chmod +x ${srcdir}/release/cctest.sh
    cd ${srcdir}/build
    ant

    # remove junk
    find ${srcdir} -name '*.bak' -exec rm {} \;
    find ${srcdir} -name '*.bat' -exec rm {} \;

    cd ${srcdir}/bin
    patch -p0 -i ${srcdir}/lejos-rcx.patch
}

package() {

    _lejos_home=${pkgdir}/opt/lejos-rcx/

    install -d -m755 ${_lejos_home}/{bin,lib,3rdparty}
    install -d -m755 ${_lejos_home}/3rdparty/lib

    install -m755 -t ${_lejos_home}/bin \
        ${srcdir}/bin/*
    install -m644 -t ${_lejos_home}/lib \
        ${srcdir}/lib/*
    install -m644 -t ${_lejos_home}/3rdparty/lib \
        ${srcdir}/3rdparty/lib/*

    install -d -m755 ${pkgdir}/usr/bin

    for i in emu-dump emulate_lejoslink emu-lejos emu-lejosrun firmdl lejos lejosdl lejosjc lejoslink; do
        ln -sf /opt/lejos-rcx/bin/${i} ${pkgdir}/usr/bin/
    done
}
