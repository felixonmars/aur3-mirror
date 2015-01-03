# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Contributor: Bjoern Bidar <theodorstormgrade@gmail.com>

pkgname=roal
pkgver=a6
pkgrel=1
pkgdesc="Relics of Annorath is a MMORPG which plays in a medieval/post-modern ambience, game launcher"
url="https://portal.annorath-game.com"
arch=('i686' 'x86_64')
license=('GPL3' 'CC: BY-NC-ND' 'custom: SIL')
depends=('qt5-base' 'sfml' 'libtorrent-rasterbar' 'libarchive')
makedepends=('git' 'qt5-tools' 'boost')
source=("git://github.com/QuantumBytesInc/ROAL.git")
sha512sums=('SKIP')

_gitroot='git::http://github.com/QuantumBytesInc/ROAL.git:ROAL'
_gitname=ROAL

build() {
   cd "${srcdir}/$_gitname"
   lrelease-qt5 ROALauncher.pro
   qmake-qt5 ROALauncher.pro -o Makefile
   make
}

package() {
   install -D -m644 "${srcdir}/$_gitname/licenses/Ubuntu Font Licence.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/Ubuntu Font Licence.txt"
   install -D -m644 "${srcdir}/$_gitname/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
   install -D -m755 "${srcdir}/$_gitname/ROALauncher" \
        "${pkgdir}/opt/roa/launcher/launcher/ROALauncher"
}
