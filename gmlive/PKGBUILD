# Maintainer: corvolino <corvolino@archlinux.com.br>

pkgname=gmlive
pkgver=0.22.3
pkgrel=1
pkgdesc="A stream media player, support mms, sopcast, pplive & ppstream."
arch=('i686' 'x86_64')
url="http://code.google.com/p/gmlive/"
license=('GPLv2')
depends=('gtkmm' 'mplayer')
makedepends=('pkgconfig' 'intltool')
conflicts=('gmlive-svn')
source=(http://gmlive.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
md5sums=('7d0da607ad763b0f3e728c98058317b4')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --disable-static || return 1
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

