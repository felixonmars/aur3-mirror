# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=libreoffice-extension-lightproof-en-us
_pkgname=lightproof_en
pkgver=0.4.2
pkgrel=1
pkgdesc="American English grammar checker extension for LibreOffice"
arch=('any')
url="http://extensions.services.openoffice.org/project/lightproof"
license=('LGPL')
groups=('libreoffice-extensions')
depends=('libreoffice-common' 'python2')
md5sums=('e9e0a69931645d89c60c12b0970fd731')
source=(http://www.numbertext.org/lightproof/$_pkgname-$pkgver.oxt)

package() {
  mkdir -p "$pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname/"
  cp -R "$srcdir"/* "$pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname/"
  rm "$pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname/$_pkgname-$pkgver.oxt"
  find "$pkgdir" -type f -exec chmod 644 {} \;
  find "$pkgdir" -type d -exec chmod 755 {} \;
}
