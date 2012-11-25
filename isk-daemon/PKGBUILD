# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=isk-daemon  
pkgver=0.9.3
pkgrel=1 
pkgdesc="Database server capable of adding content-based (visual) image searching"
url="http://www.imgseek.net/isk-daemon"
arch=('i686' 'x86_64')
license=('GPL')
depends=('twisted' 'swig' 'python2-soappy' 'imagemagick')
conflicts=('imgseek')
source=("https://github.com/downloads/ricardocabral/iskdaemon/$pkgname-$pkgver.tar.gz")
md5sums=('5c72efcc62d7470262dae1a2c36af546')
build() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py build
}
package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
