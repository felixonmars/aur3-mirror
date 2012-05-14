# Maintainer: Zombro <nietmachine at gmail dot com>

pkgname=libvirt-php-git
pkgver=20120514
pkgrel=1
pkgdesc="PHP bindings for libvirt"
arch=('x86_64' 'i686')
url="http://libvirt.org/php/"
license=('GPL')
depends=('libvirt')
makedepends=('gcc' 'git' 'autoconf')
conflicts=('libvirt-php')

_gitroot="git://libvirt.org/libvirt-php.git"
_gitname="libvirt-php"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}
# vim:set ts=2 sw=2 et:
