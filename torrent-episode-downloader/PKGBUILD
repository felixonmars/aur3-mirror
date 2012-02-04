# Maintainer: Jesus Lazaro Plaza <jesuslazaro84 at gmail dot com>

pkgname=torrent-episode-downloader
_pkgname=ted
pkgver=0.97.2
_pkgver=0972
pkgrel=1
pkgdesc="TED: Torrent Episode Downloader"
arch=('i686' 'x86_64')
url="http://www.ted.nu/"
license=('GPL')
depends=('java-runtime')
makedepends=('unzip')
optdeps=('jdic: Tray icon support (i686 only)')
makedepends=('unzip')
source=(http://prdownloads.sourceforge.net/${_pkgname}/${_pkgname}v${_pkgver}.zip
        http://www.ted.nu/img/header_logo.png
        ted_start_script
        ${pkgname}.desktop)
noextract=(${_pkgname}v${_pkgver}.zip)
md5sums=('995b750840832e94b53f56b7d2828d25'
         '94e0554799527a5d547628cf9298fce5'
         '59626956bbdb95c8f1378f37768a6ddd'
         'da8dada7e34131f4bd73634352aa6a85')

build() {
   mkdir ${srcdir}/${_pkgname}
   cd ${srcdir}/${_pkgname}
   unzip ${srcdir}/${_pkgname}v${_pkgver}.zip
   rm -fR ${srcdir}/${_pkgname}/mac
   rm -fR ${srcdir}/${_pkgname}/windows
   rm -fR ${srcdir}/${_pkgname}/sunos
   rm -fR ${srcdir}/${_pkgname}/linux/x86   
}

package() {
   mkdir -p ${pkgdir}/opt
   cp -R ${srcdir}/${_pkgname} ${pkgdir}/opt/${pkgname} || return 1
   install -D -m755 ${srcdir}/ted_start_script ${pkgdir}/usr/bin/${pkgname} || return 1
   
   # Creating menu item
   install -D -m644 ${srcdir}/header_logo.png ${pkgdir}/usr/share/pixmaps/${pkgname}.png || return 1
   install -D -m644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop || return 1
}
