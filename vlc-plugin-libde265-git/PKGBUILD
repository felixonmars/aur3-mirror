# Maintainer: maz_1 < loveayawaka@gmail.com> 
_pkgname=vlc-plugin-libde265
pkgname=${_pkgname}-git
_gitname=vlc-libde265
pkgver=27.0ebaf4b
pkgrel=1
pkgdesc="Libde265 plugin (an open h.265 video codec implementation) for vlc."
arch=('i686' 'x86_64')
url="https://github.com/strukturag/vlc-libde265"
license=('LGPL3')
depends=( "glibc" "libde265-git" "vlc")
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
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $_gitname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  find "$pkgdir" -name "*.la" -delete
  mkdir -p $pkgdir/usr/lib/vlc/plugins/codec
  mv $pkgdir/usr/lib/*.so  $pkgdir/usr/lib/vlc/plugins/codec
}
