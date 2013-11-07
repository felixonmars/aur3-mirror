# Maintainer: smokex <smokexjc@gmail.com>

pkgname=quazaa-git
pkgver=20131106
pkgrel=1
pkgdesc="Multi-network P2P file-sharing client inspired by Shareaza which will support Gnutella2, Ares, eDonkey2000 (eMule), HTTP, FTP, and BitTorrent."
arch=('i686' 'x86_64')
url="http://quazaa.sourceforge.net"
license=('GPL3')
depends=('qt5-base' 'qt5-tools' 'qt5-imageformats' 'qt5-multimedia' 'zlib' 'icu')
makedepends=('git')
optdepends=('openssl: ssl connections')
provides=('quazaa')
conflicts=('quazaa')
source=('quazaa.desktop')
md5sums=('7e02e90df592b026b41d5a915c69ce44')

_gitroot="git://git.code.sf.net/p/quazaa/gitcode"
_gitname="quazaa"

build() {
   cd "${srcdir}"
   msg "Connecting to GIT server...."

   if [ -d "${_gitname}" ] ; then
     cd "${_gitname}" && git pull origin && git submodule init && git submodule update
     msg "The local files are updated."
   else
     git clone "${_gitroot}" "${_gitname}"
     cd "${_gitname}" && git submodule init && git submodule update
   fi

   msg "GIT checkout done or server timeout"
   msg "Starting make..."

   cd "${srcdir}"
   rm -fr "${_gitname}-build"
   cp -R "${_gitname}" "${_gitname}-build"
   cd "${_gitname}-build"

   # Compilation
   qmake-qt5
   make
}

package() {
   cd "${_gitname}-build/Quazaa"

   # Installation
   install -Dm755 bin/Quazaa "${pkgdir}/usr/share/quazaa/Quazaa"
   install -Dm644 bin/GeoIP/geoip.dat "${pkgdir}/usr/share/quazaa/GeoIP/geoip.dat"
   install -Dm644 bin/DefaultSecurity.dat "${pkgdir}/usr/share/quazaa/DefaultSecurity.dat"
   install -Dm644 bin/DefaultServices.dat "${pkgdir}/usr/share/quazaa/DefaultServices.dat"
   install -Dm644 bin/notify.mp3 "${pkgdir}/usr/share/quazaa/notify.mp3"
   install -m644 bin/*.qm "${pkgdir}/usr/share/quazaa/"

   # Desktop icon
   install -Dm644 "Resource/Quazaa128.png" "${pkgdir}/usr/share/pixmaps/quazaa.png"
   install -Dm644 "${startdir}/quazaa.desktop" "${pkgdir}/usr/share/applications/quazaa.desktop"
}
