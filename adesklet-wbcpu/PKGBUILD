# Contributor: Filip <fila pruda com>

pkgname=adesklet-wbcpu
pkgver=0.1.1
pkgrel=2
pkgdesc="A desklet that displays cpu monitor with a graph. It is hightly configurable."
arch=('any')
url="http://adesklets.sourceforge.net/desklets.html"
license=("GPL")
depends=('adesklets' 'pystatgrab')
groups=('adesklet-desklets')
source=(http://prdownloads.sourceforge.net/adesklets/wbcpu-0.1.1.tar.bz2)
md5sums=('9a09ce6166ab4355cce700d8bd5b4f78')

package() {
  install -d -m 775 ${pkgdir}/usr/share/adesklets/wbcpu
  chown root:adesklets ${pkgdir}/usr/share/adesklets/wbcpu
  
  cp -a ${srcdir}/wbcpu-$pkgver/awidget ${pkgdir}/usr/share/adesklets/wbcpu/
  
  install -m 755 ${srcdir}/wbcpu-$pkgver/wbcpu.py ${pkgdir}/usr/share/adesklets/wbcpu/wbcpu.py
  sed -i 's|/usr/bin/env python|/usr/bin/env python2|' "${pkgdir}/usr/share/adesklets/wbcpu/wbcpu.py"
}
