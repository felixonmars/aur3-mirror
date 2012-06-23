# Maintainer: Mika Fischer <mika.fischer@zoopnet.de>
pkgname=squeezeslave
pkgver=1.2
pkgrel=1
pkgdesc="Light weight streaming audio player for Logitech's Squeezebox audio server"
arch=('i686' 'x86_64')
url="http://wiki.slimdevices.com/index.php/SqueezeSlave"
license=('GPL')
depends=('lirc-utils')
makedepends=('alsa-lib' 'lirc-utils' 'ncurses' 'patch' 'subversion')
options=('!makeflags')

# Use __svn* instead of _svn* to prevent makepkg from overwriting ${pkgver}
__svntrunk="http://squeezeslave.googlecode.com/svn/squeezeslave/branches/squeezeslave-1.2-311"
__svnmod="squeezeslave-1.2"
__svnrev=350

build() {
    cd "${srcdir}"

    msg "Connecting to SVN server...."
    if [ -d "${__svnmod}/.svn" ]; then
        (cd "${__svnmod}" && svn up -r "${__svnrev}")
    else
        svn co "${__svntrunk}" --config-dir ./ -r "${__svnrev}" "${__svnmod}"
    fi
    msg "SVN checkout done or server timeout"

    msg "Starting build..."
    rm -rf "${srcdir}/${__svnmod}-build"
    cp -r "${srcdir}/${__svnmod}" "${srcdir}/${__svnmod}-build"
    cd "${srcdir}/${__svnmod}-build"

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
    install -D -m755 "${srcdir}/${__svnmod}-build/bin/squeezeslave" "${pkgdir}/usr/bin/squeezeslave"
}
