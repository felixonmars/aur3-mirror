# Maintainer: Sylvain Treutenaere <sylvain.treutenaere at gmail>
pkgname=lsprepost4
pkgver=4.2
pkgrel=1
pkgdesc="Pre- and post-processor for LS-DYNA"
arch=("x86_64")
url=("http://www.lstc.com/lspp")
license=('unknown')
depends=('libjpeg' 'libpng12' 'mesa' 'gtk2' 'libxmu' 'libtiff' 'libxcb')
makedepends=('chrpath')
source=("${pkgname}-${pkgver}.tgz::ftp://ftp.lstc.com/outgoing/lsprepost/${pkgver}/linux64/${pkgname}-${pkgver}-opensuse122.tgz"
        "${pkgname}"
        "${pkgname}.desktop")
md5sums=('601a2d4353104e0062c347fa57474741'
         '0e838ce95db0301ba013b52b0038dca5'
         '76c9bf47dc9bb3576d2af8943bb1420c')

build() {
  cd "$srcdir"
  mv `ls | grep ${pkgname}${pkgver}` "${pkgname}-${pkgver}"
  cd "${pkgname}-${pkgver}"
  chrpath -d lsprepost
  
  cd lib
  chrpath -d libLSAF653.so.0.0.0
  chrpath -d libLSIO653.so.0.0.0
  chrpath -d libLSMA653.so.0.0.0
  chrpath -d libLSMD653.so.0.0.0
  chrpath -d libLSVI653.so.0.0.0
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  mkdir -p "${pkgdir}/usr/lib/${pkgname}"
  cp -r --preserve=all ./lib/* "${pkgdir}/usr/lib/${pkgname}/."
  cp -r --preserve=all "$pkgname" "${pkgdir}/usr/lib/${pkgname}/."
  
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  cp -r --preserve=all ./resource/* "${pkgdir}/usr/share/doc/${pkgname}/."
  
  mkdir -p "${pkgdir}/usr/bin"
  cd "${pkgdir}/usr/bin"
  cp "${srcdir}/${pkgname}-${pkgver}/${pkgname}" .
  chmod 755 "${pkgname}"

  mkdir -p "${pkgdir}/usr/share/applications"
  cd "${pkgdir}/usr/share/applications"
  cp "${srcdir}/${pkgname}.desktop" .
}

