# Maintainer: maz-1 < loveayawaka at gmail dot com> 

_pkgname=gstreamer0.10-plugin-libde265
pkgname=${_pkgname}-git
_gitname=gstreamer0.10-libde265
pkgver=54.v0.1.7.16.g540fae5
pkgrel=1
pkgdesc="Libde265 plugin (an open h.265 video codec implementation) for gstreamer 0.1.Git version."
arch=('i686' 'x86_64')
url="https://github.com/strukturag/gstreamer-libde265"
license=('LGPL3')
depends=("libde265-git" "gstreamer0.10" "gstreamer0.10-bad" "gstreamer0.10-base" "gstreamer0.10-good" "zlib" "bzip2")
makedepends=( 'git')
conflicts=( "$_pkgname" )
provides=( "$_pkgname" )
source=( "$_gitname::git+$url" )
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo "$(git rev-list --count HEAD).$(git describe --always)" | sed 's|-|.|g'
}

build() {
  cd $_gitname
  #autoconf
  ./autogen.sh
  ./configure --prefix=/usr  --enable-gstreamer0.10
  make
}

package() {
  cd $_gitname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  find "$pkgdir" -name "*.la" -delete
}
