# Maintainer: Munzir Taha <munzirtaha@gmail.com>
pkgname=libreoffice-extension-lightproof-ar
_pkgname=lightproof_ar
pkgver=0.3
pkgrel=1
pkgdesc="Arabic grammar checker extension for LibreOffice"
arch=('any')
url="http://tahadz.wordpress.com/2013/02/10/lightproof/"
license=('LGPL')
groups=('libreoffice-extensions')
depends=('libreoffice-common' 'python2')
source=(http://downloads.sourceforge.net/project/ayaspell/lightproof_ar-$pkgver.oxt)
sha256sums=('761389f6cf505e69ad49ca87eb3944d70135efc782efd9c76de64b2977a32027')

package() {
  mkdir -p "$pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname/"
  cp -R "$srcdir"/* "$pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname/"
  rm "$pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname/$_pkgname-$pkgver.oxt"
  find "$pkgdir" -type f -exec chmod 644 {} \;
  find "$pkgdir" -type d -exec chmod 755 {} \;
}
