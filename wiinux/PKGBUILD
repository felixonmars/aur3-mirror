# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Israel Herraiz <isra@herraiz.org>
pkgname=wiinux  
pkgver=1.9
pkgrel=3
pkgdesc="Control your dekstop using a Wiimote"
url="http://code.google.com/p/wiimote-pointer/"
arch=(any)
license=('GPL')
depends=('python2' 'python2-matplotlib' 'python-xlib' 'python2-pybluez' 'pygtk' 'xautomation')
makedepends=('sed')
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://wiimote-pointer.googlecode.com/files/Wiinux-${pkgver}.tar.gz)
md5sums=('0672bd2b1f2c061528d638e2bec0882e')

package() {
    cd $srcdir/Wiinux-$pkgver
    sed -i 's|/usr/bin/env python|/usr/bin/env python2|' $pkgname
    python2 setup.py install --root=$pkgdir/ --optimize=1
}
  
