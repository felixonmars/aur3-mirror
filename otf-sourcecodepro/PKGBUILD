# Maintainer: Matt Henkel <guildencrantz@menagerie.cc>
pkgname=otf-sourcecodepro
pkgver=1.013
pkgrel=1
pkgdesc="A set of OpenType fonts that have been designed to work well in user interface (UI) environments."
arch=('any')
url="https://github.com/adobe/Source-Code-Pro"
license=('custom:OFL')
depends=('fontconfig' 'xorg-font-utils')
source=(https://github.com/downloads/adobe/Source-Code-Pro/SourceCodePro_FontsOnly-${pkgver}.zip)
md5sums=('2be9df0e711b4bdbf5c313d8bceb37d7')
install=$pkgname.install

build()
{
  mkdir -p $pkgdir/usr/share/fonts/OTF
  cp ${srcdir}/SourceCodePro_FontsOnly-${pkgver}/OTF/*.otf ${pkgdir}/usr/share/fonts/OTF
  install -D -m644 "${srcdir}/SourceCodePro_FontsOnly-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
