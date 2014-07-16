# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=teighaviewer
pkgver=4.00.0
pkgrel=1
pkgdesc="Free cross-platform application for the visualization of CAD drawing files."
arch=('i686' 'x86_64')
url="http://www.opendesign.com/guestfiles/teigha_viewer"
license=('custom')

if [ $CARCH == i686 ]; then
  depends=('qt4' 'mesa' 'bash' 'hicolor-icon-theme' 'glu' 'libpng12')
elif [ $CARCH == x86_64 ]; then
  depends=('lib32-qt4' 'lib32-mesa' 'bash' 'hicolor-icon-theme' 'lib32-glu' 'lib32-libpng12')
fi
install=${pkgname}.install

_file=TeighaViewer_lnxX86_4.4dll_${pkgver}_i386.deb
source=(http://www.opendesign.com/files/guestdownloads/TeighaViewer/$_file)
md5sums=('d09ae4505f48ebf0fabea478e0e57f74')

build() {
  [ ! -d ${pkgname}-${pkgver} ] && mkdir ${pkgname}-${pkgver}
  tar xf data.tar.gz -C ${pkgname}-${pkgver}
}

package() {
  cd ${pkgname}-${pkgver}
  
  # persistent application storage (libs, executables, etc.)
  if [ $CARCH == i686 ]; then
    appstoragedir=usr/lib/teighaviewer
  elif [ $CARCH == x86_64 ]; then
    appstoragedir=usr/lib32/teighaviewer
  fi
  for file in $(ls usr/bin/TeighaViewer_${pkgver}/); do
    install -Dm755 usr/bin/TeighaViewer_${pkgver}/${file} \
        "${pkgdir}/${appstoragedir}/${file}"
  done
  
  # binary
  install -Dm755 usr/bin/TeighaViewer \
    "${pkgdir}/usr/bin/teighaviewer"
  sed -e "s#usr/bin/TeighaViewer_${pkgver}#${appstoragedir}#" \
    -i "${pkgdir}/usr/bin/${pkgname}"
  
  # desktop item
  install -Dm644 usr/share/applications/TeighaViewer_${pkgver}.desktop \
    "${pkgdir}/usr/share/applications/teighaviewer.desktop"
  sed -e "s#/TeighaViewer#/teighaviewer#" \
    -i "${pkgdir}/usr/share/applications/teighaviewer.desktop"
  
  # hicolor icons
  for icon in $(find usr/share/icons -type f); do
    install -Dm644 ${icon} \
        "${pkgdir}/${icon}"
  done
  
  # copyright
  install -Dm644 usr/share/doc/TeighaViewer/copyright \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
  
}
