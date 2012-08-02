# Maintainer: Absolosba <absolosba at gmail dot com>
pkgname=vapor-steamclient
pkgver=1.6
pkgrel=1
pkgdesc="Cross-platform Steam client (IM only)"
url="http://www.facepunch.com/threads/1057523"
arch=('x86_64' 'i686')
license=('unknown')
depends=('mono')
makedepends=('unzip')
noextract=("Vapor_${pkgver}.rar")
source=("https://bitbucket.org/VoiDeD/steamre/downloads/Vapor_${pkgver}.zip"
        "vapor-steamclient"
	"vapor-steamclient.desktop")
md5sums=('dd2bd987f47a394f08354d49e20bf2bb'
         '6308bc78647ce1e16cd4eb423c367392'
         'e015b1256cb8c91b88c399ccc01f71d0')
build() {
  unzip -o -d ${srcdir} ${srcdir}/Vapor_${pkgver}.zip 
  install -dm755 ${pkgdir}/usr/{bin,share/${pkgname}}
  cp -r ${srcdir}/{*.dll,*.exe}  ${pkgdir}/usr/share/${pkgname}/ || return 1
  install -Dm755 "${srcdir}/vapor-steamclient" "${pkgdir}/usr/bin/" || return 1
  mkdir ${pkgdir}/usr/share/applications
  install "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/" || return 1
  mkdir ${pkgdir}/usr/share/vapor-steamclient/cache
  chmod 777 ${pkgdir}/usr/share/vapor-steamclient/cache #fix permissions for steam icons
}

# vim:set ts=2 sw=2 et:
