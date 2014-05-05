# Maintainer: maz_1 < loveayawaka@gmail.com> 

pkgname=gstreamer0.10-libde265-git
_gitname=gstreamer0.10-libde265
pkgver=20140504
pkgrel=1
pkgdesc="Open h.265 video codec implementation"
arch=('i686' 'x86_64')
url="https://github.com/strukturag/gstreamer-libde265"
license=('LGPL3')
depends=("libde265" "gstreamer0.10" "gstreamer0.10-bad" "gstreamer0.10-base" "gstreamer0.10-good" "zlib" "bzip2")
makedepends=( 'git')
conflicts=( "$_gitname" )
provides=( "$_gitname" )
# The git repo is detected by the 'git:' or 'git+' beginning. The branch
# 'pacman41' is then checked out upon cloning, expediating versioning:
#source=('git+https://github.com/falconindy/expac.git'
source=( "$_gitname::git+$url" )
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  git describe --always | sed 's|-|.|g'
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
