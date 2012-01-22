# Maintainer: 
pkgname=libreoffice-extension-lightproof-ru
_pkgname=lightproof-ru_RU
pkgver=0.3.1
pkgrel=1
pkgdesc="Russian grammar checker extension for LibreOffice"
arch=('any')
url="http://extensions.libreoffice.org/extension-center/lightproof-grammar-checker-for-russian"
license=('LGPL')
groups=('libreoffice-extensions')
depends=('libreoffice-common' 'python2')
makedepends=('unzip')
source=(http://extensions.libreoffice.org/extension-center/lightproof-grammar-checker-for-russian/releases/0.3/lightproof-ru_ru-${pkgver}.oxt)
md5sums=('07022e3362c2bcde6cfd7429efaa9040')

package() {
  install -d -m755 "$pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname/pythonpath"
  cp -R "$srcdir"/* "$pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname/"
  rm "$pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname/lightproof-ru_ru-${pkgver}.oxt"

  find "${pkgdir}/usr/lib/libreoffice/share/extensions/$_pkgname/" \( -type d -exec chmod 755 {} \; \) -o \( -type f -exec chmod 644 {} \; \)
}

