#Maintainer: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=libreoffice-extension-copy-only-visible-cells
__pname=copyvisicells
pkgver=1.1
_pkgver=${pkgver//./-}
pkgrel=1
pkgdesc="This extension provides an alternative to the 'Select Visible Cells' command in Microsoft Excel."
arch=('any')
url="http://extensions.libreoffice.org/extension-center/copy-only-visible-cells"
license=('LGPL2.1')
depends=('libreoffice-still-calc')
groups=('libreoffice-still-extensions')
source=("http://extensions.libreoffice.org/extension-center/copy-only-visible-cells/releases/${pkgver}/${__pname}-${_pkgver}.oxt")
md5sums=('bb3dc38372e04332fe0170a993f421c9')

package() {
  mkdir -p $pkgdir/usr/lib/libreoffice/share/extensions/$__pname
  cp -R * $pkgdir/usr/lib/libreoffice/share/extensions/$__pname
  rm $pkgdir/usr/lib/libreoffice/share/extensions/${__pname}/${__pname}-${_pkgver}.oxt
}
