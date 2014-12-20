# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>

_commit=3d55371ee7a2524274ff3cdc546c845203ccd8ea
pkgname=lightspark
pkgver=0.7.2.r5369
pkgrel=1
pkgdesc='An alternative Flash Player for Linux.'
arch=('i686' 'x86_64')
url='http://lightspark.sourceforge.net'
license=('GPL3' 'LGPL3')
depends=('gtk2' 'ffmpeg' 'glew' 'curl' 'boost-libs' 'libxml++' 'desktop-file-utils')
makedepends=('cmake' 'nasm' 'xulrunner' 'llvm' 'glproto' 'boost' 'fontconfig')
optdepends=('gnash-gtk: fallback support')
install="$pkgname.install"
#source=(http://launchpad.net/lightspark/trunk/lightspark-$pkgver/+download/lightspark-$pkgver.tar.gz{,.asc}
#md5sums=('f078d505a354fb66dc5b68ad09a2aa81'
#         'SKIP')
source=("https://github.com/lightspark/lightspark/archive/$_commit.tar.gz")
md5sums=('88e6f1e8aaa2ef96c33ecf472f93ce48')

prepare() {
  cd $pkgname-$_commit
  [ -d b ] || mkdir b
}

build() {
  cd $pkgname-$_commit/b
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_BUILD_TYPE=Release \
           -DGNASH_EXE_PATH=/usr/bin/gtk-gnash
  make
}

package() {
  cd $pkgname-$_commit/b
  make DESTDIR="$pkgdir/" install
}
