# Contributor: Chuck Yang <Chuck dot Yang at gmail dot com>

pkgname=python-cairoplot
_pkgname=cairoplot
pkgver=1.1
pkgrel=1
pkgdesc="Python API to plot graphics"
arch=(any)
url="http://launchpad.net/cairoplot"
license=('LGPL')
depends=('python' 'pycairo')
source=(http://launchpad.net/$_pkgname/$pkgver/$pkgver/+download/$_pkgname-$pkgver.tar.gz)
md5sums=('0863d4495d2764e31b033db52de7af3e')

build() {
    cd "$srcdir/$_pkgname-$pkgver"

    install -Dm644 CairoPlot.py $pkgdir/usr/lib/python2.6/site-packages/CairoPlot.py || return 1
}
