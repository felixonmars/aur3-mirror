# Contributor: dx <dx@dxzone.com.ar>

pkgname=python-metar
_shortname=metar
pkgver=1.4.0
pkgrel=1
pkgdesc="A python package for interpreting METAR coded weather reports"
arch=(i686 x86_64)
url="https://sourceforge.net/projects/python-metar/"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=(http://downloads.sourceforge.net/$pkgname/$_shortname-$pkgver.tar.gz)
md5sums=('24a4b2f927f61d967802ac7ccb3eb1aa')

build() {
  cd $srcdir/$_shortname-$pkgver
  python setup.py install --root=$pkgdir/ || return 1
}
