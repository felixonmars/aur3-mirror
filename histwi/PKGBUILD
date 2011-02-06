# Maintainer: Your Name <youremail@domain.com>
pkgname=histwi
pkgver=0.6.7
pkgrel=1
pkgdesc="Histwi is linux desktop program for Twitter account management."
arch=('i686')
url="http://originalcoding.com/histwi/"
license=('GPL')
depends=('python' 'gtk2')
#makedepends=()
source=(http://originalcoding.com/$pkgname/$pkgname-$pkgver.tar.gz histwi.desktop)
md5sums=('520269a809461578f237a7a45ed89e63'
         '409a81867bb3dab8d9206b2ddc23141d')

build() {
    return 0
}

package() {
  mkdir -p $pkgdir/usr/share/{histwi,applications}
  mkdir -p $pkgdir/usr/bin/
  
  cp -R $srcdir/$pkgname-$pkgver/* $pkgdir/usr/share/$pkgname/
  chmod +x $pkgdir/usr/share/histwi/histwi.py
  ln -s /usr/share/histwi/histwi.py $pkgdir/usr/bin/$pkgname
  cp $startdir/histwi.desktop $pkgdir/usr/share/applications/
}

# vim:set ts=2 sw=2 et:
