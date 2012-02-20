# Former maintainer (0.6): vando <facundo[at]esdebian[dot]org>
# Current maintainer (0.8.2+): psquid <psquid[at]psquid[dot]net>
# Based on https://aur.archlinux.org/packages.php?ID=42734 identicurse (git version)

_pkgmajorver=0.9

pkgname=identicurse
pkgver=0.9
pkgrel=1
pkgdesc="Curses-based identi.ca/status.net client"
arch=('any')
url="http://identicurse.net"
license=('GPL3')
depends=('python2' 'ncurses')
makedepends=('python2-distribute')
#install=(identicurse.install)
source=(http://identicurse.net/release/${_pkgmajorver}/identicurse-$pkgver.tar.gz)
sha256sums=('5f41c4cad0c05cd02ef7ccdba49e3ddfe0b63d43d863f10544c0fbb84091fb46')

build() {

    cd "$srcdir/$pkgname-$pkgver"
  
    msg "Starting make..."

    python2 setup.py install --prefix=/usr --install-data=/usr/share --root="$pkgdir" || return 1
    install -m 644 $srcdir/$pkgname-$pkgver/README "$pkgdir/usr/lib/python2.7/site-packages/identicurse/README" || return 1
    install -m 644 $srcdir/$pkgname-$pkgver/conf/config.json "$pkgdir/usr/lib/python2.7/site-packages/identicurse/config.json" || return 1
} 

