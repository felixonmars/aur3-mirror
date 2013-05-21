# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=gst-buzztrax-git
pkgver=0.8.0.c29efb3
pkgrel=1
pkgdesc="Buzztrax gstreamer extensions (former Buzztard)"
arch=('i686' 'x86_64')
url="http://www.buzztard.org"
license=('LGPL')
depends=('bml-git' 'fluidsynth' 'gst-plugins-base-git')
makedepends=('git')
provides=("gst-buzztrax=$pkgver" "gst-buzztard=$pkgver")
conflicts=("gst-buzztard{,-svn,-git}" 'gst-buzztrax')
replaces=("gst-buzztard-{svn,git}")
options=('!libtool' '!strip')
source=("$pkgname::git+https://github.com/Buzztrax/gst-buzztrax.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(awk -F '[][]' '/AC_INIT/{print $4}' configure.ac).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$pkgname"
  ./autogen.sh
  ./configure --prefix=/usr \
              --enable-static=no \
              --enable-debug
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" install
}
