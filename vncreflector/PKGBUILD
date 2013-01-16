# Maintainer: TDY <tdy@archlinux.info>

pkgname=vncreflector
pkgver=1.2.4
pkgrel=1
pkgdesc="A specialized VNC server that acts as a proxy between a real VNC server and numerous VNC clients"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/vnc-reflector"
license=('BSD')
depends=('libjpeg' 'zlib>=1.1.4')
source=(http://downloads.sourceforge.net/vnc-reflector/vnc_reflector-$pkgver.tar.gz)
md5sums=('c3f88bc62f228b335c25c07f9744ab0c')

build() {
  cd "$srcdir/vnc_reflector"
  make
}

package() {
  cd "$srcdir/vnc_reflector"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}

# vim:set ts=2 sw=2 et:
