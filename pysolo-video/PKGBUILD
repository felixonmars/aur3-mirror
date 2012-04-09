# Maintainer: Giorgio Gilestro <giorgio@gilest.ro>

pkgname=pysolo-video
pkgver=1.1
pkgrel=1
pkgdesc="Video extension to pySolo - Tracking motion in Drosophila and other insects"
arch=('i686' 'x86_64')
depends=('python2' 'wxpython' 'python2-scipy' 'python-numpy' 'opencv')
url="http://www.pysolo.net"
license=('GPL')

source=(http://ppa.pysolo.net/pool/main/${pkgname}_${pkgver}.orig.tar.gz ${pkgname}-gui.desktop ${pkgname}-acquire.desktop ${pkgname}.svg)
md5sums=('8b685868f4099e3f26d28dc6c4bfb28e' 'e92aec8a27e4497a311e7f66fe1f4f28' '7040a7fd60266dd2b801059d38208fa0' '7474d568c05651c6816666e9172d337f')

package() {
  cd $srcdir/$pkgname-$pkgver
  sed -i 's/env python/env python2/' pvg.py pvg_acquire.py

  install -d $pkgdir/usr/share/applications
  install -d $pkgdir/opt/pysolo-video
  
  cp -r * $pkgdir/opt/pysolo-video/
  cp $srcdir/*.svg $pkgdir/opt/pysolo-video/
  cp $srcdir/*.desktop $pkgdir/usr/share/applications/
  

}

