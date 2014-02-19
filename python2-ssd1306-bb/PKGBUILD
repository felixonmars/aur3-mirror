pkgname=python2-ssd1306-bb
_pkgname=ssd1306
pkgver=r5.ac177ce7ede2
pkgrel=2
pkgdesc="Python library for driving the SSD1306 OLED display with the BeagleBone Black"
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="http://bitbucket.org/normaldotcom/python2-ssd1306-bb/"
license=('LGPL')
depends=('python2' 'python2-pillow' 'python2-bbio' 'python2-spidev')
makedepends=('mercurial')

source=("$pkgname::hg+http://bitbucket.org/normaldotcom/python2-ssd1306-bb")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd $srcdir/$pkgname
  python2 setup.py build
}

package() {
  cd $srcdir/$pkgname
  python2 setup.py install --root="$pkgdir"
}


