# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Tom K <tomk@runbox.com>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Philipp Überbacher <murks at lavabit dot com>

pkgname=clxclient
pkgver=3.6.1
pkgrel=5
pkgdesc="C++ wrapper library around the X Window System API."
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/linuxaudio/downloads/index.html"
license=('LGPL')
depends=('libxft')
makedepends=('clthreads>=2.4.0')
source=("http://kokkinizita.linuxaudio.org/linuxaudio/downloads/$pkgname-$pkgver.tar.bz2")
md5sums=('bd47f80a855d3203fcf10365e79d85e4')

build() {
  cd "$pkgname-$pkgver"
  make PREFIX="$pkgdir/usr" LIBDIR=lib
}

package(){
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/usr/include"
  make PREFIX="$pkgdir/usr" LIBDIR=lib install
}

