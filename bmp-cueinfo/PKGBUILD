# Contributor: Gan Lu <rhythm.gan@gmail.com>

pkgname=bmp-cueinfo
pkgver=0.2.0
pkgrel=1
pkgdesc="Monkey's audio plugin for beep media player"
url="http://sourceforge.net/projects/mac-port/"
depends=('mac' 'bmp')
license=lGPL
source=(http://www.magiclinux.org/people/jiangtao9999/bmp-0.9.7-final/source-tar/$pkgname-$pkgver.tar.bz2)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}

md5sums=('7543b03ba6f2b75e1ce9c4f0115a78f9')
