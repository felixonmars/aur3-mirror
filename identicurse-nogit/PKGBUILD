# Former maintainer (0.6): vando <facundo[at]esdebian[dot]org>
# Current maintainer (0.8.2+): psquid <psquid[at]psquid[dot]net>
# Based on https://aur.archlinux.org/packages.php?ID=42734 identicurse (git version)

pkgname=identicurse-nogit
_pkgname=identicurse
pkgver=0.8
pkgrel=2
pkgdesc="Curses-based identi.ca/status.net client"
arch=('any')
url="http://identicurse.net"
license=('GPL3')
depends=('python2' 'ncurses')
makedepends=('python2-distribute')
#install=(identicurse.install)
source=(http://identicurse.net/release/$pkgver/identicurse-$pkgver.$pkgrel.tar.gz)
sha256sums=('b7f4fdd8eeb955d20cb3f3853db7e692e4792ae49c8336cb80a94f9bfadbf815')

build() {

    cd "$srcdir/$_pkgname-$pkgver"
  
    msg "Starting make..."

    python2 setup.py install --prefix=/usr --install-data=/usr/share --root="$pkgdir" || return 1
    install -m 644 $srcdir/$_pkgname-$pkgver/README "$pkgdir/usr/lib/python2.7/site-packages/identicurse/README" || return 1
    install -m 644 $srcdir/$_pkgname-$pkgver/conf/config.json "$pkgdir/usr/lib/python2.7/site-packages/identicurse/config.json" || return 1
} 

