pkgname=qimageviewer-git
pkgver=20131307
pkgrel=1
pkgdesc="Image Viewer on Qt."
arch=('x86_64' 'i686')
url="https://github.com/abodnyaUA/qimageviewer"
license=('GPLv2')
makedepends=('git')
depends=('qt5-base' 'qt5-webkit')

build(){
  cd "${srcdir}"

  echo "[Desktop Entry]">qimageviewer.desktop
  echo "Name=QImageViewer">>qimageviewer.desktop
  echo "GenericName=Image View.">>qimageviewer.desktop
  echo "GenericName[ru]=Просмотр изображений.">>qimageviewer.desktop
  echo "Exec=/usr/bin/qimageviewer %u">>qimageviewer.desktop
  echo "Icon=qimageviewer">>qimageviewer.desktop
  echo "Terminal=false">>qimageviewer.desktop
  echo "Type=Application">>qimageviewer.desktop
  echo "StartupNotify=true">>qimageviewer.desktop
  echo "Categories=Graphics;2DGraphics;RasterGraphics;">>qimageviewer.desktop

  git clone git://github.com/abodnyaUA/qimageviewer.git
  cd qimageviewer/src
  qmake-qt5 QImageViewer.pro
  make
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  cp "${srcdir}/qimageviewer/src/qimageviewer" "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/icons/hicolor/64x64/apps"
  cp "${srcdir}/qimageviewer/src/res/icon.png" "${pkgdir}/usr/share/icons/hicolor/64x64/apps/qimageviewer.png"
  mkdir -p "${pkgdir}/usr/share/applications"
  cp "${srcdir}/qimageviewer.desktop" "${pkgdir}/usr/share/applications"
}