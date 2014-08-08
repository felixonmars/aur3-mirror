# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Luka Perkov <archlinux <at> lukaperkov <dOt> net>

pkgname=baresip
pkgver=0.4.11
pkgrel=1
pkgdesc="A portable and modular SIP User-Agent with audio and video support" 
arch=('i686' 'x86_64')
url="http://www.creytiv.com/"
license=('custom:BSD')
depends=('libre>=0.4.9' 'librem>=0.4.5' 'libsrtp' 'ffmpeg' 'ffmpeg-compat'
         'mpg123' 'cairo' 'gstreamer0.10' 'portaudio' 'sdl2' 'spandsp')
source=("http://www.creytiv.com/pub/$pkgname-$pkgver.tar.gz")
md5sums=('bf25d14749ca286716c9b23108472c8a')

build() {
  cd $pkgname-$pkgver
  make PREFIX=/usr
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  # license
  install -Dm644 docs/COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
