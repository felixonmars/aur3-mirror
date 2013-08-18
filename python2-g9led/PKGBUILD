# Contributor: Philipp Schmitt (philipp@NOSPAM.schmitt.co)

pkgname=python2-g9led
pkgver=1
pkgrel=2
pkgdesc="Logitech G9(X) LED color control utility"
arch=('i686' 'x86_64')
url=('http://als.regnet.cz/logitech-g9-linux-led-color.html' 'https://github.com/pschmitt/g9led')
license=('unknown')
depends=('python2-pyusb')
source=('https://raw.github.com/pschmitt/g9led/master/g9led.py')
sha256sums=('5cf09c08569e414c39a7152dc1ba6b29fd82c94429b4b99d99e1e3a70654cc14')

package() {
  cd "$srcdir"
  mkdir -p $pkgdir/usr/bin
  install -m755 g9led.py $pkgdir/usr/bin
}

