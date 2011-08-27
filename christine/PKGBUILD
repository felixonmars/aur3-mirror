# Maintainer: kiefer <jorgelmadrid@gmail.com>

pkgname=christine
pkgver=0.7.0
pkgrel=1
pkgdesc="A small audio/video player with streaming support"
arch=('i686' 'x86_64')
url="http://christine-project.org"
license=('GPL')
depends=('gstreamer0.10-python' 'mutagen' 'python-distutils-extra' 'python-notify')
source=(http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2/download)
md5sums=('610ae1e216577b070b9d41437a17fbef')

build() {
  cd "$startdir/src/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$startdir/pkg" install
}
