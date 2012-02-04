# Contributor: Derek 'tetonedge' Tucker <derek at tetonedge.net>

pkgname=vubat
pkgver=0.01
pkgrel=3
pkgdesc="system tray ibam frontend"
arch=('i686' 'x86_64')
url="http://ortling.com/vubat/index.html"
license=('GPL3')
depends=('ibam' 'python' 'pygtk' 'pygobject')
source=(http://ortling.com/vubat/$pkgname-$pkgver.tar.gz)
md5sums=('fafdd137ee589986e29e545f280f5a89')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py build || return 1
  python setup.py install --prefix=$pkgdir/usr
}
