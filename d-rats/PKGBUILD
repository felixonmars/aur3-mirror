# Maintainer: WB2FKO <mph at sportscliche dot com>
pkgname=d-rats
pkgver=0.3.2
pkgrel=1
pkgdesc="D-STAR Communication Tool"
arch=('any')
url="http://www.d-rats.com/"
license=('unknown')
depends=('python2' 'libxml2' 'python-pyserial' 'python-simplejson' 'python2-feedparser' 'python-lxml' 'pygtk')
options=(!emptydirs)
source=(http://d-rats.danplanet.com/download/v0.3.x/$pkgname-$pkgver.tar.gz
        $pkgname.png)
md5sums=('a28a7a4377bb5b39df2b688a474dcd18'
         '764dd1be35d49c987f6da23ac170371d')

package() {
# Install a menu icon
  cd "$srcdir"
  mkdir -p $pkgdir/usr/share/pixmaps
  install -Dm644  $pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
  cd "$srcdir/$pkgname-$pkgver/share"
  sed -i "s:/usr/share/d-rats/drats2.ico:${pkgname}.png:" ${pkgname}.desktop
  sed -i "s:n=d-rats:n=${pkgname}.png:" ${pkgname}_mapdownloader.desktop
  sed -i "s:n=d-rats:n=${pkgname}.png:" ${pkgname}_repeater.desktop
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root=$pkgdir/ --optimize=1
}

# vim:set ts=2 sw=2 et:
