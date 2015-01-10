# Maintainer: Silvernode <mollusk@sudotask.com>
#hosted it myself due to original url filename issues
pkgname="hou-bin"
pkgver="0.32a"
pkgrel=1
pkgdesc="Heroes of Umbra is a 2D side-scrolling, multiplayer RPG."
url="http://heroesofumbra.com/"
arch=('x86_64' 'i686')
license=('Closed Source')
depends=('jre7-openjdk' 'zenity')
optdepends=()
makedepends=()
conflicts=('jre8-openjdk')
replaces=()
backup=()
source=("http://homebutter.com/packages/hou/tarballs/hou-bin-0.32a.tar.gz") 
sha256sums=('932ce4a295f75525c5a720dd6257333aa0d95030174c04117d8f7a8bd5b1f7e9')

package() {
  
  #chown ${USER} ${srcdir}/${pkgname}-${pkgver}.jar
  install -Dm700 ${srcdir}/${pkgname}-${pkgver}.jar ${pkgdir}/home/$USER/Games/hou/${pkgname}-${pkgver}.jar
  install -Dm644 ${srcdir}/hou ${pkgdir}/usr/bin/hou
  install -Dm644 ${srcdir}/hou.png ${pkgdir}/usr/share/pixmaps/hou.png
  install -Dm644 ${srcdir}/hou.desktop ${pkgdir}/usr/share/applications/hou.desktop

  chown -R $USER:users ${pkgdir}/home/$USER/Games
  chmod 700 ${pkgdir}/home/$USER
  chmod +x ${pkgdir}/usr/bin/hou
}
