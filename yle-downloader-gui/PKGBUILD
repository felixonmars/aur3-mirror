# Maintainer:  Jesse Jaara      <gmail.com: jesse.jaara>

pkgname=yle-downloader-gui
pkgver=2.2
_gitrev=56b5863
pkgrel=1
pkgdesc="Gui for rtmpdump-yle, a app to download videos from Yle-Areena"
arch=('i686' 'x86_64')
url="http://mpartel.github.com/yle-downloader-gui/"
license=('PublicDomain')
depends=('yle-dl' 'qt4')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/mpartel/yle-downloader-gui/tarball/${pkgver})
install=yle.install

build() {
  cd "${srcdir}/mpartel-yle-downloader-gui-${_gitrev}"

  lrelease-qt4 yle-downloader-gui.pro
  qmake4

  make
}

package() {
  cd "${srcdir}/mpartel-yle-downloader-gui-${_gitrev}"

  mkdir -p          "${pkgdir}/usr/bin"
  mkdir -p          "${pkgdir}/usr/share/applications/"

  cp yle-downloader-gui  \
                    "${pkgdir}/usr/bin/"
  cp yle-downloader-gui.desktop \
                    "${pkgdir}/usr/share/applications/"

  for png in 16 22 32 48 256; do
     mkdir -p       "${pkgdir}/usr/share/icons/hicolor/${png}x${png}/apps"
     cp icons/${png}.png  "${pkgdir}/usr/share/icons/hicolor/${png}x${png}/apps/yle-downloader-gui.png"
  done

  mkdir -p       "${pkgdir}/usr/share/icons/hicolor/scaleable/apps"
  cp icons/yle-downloader-gui.svg \
                 "${pkgdir}/usr/share/icons/hicolor/scaleable/apps/yle-downloader-gui.svg"
}

md5sums=('13df9f64f035256edde01a2e5c594d18')
