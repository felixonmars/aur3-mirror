# Maintainer: Rafael Beraldo <rafaelluisberaldo@gmail.com>

pkgname=gnome-subtitles
pkgver=1.2
pkgrel=1
pkgdesc="Subtitle editor for the GNOME Desktop."
arch=('i686' 'x86_64')
url="http://gnome-subtitles.sourceforge.net/"
license=('GPL')
depends=('gnome-sharp' 'gconf' 'gstreamer0.10-base' 'gtkspell')
makedepends=('gnome-doc-utils' 'intltool')
optdepends=('gstreamer0.10-base-plugins: video playback (or good, bad, ugly plugins)')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('b7f3175b7a189471821d809171121d62') #generate with 'makepkg -g'

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
