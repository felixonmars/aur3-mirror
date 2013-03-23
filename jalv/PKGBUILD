# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=jalv
pkgver=1.4.0
pkgrel=1
pkgdesc="Run an LV2 plugin as a JACK application"
arch=('i686' 'x86_64')
url="http://drobilla.net/software/$pkgname/"
license=('custom:ISC')
depends=('lilv' 'suil')
makedepends=('python2' 'qt4' 'gtk2' 'gtk3' 'gtkmm')
optdepends=('qt4: Qt 4.x frontend'
            'gtk2: Gtk+ 2.x frontend'
            'gtk3: Gtk+ 3.x frontend'
            'gtkmm: Gtk++ 2.x frontend')
source=("http://download.drobilla.net/$pkgname-$pkgver.tar.bz2")
md5sums=('23297b15cb541e0b3c5c05a2fdd9bcca')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 waf configure --prefix=/usr
  python2 waf
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 waf install --destdir="$pkgdir"

  # license
  install -Dm644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
