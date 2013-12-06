# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
pkgname=kerkythea
pkgver=2008
_pkgver=2.0.19
pkgrel=3
pkgdesc="Standalone renderer, using physically accurate materials and lights"
arch=('i686' 'x86_64')
url="http://www.kerkythea.net/"
license=('custom')
depends=('libgl' 'gcc-libs')
[ "$CARCH" = "x86_64" ] && depends=('lib32-libxcursor' 'lib32-libgl' 'lib32-libxrandr' 'lib32-gcc-libs')
source=(http://www.kerkythea.net/versions/Kerkythea-v${_pkgver}-Linux.tar.gz \
        kerkythea.desktop kerkythea.sh LICENSE)
md5sums=('0c842188fe159a4e19f153670709baea'
         '0d9d3a3729280c9f40ed7246d913c888'
         '4a5c7511ec9c7117d4e1eb6586413e7a'
         '09db4dda0d41d945e04b211358d3d594')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir"/opt
  cp -r Kerkythea$pkgver "$pkgdir"/opt/$pkgname
  
  install -D -m755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -D -m644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -D -m644 "$srcdir"/Kerkythea$pkgver/kticon.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
