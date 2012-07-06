# Maintainer: Mika Fischer <mika.fischer@zoopnet.de>
pkgname=squeezeslave-svn
pkgver=350
pkgrel=1
pkgdesc="Light weight streaming audio player for Logitech's Squeezebox audio server (svn trunk)"
arch=('i686' 'x86_64')
url="http://wiki.slimdevices.com/index.php/SqueezeSlave"
license=('GPL')
depends=('lirc-utils')
makedepends=('alsa-lib' 'lirc-utils' 'ncurses' 'patch' 'subversion')
options=('!makeflags')
provides=('squeezeslave')
conflicts=('squeezeslave')

_svntrunk="http://squeezeslave.googlecode.com/svn/squeezeslave/trunk/squeezeslave"
_svnmod="squeezeslave-trunk"

build() {
    cd "${srcdir}"

    msg "Connecting to SVN server...."
    if [ -d "${_svnmod}/.svn" ]; then
        (cd "${_svnmod}" && svn up -r "${pkgver}")
    else
        svn co "${_svntrunk}" --config-dir ./ -r "${pkgver}" "${_svnmod}"
    fi
    msg "SVN checkout done or server timeout"

    msg "Starting build..."
    rm -rf "${srcdir}/${_svnmod}-build"
    cp -r "${srcdir}/${_svnmod}" "${srcdir}/${_svnmod}-build"
    cd "${srcdir}/${_svnmod}-build"

    if [ "${CARCH}" = "x86_64" ]; then
        make -f makefile.linux26-i64-alsa-display
    elif [ "${CARCH}" = "i686" ]; then
        make -f makefile.linux26-alsa-display
    else
        echo "Unknown architecture: ${CARCH}"
        return 1
    fi
}

package() {
    install -D -m755 "${srcdir}/${_svnmod}-build/bin/squeezeslave" "${pkgdir}/usr/bin/squeezeslave"
}
