# Maintainer: WillyKaze <willykaze@willykaze.org>
pkgname=librtinfo-git
pkgver=18092012
pkgrel=1
pkgdesc="A small lib (less than 1000 lines of code) able to write basic,
easy-to-use data structures containing system information."
url="https://git.maxux.net/librtinfo/tree/README"
arch=('x86_64' 'i686')
license=('GPLv3')
provides=('librtinfo')
depends=()
conflicts=()
source=()
md5sums=()

_gitname="librtinfo"
_gitroot="git://git.maxux.net/librtinfo"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server..."
  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  cd "${srcdir}/${_gitname}"
  sed -i -e "s/\/usr\/local/usr\/${_gitname}/" config.mk
  make
}

package() {
  cd "${srcdir}/${_gitname}"
  mkdir -p "$pkgdir/usr/lib"
  mkdir -p "$pkgdir/usr/include"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm644 *.so* "$pkgdir/usr/lib/"
  install -Dm644 rtinfo.h "$pkgdir/usr/include"
}

# vim:set ft=sh ts=2 sw=2 et:
