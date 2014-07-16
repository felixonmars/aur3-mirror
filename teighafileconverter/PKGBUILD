# Contributor: David Manouchehri <d@32t.ca>
# Maintainer: josephgbr <rafael.f.f1@gmail.com>

pkgname=teighafileconverter
pkgver=4.00.0
pkgrel=1
pkgdesc="Free cross-platform application for the conversion of .dwg and .dxf files to/from different versions"
arch=('i686' 'x86_64')
url="http://www.opendesign.com/guestfiles/TeighaFileConverter"
license=('custom')
install=${pkgname}.install

if [ $CARCH == i686 ]; then
  depends=('qt4' 'bash' 'hicolor-icon-theme' 'libpng12')
elif [ $CARCH == x86_64 ]; then
  depends=('lib32-qt4' 'bash' 'hicolor-icon-theme' 'lib32-libpng12')
fi

_file=TeighaFileConverter_lnxX86_4.4dll_${pkgver}_i386.deb
source=(http://www.opendesign.com/files/guestdownloads/TeighaFileConverter/$_file)
sha512sums=('4c0daa78ab3a4d012c0a6f563f75dccc6d1c79b404003ef0b022b80c6c113c8fe38c1017568b522d356b33d19c502f98e9f2855b0b6b59fb8965f98c9e0e6ce1')

build() {
  [ ! -d ${pkgname}-${pkgver} ] && mkdir ${pkgname}-${pkgver}
  tar xf data.tar.gz -C ${pkgname}-${pkgver}
}

package() {
  cd ${pkgname}-${pkgver}
  
  # persistent application storage (libs, executables, etc.)
  if [ $CARCH == i686 ]; then
    appstoragedir=usr/lib/teighafileconverter
  elif [ $CARCH == x86_64 ]; then
    appstoragedir=usr/lib32/teighafileconverter
  fi
  for file in $(ls usr/bin/TeighaFileConverter_${pkgver}/); do
    install -Dm755 usr/bin/TeighaFileConverter_${pkgver}/${file} \
        "${pkgdir}/${appstoragedir}/${file}"
  done
  
  # binary
  install -Dm755 usr/bin/TeighaFileConverter \
    "${pkgdir}/usr/bin/teighafileconverter"
  sed -e "s#usr/bin/TeighaFileConverter_${pkgver}#${appstoragedir}#" \
    -i "${pkgdir}/usr/bin/${pkgname}"
  
  # desktop item
  install -Dm644 usr/share/applications/TeighaFileConverter_${pkgver}.desktop \
    "${pkgdir}/usr/share/applications/teighafileconverter.desktop"
  sed -e "s#/TeighaFileConverter#/teighafileconverter#" \
    -i "${pkgdir}/usr/share/applications/teighafileconverter.desktop"
  
  # hicolor icons
  for icon in $(find usr/share/icons -type f); do
    install -Dm644 ${icon} \
        "${pkgdir}/${icon}"
  done
  
  # copyright
  install -Dm644 usr/share/doc/TeighaFileConverter/copyright \
    "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
  
}
