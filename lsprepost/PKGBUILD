# Maintainer: Tim Hartman <tbhartman at gmail>
pkgname=lsprepost
pkgver=3.0
pkgrel=1
pkgdesc="Pre- and post-processor for LS-DYNA"
arch=("x86_64")
url=("http://www.lstc.com/lspp")
license=('unknown')
depends=('libjpeg' 'libpng12' 'mesa' 'gtk2' 'libxmu')
makedepends=('chrpath')
source=("${pkgname}-${pkgver}.tgz::ftp://ftp.lstc.com/outgoing/lsprepost/${pkgver}/linux64/${pkgname}-${pkgver}-opensuse11.tgz"
        "${pkgname}"
        "${pkgname}.desktop")
md5sums=('0002e4cb69be339fa75341aa8a0a944e'
         '0e838ce95db0301ba013b52b0038dca5'
         '410f535de0a8838959d784b5c4484133')

build() {
  cd "$srcdir"
  mv `ls | grep ${pkgname}${pkgver}` "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  chrpath -d lsprepost
  
  cd lib
  chrpath -d libLSAF.so.0.0.0
  chrpath -d libLSIO.so.0.0.0
  chrpath -d libLSMA.so.0.0.0
  chrpath -d libLSMD.so.0.0.0
  chrpath -d libLSVI.so.0.0.0
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  cp -r --preserve=all ./lib/* "${pkgdir}/usr/lib/${pkgname}/."
  cp -r --preserve=all "$pkgname" "${pkgdir}/usr/lib/${pkgname}/."
  
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r --preserve=all ./resource/* "${pkgdir}/usr/share/doc/${pkgname}/."
  
  mkdir -p "${pkgdir}/usr/bin"
  cd "${pkgdir}/usr/bin"
  cp "${srcdir}/${pkgname}" .
  chmod 755 "${pkgname}"

  mkdir -p "${pkgdir}/usr/share/applications"
  cd "${pkgdir}/usr/share/applications"
  cp "${srcdir}/${pkgname}.desktop" .

  cd "${pkgdir}/usr/lib"
  ln -s /usr/lib/libjpeg.so libjpeg.so.6
  chmod +x libjpeg.so.6
  ln -s /usr/lib/libjpeg.so libjpeg.so.62
  chmod +x libjpeg.so.62
}

