# Contributor: Filip <fila pruda com>

pkgname=adesklet-aanalogue
pkgver=0.1.0
pkgrel=1
pkgdesc="A desklet which displays an analogue clock."
arch=('any')
url="http://adesklets.sourceforge.net/desklets.html"
license=("GPL")
depends=('adesklets')
groups=('adesklet-desklets')
source=(http://prdownloads.sourceforge.net/adesklets/aanalogue-0.1.0.tar.bz2)
md5sums=('c2df74bab5ec7388c07a64dda6b2d539')

package() {
  install -d -m 775 ${pkgdir}/usr/share/adesklets/aanalogue
  chown root:adesklets ${pkgdir}/usr/share/adesklets/aanalogue
  
  cp -a ${srcdir}/aanalogue-$pkgver/* ${pkgdir}/usr/share/adesklets/aanalogue/
  
  sed -i 's|/usr/bin/env python|/usr/bin/env python2|' "${pkgdir}/usr/share/adesklets/aanalogue/aanalogue-0.1.0.py"
}
