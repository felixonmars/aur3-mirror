#Maintainer: Mcder3 <mcder3[at]gmail[dot]com>

pkgname=libreoffice-extension-spanish-dictionary
altpkgname=spanish-dictionary
pkgver=1.0
pkgrel=2
pkgdesc="Spanish dictionary from the OpenOffice.org project that works on LibreOffice."
arch=('any')
url="http://extensions.libreoffice.org/extension-center/diccionario-espanol"
license=('LGPL')
depends=('libreoffice-common')
makedepends=('unzip')
source=(http://extensions.libreoffice.org/extension-center/diccionario-espanol/releases/$pkgver/$altpkgname)
md5sums=('a83f46ecae8e7f14e1df762904b43b56')

package() {
  mkdir -p "$pkgdir/usr/lib/libreoffice/share/extensions/$altpkgname/"
  cp -r "$srcdir"/* "$pkgdir/usr/lib/libreoffice/share/extensions/$altpkgname/"
}