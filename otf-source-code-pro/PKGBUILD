# Maintainer: Yi Dai <plmday[At]gmail[Dot]com>

pkgname=otf-source-code-pro
pkgver=1.017
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Source Code Pro is a set of OpenType fonts that have been designed to work well in user interface (UI) environments from Adobe."
arch=('any')
url="https://github.com/adobe/Source-Code-Pro"
license=('OFL')
source=("http://downloads.sourceforge.net/project/sourcecodepro.adobe/SourceCodePro_FontsOnly-$pkgver.zip")
install=${pkgname}.install
md5sums=('e59ce4be04d44c22e380865142bad0e3')

package() {
  cd ${srcdir}

  install -d ${pkgdir}/usr/share/fonts/OTF
  install -m644 ${srcdir}/SourceCodePro_FontsOnly-$pkgver/OTF/*.otf ${pkgdir}/usr/share/fonts/OTF/
}

