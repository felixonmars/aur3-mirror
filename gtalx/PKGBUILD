# Contributor: Adrià Arrufat <swiftscythe@gmail.com>
# Maintainer: Tj H <tj@archlinux.us>
pkgname=gtalx
pkgver=0.0.4
pkgrel=4
pkgdesc="A Linux client for gtalk, the voip application of Google. It supports voice and text-based chat."
arch=('i686' 'x86_64')
url="http://sites.google.com/site/jozsefbekes/Home/gtalx"
license=('GPL')
depends=('qt' 'libogg' 'libtheora' 'sdl' 'libvorbis' 'speex' 'libraw1394'
'expat' 'ortp' 'mediastreamer' 'ilbc')
makedepends=('cmake' 'automoc4')
source=('http://gtalx.svn.sourceforge.net/viewvc/gtalx/0.0.4.tar.gz')
md5sums=('abcf58a7aecba51f0fa0bc5f5c36b063')

build() {
  cd "$srcdir"/$pkgver/
  chmod +x ./make
  ./make || return 1
  install -Dm755 $srcdir/$pkgver/install/bin/call $pkgdir/usr/bin/call
  install -Dm755 $srcdir/$pkgver/install/bin/gtalx $pkgdir/usr/bin/gtalx
  install -Dm755 $srcdir/$pkgver/install/bin/pcp $pkgdir/usr/bin/pcp
  install -Dm644 $srcdir/$pkgver/gtalx.desktop  $pkgdir/usr/share/applications/gtalx.desktop
  cp -r $srcdir/$pkgver/install/share/gtalx $pkgdir/usr/share
}

