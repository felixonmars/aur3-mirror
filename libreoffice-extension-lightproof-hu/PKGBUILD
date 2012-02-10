# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=libreoffice-extension-lightproof-hu
_pkgname=lightproof_hu
pkgver=1.4.3
pkgrel=1
pkgdesc="Hungarian grammar checker extension for LibreOffice"
arch=('any')
url="http://extensions.services.openoffice.org/project/lightproof-hu_HU"
license=('LGPL')
groups=('libreoffice-extensions')
depends=('libreoffice-common' 'python2')
md5sums=('1ca78ab445f584d69c9caf40260d77c5')
source=(http://www.numbertext.org/lightproof/$_pkgname-$pkgver.oxt)

package() {
  mkdir -p "$pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname/"
  cp -R "$srcdir"/* "$pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname/"
  rm "$pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname/$_pkgname-$pkgver.oxt"
  find "$pkgdir" -type f -exec chmod 644 {} \;
  find "$pkgdir" -type d -exec chmod 755 {} \;
}
