# Maintainer: xgdgsc <xgdgsc @t gmail dot com>

pkgname=openremote-controller
pkgver=2.1.0
_snapshot=SNAPSHOT-2013-06-17
pkgrel=1
pkgdesc='OpenRemote Controller for the OpenRemote open source automation platform'
arch=('i686' 'x86_64')
url="http://openremote.org"
license=('custom')
depends=('jre')
optdepends=()

source=("http://downloads.sourceforge.net/project/openremote/For%20Developers/OpenRemote%202.0%20%28Developer%20Releases%29/OpenRemote-Controller-${pkgver}_${_snapshot}.zip")
md5sums=('af0e0e8d471ecf6dbb7ace747eaec402')

package() {
  cd "$srcdir/OpenRemote-Controller-${pkgver}_${_snapshot}"
  mkdir -p "${pkgdir}/opt/OpenRemote-Controller"
  cp -R * "${pkgdir}/opt/OpenRemote-Controller"
  chmod +x "${pkgdir}/opt/OpenRemote-Controller/bin/openremote.sh"
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "${pkgdir}/opt/OpenRemote-Controller/bin/openremote.sh" "${pkgdir}/usr/bin/openremote"
}
