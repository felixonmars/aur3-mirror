# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=gmidimonitor
pkgver=3.6
pkgrel=1
pkgdesc="A GTK+ application that shows MIDI events."
arch=('i686' 'x86_64')
url="http://home.gna.org/gmidimonitor/"
license=('GPL')
depends=('lash')
makedepends=('python2')
install="$pkgname.install"
source=("http://download.gna.org/$pkgname/$pkgname-$pkgver.tar.bz2"
        "$pkgname.svg::http://upload.wikimedia.org/wikipedia/commons/d/d5/RB_keyboard_icon.svg"
        "$pkgname-alsa.desktop"
        "$pkgname-jack.desktop")
md5sums=('49733d81529cfaed1f7409cfe67b0398'
         'e6e764ea13f2b15a297d8cd62540edf2'
         '989cb55bafbadbbbacee4f8b00cdadf1'
         'ee2a096a5562c6893420b4a159811b48')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 waf configure --prefix=/usr
  python2 waf
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 waf install --destdir="$pkgdir/"

  # pixmaps and desktop file
  install -d "$pkgdir/usr/share/applications"
  install -Dm644 ../$pkgname-{alsa,jack}.desktop \
          "$pkgdir/usr/share/applications"

  install -Dm644 ../$pkgname.svg \
          "$pkgdir/usr/share/pixmaps/$pkgname.svg"
}
