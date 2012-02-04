# Contributor: Valentine Sinitsyn <valentine.sinitsyn@gmail.com>
pkgname=killswitch-manager
pkgver=0.1
pkgrel=1
pkgdesc="This applet controls killswitches and enables you to turn off or on radio devices."
arch=(i686 x86_64)
url="http://qt-apps.org/content/show.php/Killswitch-Manager?content=121359"
license=('GPL')
depends=(qt)
source=(http://qt-apps.org/CONTENT/content-files/121359-$pkgname-$pkgver.src.tar.bz killswitch-manager.desktop killswitch.png)
md5sums=('a48c81edeab4d068cb037107610c9ca1'
         '1a7ef3c4cb202af1f8014590e35faf9e'
         '92782f74ddf2c61a1081b19d3bc0dac2')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  qmake
  make || return 1
  mkdir -p "$pkgdir/usr/bin"
  cp killswitch-manager "$pkgdir/usr/bin" || return 1
  mkdir -p "$pkgdir/usr/share/pixmaps"
  cp "$srcdir/killswitch.png" "$pkgdir/usr/share/pixmaps" || return 1
  mkdir -p "$pkgdir/usr/share/applications"
  cp "$srcdir/killswitch-manager.desktop" "$pkgdir/usr/share/applications" || return 1
}

# vim:set ts=2 sw=2 et:
