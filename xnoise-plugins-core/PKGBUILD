# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=xnoise-plugins-core
pkgver=0.1.13
pkgrel=1
pkgdesc="Plugins for xnoise media player"
arch=('i686' 'x86_64')
url="http://code.google.com/p/xnoise/"
license=('GPL2')
depends=('gstreamer0.10' 'libnotify' 'libsoup' 'libunique' 'taglib' 'xnoise')
makedepends=('intltool' 'pkg-config')
source=(http://xnoise.googlecode.com/files/$pkgname-$pkgver.tar.bz2)
md5sums=('cbe7b6a0a11a4519474f053ad56c194f')


build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure  --prefix=/usr
  make
  make DESTDIR=$pkgdir install
}
