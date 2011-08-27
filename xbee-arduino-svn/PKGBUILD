# Maintainer: Albert Chang <albert.chang@gmx.com>
pkgname=xbee-arduino-svn
pkgver=38
pkgrel=1
pkgdesc="Arduino library for communicating with Xbees in API mode"
arch=('any')
url='http://code.google.com/p/xbee-arduino/'
license=('GPL3')
depends=('arduino')
makedepends=('subversion')
provides=('xbee-arduino')

_svntrunk='http://xbee-arduino.googlecode.com/svn/trunk'
_svnmod='trunk'

build()
{
    cd "${srcdir}"

    msg "Connecting to SVN server..."
    svn co "${_svntrunk}" "${_svnmod}"
    msg "SVN checkout done or server timeout."
}

package()
{
    cd "${srcdir}"

    mkdir -p "${pkgdir}/usr/share/arduino/libraries"
    chmod -x "${srcdir}/${_svnmod}"/{COPYING,XBee.cpp,XBee.h,keywords.txt}
    cp -rv "${srcdir}/${_svnmod}" "${pkgdir}/usr/share/arduino/libraries/XBee"
}
