# Maintainer: TDY <tdy@archlinux.info>

pkgname=peppy
pkgver=0.16.0
pkgrel=1
pkgdesc="(ap)Proximated (X)Emacs Powered by PYthon"
arch=('i686' 'x86_64')
url="http://peppy.flipturn.org/"
license=('GPL3')
depends=('wxpython>=2.8')
optdepends=('gdal>=1.4.0: broader range of image formats'
            'mpd: MPD mode'
            'python2-pyenchant>=1.2.0: spell checking support'
            'python2-numpy>=1.0: hyperspectral image view mode'
            'python2-scipy>=0.5.2: extended mathematical functionality')
source=(http://$pkgname.flipturn.org/archive/$pkgname-$pkgver.tar.bz2
        $pkgname.desktop)
sha256sums=('b43dcd8b871b5f30767f34205dd47632c1edc7f9efe7cc11298d1c87bdc87b20'
            'b4afddae488c4157acdeb3965ed60bbe7985f566aa1b6b7a3ab58213379f9ac1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
  install -Dm644 $pkgname/icons/$pkgname.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 ../$pkgname.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}

# vim:set ts=2 sw=2 et:
